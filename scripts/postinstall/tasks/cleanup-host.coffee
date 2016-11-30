module.exports = (paths) ->
	del  = require 'del'
	path = require 'path'
	opts = force: true

	# all besides: package.json & client/ & server/
	delFiles = [
		path.join paths.root, '.gitignore'
		path.join paths.root, '.travis.yml'
		path.join paths.root, 'README.md'
		path.join paths.root, 'dist.zip'
		path.join paths.root, 'node_modules'
		path.join paths.root, 'scripts'
	]

	# tasks
	# =====
	runTask = ->
		new Promise (resolve, reject) ->
			del(delFiles, opts).then (paths) ->
				resolve 'Cleaned Up Host'

	# run it!
	# =======
	runTask()