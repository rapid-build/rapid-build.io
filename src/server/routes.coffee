module.exports = (server) ->
	app         = server.app
	httpToHttps = require './middleware/http-to-https'

	# 301 redirect all http get requests to https
	# ===========================================
	do ->
		opts =
			ignoreHostnames: [
				'localhost'
				'jyounce-mac.local'
				'yokun-mac.local'
				'demo.rapid-build.io'
				'staging.rapid-build.io'
			]
		app.use httpToHttps opts