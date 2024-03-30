{ Router } = require "@antibot/server"
{ InteractionResponseType, verifyKeyMiddleware } = require "discord-interactions"
router = Router()

# had issues with middleware so used the one Discord made
router.post "/interactions", verifyKeyMiddleware process.env.PUBLIC_KEY, (req, res) ->
    res.send type: InteractionResponseType.PONG if req.body.type is InteractionResponseType.PING
exports.default = router