#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# # Do not change code above this line. Use the PSQL variable above to query your database.
# # read DATA
# echo $($PSQL "TRUNCATE TABLE orbit")
# echo $($PSQL "TRUNCATE TABLE system")
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then 
    echo -e "\n$WINNER $OPPONENT"
    # VAR=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    # ARR=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    FIRST=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
    SECOND=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $FIRST && -z $SECOND ]]
    then
      VAR=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER'), ('$OPPONENT')")
      echo -e "\nAdded $WINNER AND $OPPONENT"
      continue
    elif [[ -z $FIRST ]]
    then
      VAR=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo -e "\nAdded $WINNER"
      continue
    elif [[ -z $SECOND ]]
    then
      VAR=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      echo -e "\nAdded $OPPONENT"
    fi
    LINES=$(($PSQL "SELECT
 team_id FROM teams") | wc -l)
    echo -e "\n$LINES"
    
    # $($PSQL "INSERT INTO system(team) VALUES('$WINNER')")
    # $($PSQL "INSERT INTO system(team) VALUES('$OPPONENT')")
    # if [[ -z $VARIABLE ]]
    # then
    #   echo $VARIABLE
    #   echo -e "\nDidn't work"
    # else
    #   echo "$VARIABLE"
    # echo -e "\nAdded $WINNER, AND $OPPONENT"
    # fi
  else
    echo -e "Not today nibs"
    echo -e "\n$YEAR $WINNER $OPPONENT"
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then 
    echo -e "\n$YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'") 
    VARIABLE=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    echo -e "\nAdded $WINNER, AND $OPPONENT"
    echo -e "\nAdded $WINNER_ID, AND $OPPONENT_ID"
    LINES_g=$(($PSQL "SELECT
 game_id FROM games") | wc -l)
    echo -e "\n$LINES_g"
  else
    echo -e "Not today nibs"
    echo -e "\n$YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS"
  fi
done
# read DATA
# cat $DATA | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
# do
#   echo -e "\n$YEAR $ROUND $WINNER $OPPONENT $WINNER_GOALS $OPPONENT_GOALS";
# done