#/bin/bash

read -p "Enter Preferred currency: " 

echo PREFERED_CURRENCY=$REPLY > .env

read -p "Enty Preferred Currency Symbol: " 

echo CURRENCY_SYMBOL=$REPLY >> .env

read -p "Enty Thousands Seperator: " 

echo THOUSAND_SEPARATOR=$REPLY >> .env

read -p "Entry target token name: " 

echo COIN_ID=$REPLY >> .env

read -p "Entry update frequency: " 

echo UPDATE_FREQUENCY=$REPLY >> .env

read -p "Entry discord bot ID: " 

echo BOT_ID=$REPLY >> .env

read -p "Entry discord bot token: " 

echo DISCORD_TOKEN=$REPLY >> .env

read -p "Entry dexscreener hash: " 

echo HASH=$REPLY >> .env
