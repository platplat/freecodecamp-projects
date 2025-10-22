#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0
echo -e "\nGuess the secret number between 1 and 1000:"
read NUMBER_GUESS

CHECK_INPUT() { 
  while [[ ! $NUMBER_GUESS =~ ^[0-9]*$ ]]
  do
    echo "That is not an integer, guess again:"
    read NUMBER_GUESS
  done
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
}

CHECK_INPUT

while [[ $NUMBER_GUESS != $SECRET_NUMBER ]]
do
  if [[ $NUMBER_GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read NUMBER_GUESS
    CHECK_INPUT

  else
    echo "It's lower than that, guess again:"
    read NUMBER_GUESS
    CHECK_INPUT
  fi
done

echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

if [[ -z $USER_ID ]]
then
  # add new user to database
  INSERT_NEW_USER_RESULT=$($PSQL "INSERT INTO users(username,best_game) VALUES('$USERNAME',$NUMBER_OF_GUESSES)")

else
  # increase user's games_played by 1
  INCREASE_GAMES_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1 WHERE user_id=$USER_ID")

  # get best game
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
  
  # check if best score
  if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
  then
    # update best_game
    UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID")
  fi
fi
