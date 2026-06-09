#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Hair Salon ~~~"

MAIN_MENU() {

  echo -e "\n$1\n"

  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID_SELECTED ]]
  then
    MAIN_MENU "You have entered an invalid service number.\nPlease try again."
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo -e "\nYou have chosen $(echo $SERVICE_NAME | sed -r 's/^ *| *$//')."
    
    echo "Please enter your phone number:"
    read CUSTOMER_PHONE
    
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo "Please enter your name:"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi

    echo -e "\nHello, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//')!"
    echo "What time would you like to book your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//') for?"
    read SERVICE_TIME
    
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    if [[ $INSERT_APPOINTMENT_RESULT = 'INSERT 0 1' ]]
    then
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//')."
      echo "Thank you for booking with us. Goodbye."
    else
      echo "There was an issue adding the appointment. Please try again or contact support for help."
    fi
  fi
}

MAIN_MENU "Welcome! Please enter the number of the required service:"