#! /bin/bash

# ~~ Guess the number script for users ~~

# Setting up variable to querying the database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generating random number for user to guess
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompting user for username
echo "Enter your username:"
read USERNAME
if [[ -z $USERNAME ]]
then
  exit
fi
# Querying database for user info
USER_DATA=$($PSQL "SELECT * FROM number_guess WHERE username='$USERNAME'")
CURRENT_GUESS=0

# Greeting the user whether there is already a record of him or not

if [[ -z $USER_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

while [[ ! $USER_GUESS =~ ^[0-9]+$ ]] 
do
  echo "That is not an integer, guess again:"
  read USER_GUESS
done
  while [[ $USER_GUESS != $RANDOM_NUMBER ]]
  do
    if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
    then
      (( CURRENT_GUESS++ ))
      echo "It's lower than that, guess again:"
      read USER_GUESS
      while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
      do
        echo "That is not an integer, guess again:"
        read USER_GUESS
      done
    else
      (( CURRENT_GUESS++ ))
      echo "It's higher than that, guess again:"
      read USER_GUESS
      while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
      do
        echo "That is not an integer, guess again:"
        read USER_GUESS
      done
    fi
  done
(( CURRENT_GUESS++ ))

echo "You guessed it in $CURRENT_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"

if [[ -z $USER_DATA ]]
then
 INSERT=$($PSQL "INSERT INTO number_guess(username, games_played, best_game) VALUES('$USERNAME', 1, $CURRENT_GUESS)")
else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM number_guess WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM number_guess WHERE username='$USERNAME'")
    if [[ $BEST_GAME > $CURRENT_GUESS ]]
    then
      $BEST_GAME=$CURRENT_GUESS
    fi
    (( GAMES_PLAYED++ ))
    UPDATEA=$($PSQL "UPDATE number_guess SET games_played = $GAMES_PLAYED WHERE username='$USERNAME'")
    UPDATEB=$($PSQL "UPDATE number_guess SET best_game = $BEST_GAME WHERE username='$USERNAME'")
fi

