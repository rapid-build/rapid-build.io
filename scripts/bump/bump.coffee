# ===============================
# BUMP VERSION THEN RUN CHANGELOG
# ===============================
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
		root:    rootPath,
		tasks:   path.join dir, 'tasks'
		helpers: path.join rootPath, 'scripts', 'helpers'
		docsPkg: path.join rootPath, 'package.json'

	# docs package.json
	# =================
	docsVersion = require(paths.docsPkg).version

	# helpers
	# =======
	require("#{paths.helpers}/add-colors")()
	log = require "#{paths.helpers}/log"

	# tasks
	# =====
	getRbVersion = require "#{paths.tasks}/get-rb-version"
	bumpPkg      = require "#{paths.tasks}/bump-pkg"

	# run tasks
	# =========
	runTasks = async ->
		rbVersion = await getRbVersion paths # latest version
		skipMsg   = "Bump Skipped: rapid build's latest version v#{rbVersion} is the same as doc's"
		return skipMsg if rbVersion is docsVersion
		res.push "Version: #{rbVersion}"
		res.push await bumpPkg paths, rbVersion
		res.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks()
	.then (res) ->
		log 'Docs Bumped'
		return if !res || typeof res != 'string'
		console.log res.attn
	.catch (e) ->
		log 'Bump Failed', 'error'
		return if !e || typeof e != 'string'
		console.log e.error