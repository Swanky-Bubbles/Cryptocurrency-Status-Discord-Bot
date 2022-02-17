require('dotenv').config() // Load .env file
const axios = require('axios')
const Discord = require('discord.js')
const client = new Discord.Client({ intents: ["GUILDS"]})


async function getPrices() {

        // API for price data.
        const serverIDs = client.guilds.cache.map(e => { return e.id; }).sort();
        let res = await axios.get(`https://io10.dexscreener.io/u/trading-history/recent/${process.env.HASH}`);
                // If we got a valid response
                if(res.data.tradingHistory[0] && res.data.tradingHistory[0].priceUsd ) {
                        let currentPrice = res.data.tradingHistory[0].priceUsd || 0 // Default to zero

                        serverIDs.forEach(function (item, index){
                                client.user.setActivity(`${process.env.COIN_ID.toUpperCase()} Price`, {type: 'WATCHING'})

                                client.guilds.cache.get(item).me.setNickname(`${process.env.CURRENCY_SYMBOL}${(currentPrice).toLocaleString().replace(/,/g,process.env.THOUSAND_SEPARATOR)}`)
        
                                console.log('Updated price to', currentPrice)
                        });
                        

                }
                else
                        console.log('Could not load player count data for', process.env.COIN_ID)

}

// Runs when client connects to Discord.
client.on('ready', async() => {
        console.log('Logged in as', client.user.tag)

        getPrices() // Ping server once on startup
        // Ping the server and set the new status message every x minutes. (Minimum of 1 minute)
        setInterval(getPrices, Math.max(1, process.env.MC_PING_FREQUENCY || 1) * 60 * 1000)
})

// Login to Discord
client.login(process.env.DISCORD_TOKEN)
