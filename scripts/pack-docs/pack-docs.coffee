# =======================
# BUILD DOCS THEN PACK IT
# =======================
module.exports = ->
	path     = require 'path'
	async    = require 'asyncawait/async'
	await    = require 'asyncawait/await'
	res      = []
	dir      = __dirname
	rootPath = path.resolve dir, '..', '..'

	# paths
	# =====
	paths =
		root:     rootPath,
		tasks:    path.join dir, 'tasks'
		helpers:  path.join rootPath, 'scripts', 'helpers'

	# helpers
	# =======
	require("#{paths.helpers}/add-colors")()
	log = require "#{paths.helpers}/log"

	# tasks
	# =====
	cleanDist = require "#{paths.tasks}/clean-dist"
	buildDist = require "#{paths.tasks}/build-dist"
	packDist  = require "#{paths.tasks}/pack-dist"

	# run tasks
	# =========
	runTasks = async ->
		res.push await cleanDist paths
		res.push await buildDist paths # runs rapid-build
		res.push await packDist paths
		res.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks()
	.then (res) ->
		log 'Packed Docs'
		return if !res || typeof res != 'string'
		console.log res.attn
	.catch (e) ->
		log 'Failed to Pack Docs', 'error'
		return if !e || typeof e != 'string'
		console.log e.error