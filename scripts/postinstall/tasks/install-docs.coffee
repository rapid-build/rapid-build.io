module.exports = (paths) ->
	# tasks
	# =====
	unpackDist = require "#{paths.tasks}/unpack-dist"

	# run tasks
	# =========
	runTasks = ->
		unpackDist(paths).then (res) ->
			res

	# run it!
	# =======
	runTasks()