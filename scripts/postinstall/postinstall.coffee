# ======================
# DOCS SITE POST INSTALL
# ======================
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
		subTasks: path.join dir, 'sub-tasks'
		helpers:  path.join rootPath, 'scripts', 'helpers'

	# helpers
	# =======
	require("#{paths.helpers}/add-colors")()
	log = require "#{paths.helpers}/log"

	# tasks
	# =====
	installDocs = require "#{paths.tasks}/install-docs"
	cleanupHost = require "#{paths.tasks}/cleanup-host"

	# run tasks
	# =========
	runTasks = async ->
		res.push await installDocs paths
		res.push await cleanupHost paths
		res.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks()
	.then (res) ->
		log 'Installed Docs'
		return if !res || typeof res != 'string'
		console.log res.attn
	.catch (e) ->
		log 'Failed to Install Docs', 'error'
		return if !e || typeof e != 'string'
		console.log e.error