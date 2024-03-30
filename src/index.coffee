{ Server } = require "@antibot/server"
path = require "path"
ngrok = require "ngrok"
{ config } = require "dotenv"
config()
server = new Server
            port: process.env.PORT
            settings:
                routesDirectory: path.join process.cwd(), "js/routes/"
                routesEndpoint: "/"
                debug: true

server.start()
(() -> 
    url = await ngrok.connect addr: process.env.PORT, authtoken: process.env.NGROK
    console.log url
)()
