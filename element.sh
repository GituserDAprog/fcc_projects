#! /bin/bash

# PERIODIC TABLE CONSULTER

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
# ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
# echo "$ATOMIC_NUMBER_FORMATTED OLAA"


if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^-?[0-9]+$ ]];
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'")
    if [[ $ATOMIC_NUMBER ]];
    then
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
      ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')
      ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
      ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')
      PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$1")
      TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id = properties.type_id WHERE atomic_number=$1")
      TYPE_FORMATTED=$(echo $TYPE | sed 's/ |/"/')
      echo "$PROPERTIES" | while read NUMBER BAR MASS BAR MELTING BAR BOILING BAR TYPE_ID
      do
      echo "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $TYPE_FORMATTED, with a mass of $MASS amu. $ELEMENT_NAME_FORMATTED has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    else
      echo "I could not find that element in the database."
    fi
  else
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'")
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'")
    if [[ $ELEMENT_SYMBOL ]];
    then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")
    ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')
    ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
    ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id = properties.type_id WHERE atomic_number=$ATOMIC_NUMBER")
    TYPE_FORMATTED=$(echo $TYPE | sed 's/ |/"/')
    echo "$PROPERTIES" | while read NUMBER BAR MASS BAR MELTING BAR BOILING BAR TYPE_ID
    do
      echo "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $TYPE_FORMATTED, with a mass of $MASS amu. $ELEMENT_NAME_FORMATTED has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
    elif [[ $ELEMENT_NAME ]];
    then 
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
      ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$1'")
      ELEMENT_SYMBOL_FORMATTED=$(echo $ELEMENT_SYMBOL | sed 's/ |/"/')
      ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/ |/"/')
      ELEMENT_NAME_FORMATTED=$(echo $ELEMENT_NAME | sed 's/ |/"/')
      PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
      TYPE=$($PSQL "SELECT types.type FROM types FULL JOIN properties ON types.type_id = properties.type_id WHERE atomic_number=$ATOMIC_NUMBER")
      TYPE_FORMATTED=$(echo $TYPE | sed 's/ |/"/')
      echo "$PROPERTIES" | while read NUMBER BAR MASS BAR MELTING BAR BOILING BAR TYPE_ID
      do
        echo "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $ELEMENT_NAME_FORMATTED ($ELEMENT_SYMBOL_FORMATTED). It's a $TYPE_FORMATTED, with a mass of $MASS amu. $ELEMENT_NAME_FORMATTED has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
      else
        echo "I could not find that element in the database."
    fi
  fi
fi
