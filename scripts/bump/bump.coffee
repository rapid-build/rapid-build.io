# ===============================
# BUMP VERSION THEN RUN CHANGELOG
# ===============================
module.exports = ->
	q        = require 'q'
	path     = require 'path'
	dir      = __dirname
	rootPath = path.resolve dir, '..', '..'

	# paths
	# =====
	paths =
		root:        rootPath,
		tasks:       path.join dir, 'tasks'
		helpers:     path.join rootPath, 'scripts', 'helpers'
		docsPkg:     path.join rootPath, 'package.json'
		docsPkgLock: path.join rootPath, 'package-lock.json'

	# docs package.json
	# =================
	docsVersion = require(paths.docsPkg).version

	# helpers
	# =======
	log = require "#{paths.helpers}/log"

	# tasks
	# =====
	api =
		bumpPkg:      require "#{paths.tasks}/bump-pkg"
		getRbVersion: require "#{paths.tasks}/get-rb-version"

	# run tasks
	# =========
	runTasks = ->
		results = []
		tasks = [
			-> api.getRbVersion paths # latest version rapid-build
			(rbVersion) ->
				skipMsg = "Bump Skipped: rapid build's latest version v#{rbVersion} is the same as doc's"
				return q skipMsg if rbVersion is docsVersion
				results.push "Version: #{rbVersion}"
				api.bumpPkg paths, rbVersion
		]
		tasks.reduce(q.when, q()).then (res) ->
			results.push res
			results.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks().then (res) ->
		log 'Docs Bumped'
		return if !res || typeof res != 'string'
		console.log res.attn
	.catch (e) ->
		log 'Bump Failed', 'error'
		console.error e if e