module.exports = (paths) ->
	pkgJson = require 'package-json'

	# task
	# ====
	runTask = ->
		new Promise (resolve, reject) ->
			pkgJson('rapid-build', 'latest').then (json) ->
				resolve json.version

	# run it!
	# =======
	runTask()