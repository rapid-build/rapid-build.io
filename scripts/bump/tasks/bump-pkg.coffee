module.exports = (paths, rbVersion) ->
	q   = require 'q'
	fse = require 'fs-extra'
	docsConstPath = "#{paths.root}/src/client/scripts/constants/rb-constant.coffee"

	# tasks
	# =====
	api =
		bumpDocPkg: (pkgPath, file) ->
			opts = spaces: 2
			pkg  = require paths[pkgPath]
			pkg.version = rbVersion
			fse.writeJson(paths[pkgPath], pkg, opts).then ->
				"Bumped #{file}"

		getDocsConst: ->
			fse.readFile(docsConstPath).then (data) ->
				needle       = "'"
				contents     = data.toString()
				index1       = contents.lastIndexOf needle
				index2       = contents.lastIndexOf needle, index1 - 1
				constVersion = contents.substring index2 + 1, index1
				contents     = contents.replace constVersion, rbVersion

		bumpDocsConst: (contents) ->
			fse.outputFile(docsConstPath, contents).then ->
				"Bumped client version constant file"

	# run tasks
	# =========
	runTasks = ->
		results = []
		tasks = [
			-> api.bumpDocPkg 'docsPkg', 'package.json'
			(res) ->
				results.push res
				api.bumpDocPkg 'docsPkgLock', 'package-lock.json'
			(res) ->
				results.push res
				api.getDocsConst()
			(contents) ->
				api.bumpDocsConst contents
		]
		tasks.reduce(q.when, q()).then (res) ->
			results.push res
			results.filter(Boolean).join '\n'

	# run it!
	# =======
	runTasks()