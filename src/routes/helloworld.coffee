{ Router } = require "@antibot/server"

router = Router()

router.get "/", (req, res) -> res.send "Hello World"

exports.default = router