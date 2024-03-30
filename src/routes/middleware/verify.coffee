{ Router } = require "@antibot/server"
{ verifyKey } = require "discord-interactions"
express = require "express"
router = Router()

# coffeescript import of https://github.com/discord/user-install-example/blob/31036f687809d1a09dd910b92a93546a43962009/utils.js#L6
VerifyDiscordRequest = (key) ->
    (req, res, buf, encoding) ->
        signature = req.get "X-Signature-Ed25519"
        timestamp = req.get "X-Signature-Timestamp"
        isValidRequest = verifyKey buf, signature, timestamp, key
        res.status(400).send "Bad request signature" unless isValidRequest

router.use express.json verify: VerifyDiscordRequest key

exports.default = router