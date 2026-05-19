#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

# TEST=$($PSQL "SELECT * FROM services")
# echo $TEST

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can i help you?\n"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES_OPTIONS=$($PSQL "SELECT * FROM services")

  echo "$SERVICES_OPTIONS" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED -ge 1 && $SERVICE_ID_SELECTED -le 6 ]]
  then
    APPOINT_OPTION
  else
    MAIN_MENU "I could not find that service. What would you like today?"
  fi

}
APPOINT_OPTION() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  PHONE=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $PHONE ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERTION=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  #   echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  #   read SERVICE_TIME
  #   CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = $CUSTOMER_PHONE")
  #   VAR=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
  #   echo -e "\nI have put you down for a cut at 10:30, $CUSTOMER_NAME."
  # else
  fi
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed 's/ |/"/')
  echo -e "\nWhat time would you like your cut, $NAME_FORMATTED?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  VAR=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  SERVICE_FORMATTED=$(echo $SERVICE | sed 's/ |/"/')
  SERVICE_TIME_FORMATTED=$(echo $SERVICE_TIME | sed 's/ |/"/')
  echo -e "\nI have put you down for a $SERVICE_FORMATTED at $SERVICE_TIME_FORMATTED, $NAME_FORMATTED."

}
MAIN_MENU