module.exports = (paths, rbVersion) ->
	path  = require 'path'
	async = require 'asyncawait/async'
	await = require 'asyncawait/await'
	fse   = require 'fs-extra-promise'
	res   = []

	# tasks
	# =====
	tasks =
		bumpDocPkg: ->
			docsPkg = require paths.docsPkg
			docsPkg.version = rbVersion
			fse.writeJsonAsync(paths.docsPkg, docsPkg).then ->
				return "Bumped package.json"

		bumpDocsConst: ->
			docsConstPath = "#{paths.root}/src/client/scripts/constants/rb-constant.coffee"
			promise       = fse.readFileAsync docsConstPath
			promise.then (data) ->
				needle       = "'"
				contents     = data.toString()
				index1       = contents.lastIndexOf needle
				index2       = contents.lastIndexOf needle, index1 - 1
				constVersion = contents.substring index2 + 1, index1
				contents     = contents.replace constVersion, rbVersion
				fse.outputFileAsync(docsConstPath, contents).then ->
					"Bumped client version constant file"

	# run tasks
	# =========
	runTasks = async ->
		res.push await tasks.bumpDocPkg()
		res.push await tasks.bumpDocsConst()
		res.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks()