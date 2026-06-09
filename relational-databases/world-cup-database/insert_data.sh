#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

TRUNCATE_RESULT=$($PSQL "TRUNCATE teams, games RESTART IDENTITY")
if [[ $TRUNCATE_RESULT != 'TRUNCATE TABLE' ]]
then
  echo Error clearing tables
fi

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then

    # find winner team_id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if winner not found, then add to teams and output message to confirm
    if [[ -z $WINNER_TEAM_ID ]]
    then
      ADD_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $ADD_WINNER_RESULT == 'INSERT 0 1' ]]
      then
        echo Added $WINNER to teams
      fi
    fi

    # find opponent team_id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if opponent not found, then add to teams and output message to confirm
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      ADD_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $ADD_OPPONENT_RESULT == 'INSERT 0 1' ]]
      then
        echo Added $OPPONENT to teams
      fi
    fi
    #echo $YEAR $ROUND $WINNER_TEAM_ID $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS
    #INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS)")

  fi
done

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then

    # find winner team_id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # find opponent team_id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo Added $YEAR $ROUND result to games
    fi

  fi
done
