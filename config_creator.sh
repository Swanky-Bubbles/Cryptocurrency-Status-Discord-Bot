#/bin/bash

read -p "Enter Preferred currency: "

echo PREFERED_CURRENCY=$REPLY > .env

read -p "Enty Preferred Currency Symbol: "

echo CURRENCY_SYMBOL=$REPLY >> .env

read -p "Enty Thousands Seperator: "

echo THOUSAND_SEPARATOR=$REPLY >> .env

read -p "Entry target token name: "

echo COIN_ID=$REPLY >> .env

token_folder="$REPLY-bot/"

service_name="${REPLY}_bot"

read -p "Entry update frequency: "

echo UPDATE_FREQUENCY=$REPLY >> .env

read -p "Entry discord bot ID: "

echo BOT_ID=$REPLY >> .env

read -p "Entry discord bot token: "

echo DISCORD_TOKEN=$REPLY >> .env

read -p "Entry dexscreener hash: "

echo HASH=$REPLY >> .env

parent="$(cd ../; pwd)"

echo "Renaming Folder"

mv $parent/Cryptocurrency-Status-Discord-Bot/ $parent/$token_folder

cd $parent/$token_folder

echo "Installing Modules"

npm i

echo "Installing script as service"

forever-service install $service_name -s discord_bot.js --start
