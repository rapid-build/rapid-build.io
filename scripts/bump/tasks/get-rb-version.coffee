module.exports = (paths) ->
	pkgJson = require 'package-json'

	# task
	# ====
	runTask = ->
		pkgJson('rapid-build', 'latest').then (json) ->
			json.version

	# run it!
	# =======
	runTask()