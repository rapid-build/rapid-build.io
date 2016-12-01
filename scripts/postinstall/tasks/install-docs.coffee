module.exports = (paths) ->
	async = require 'asyncawait/async'
	await = require 'asyncawait/await'
	res   = []

	# tasks
	# =====
	unpackDist = require "#{paths.tasks}/unpack-dist"

	# run tasks
	# =========
	runTasks = async ->
		res.push await unpackDist paths
		res.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks()