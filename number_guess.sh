#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"

# username
echo "Enter your username:"
read USERNAME

# Trim spaces from username input
USERNAME=$(echo "$USERNAME" | xargs)

# Get user data
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")

# If user doesn't exist, insert new user
if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL)" >/dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME="N/A"
else
  # Extract user data
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"

  if [[ -z $BEST_GAME || $BEST_GAME == "NULL" ]]; then
    BEST_GAME="N/A"
  fi

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS
  ((GUESSES++))

  # Check if input is a valid integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Check if the guess is too high or too low
  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
   
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Update games table
    $PSQL "INSERT INTO games(user_id, secret_number, number_of_guesses) VALUES($USER_ID, $SECRET_NUMBER, $GUESSES)" >/dev/null

    # Update user's total games played
    ((GAMES_PLAYED++))
    $PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID" >/dev/null

    # Update best game if it's better or if best_game is NULL
    if [[ $BEST_GAME == "N/A" || $GUESSES -lt $BEST_GAME ]]; then
      $PSQL "UPDATE users SET best_game=$GUESSES WHERE user_id=$USER_ID" >/dev/null
    fi

  
    exit 0
  fi
done
