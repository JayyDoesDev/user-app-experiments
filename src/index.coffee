{ Server } = require "@antibot/server"
path = require "path"
console.log path.join process.cwd(), "js/routes/" 
server = new Server
            port: 3000
            settings:
                routesDirectory: path.join process.cwd(), "js/routes/"
                routesEndpoint: "/"
                debug: true

server.start()