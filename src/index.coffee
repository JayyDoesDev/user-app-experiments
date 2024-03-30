{ Server } = require "@antibot/server"
path = require "path"
ngrok = require "ngrok"
{ config } = require "dotenv"
config()
{ Interactions, ApplicationCommandType, InteractionContextType, IntegrationType } = require "@antibot/interactions"

interactions = new Interactions
                    publicKey: process.env.PUBLIC_KEY
                    botID: process.env.BOT_ID
                    botToken: process.env.TOKEN
                    debug: true
commands = [
    name: "ping"
    type: ApplicationCommandType.CHAT_INPUT
    description: "pong"
    contexts: [InteractionContextType.BOT_DM, InteractionContextType.GUILD, InteractionContextType.PRIVATE_CHANNEL]
    integration_types: [IntegrationType.USER_INSTALL, IntegrationType.GUILD_INSTALL]
]

server = new Server
            port: process.env.PORT
            settings:
                routesDirectory: path.join process.cwd(), "js/routes/"
                routesEndpoint: "/"
                debug: true

server.start()
(() ->
    await interactions.overwriteGlobalCommands commands
    url = await ngrok.connect addr: process.env.PORT, authtoken: process.env.NGROK
    console.log url
)()
