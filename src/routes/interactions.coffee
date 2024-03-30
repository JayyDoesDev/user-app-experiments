{ Router } = require "@antibot/server"
{ InteractionResponseType } = require "discord-interactions"
router = Router()

router.post "/interactions", (req, res) ->
    res.send type: InteractionResponseType.PONG if type is InteractionResponseType.PING
    console.log req.body
exports.default = router