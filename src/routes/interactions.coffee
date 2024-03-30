{ Router } = require "@antibot/server"
{ InteractionResponseType, verifyKeyMiddleware, InteractionType } = require "discord-interactions"
router = Router()

# had issues with middleware so used the one Discord made
router.post "/interactions", verifyKeyMiddleware process.env.PUBLIC_KEY, (req, res) ->
    console.log res
    { type, data } = req.body
    res.send type: InteractionResponseType.PONG if type is InteractionType.PING
    if type is InteractionType.APPLICATION_COMMAND
        { name } = data
        if name is "ping"
            return res.send 
                        type: InteractionResponseType.CHANNEL_MESSAGE_WITH_SOURCE
                        data: content: "pong"
exports.default = router