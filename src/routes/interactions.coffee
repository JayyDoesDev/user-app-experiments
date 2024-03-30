{ Router } = require "@antibot/server"
{ InteractionResponseType } = require "discord-interactions"
router = Router()

router.post "/interactions", (req, res) ->
    console.log req.body
    res.send type: InteractionResponseType.PONG if req.body.type is InteractionResponseType.PING
    console.log req.body
exports.default = router