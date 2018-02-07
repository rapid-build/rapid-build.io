module.exports = (paths) ->
	del  = require 'del'
	path = require 'path'
	opts = force: true

	# all besides: package.json & client/ & server/
	delFiles = [
		path.join paths.root, '.slugignore'
		path.join paths.root, 'dist.zip'
		path.join paths.root, 'node_modules'
		path.join paths.root, 'scripts'
	]

	# tasks
	# =====
	runTask = ->
		del(delFiles, opts).then (_paths) ->
			'Cleaned Up Host'

	# run it!
	# =======
	runTask()