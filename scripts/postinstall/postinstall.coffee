# ======================
# DOCS SITE POST INSTALL
# ======================
module.exports = ->
	q        = require 'q'
	path     = require 'path'
	dir      = __dirname
	rootPath = path.resolve dir, '..', '..'

	# paths
	# =====
	paths =
		root:    rootPath,
		tasks:   path.join dir, 'tasks'
		helpers: path.join rootPath, 'scripts', 'helpers'

	# helpers
	# =======
	log = require "#{paths.helpers}/log"

	# tasks
	# =====
	api =
		installDocs: require "#{paths.tasks}/install-docs"
		cleanupHost: require "#{paths.tasks}/cleanup-host"

	# run tasks
	# =========
	runTasks = ->
		results = []
		tasks = [
			-> api.installDocs paths
			(res) ->
				results.push res
				api.cleanupHost paths
		]
		tasks.reduce(q.when, q()).then (res) ->
			results.push res
			results.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks().then (res) ->
		log 'Installed Docs'
		return if !res || typeof res != 'string'
		console.log res.attn
	.catch (e) ->
		log 'Failed to Install Docs', 'error'
		console.error e if e