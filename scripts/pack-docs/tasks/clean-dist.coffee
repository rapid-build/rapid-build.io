module.exports = (paths) ->
	del  = require 'del'
	path = require 'path'
	opts = force: true
	delFiles = [
		path.join paths.root, 'dist'
		path.join paths.root, 'dist.zip'
	]

	# task
	# ====
	runTask = ->
		new Promise (resolve, reject) ->
			del(delFiles, opts).then (_paths) ->
				resolve 'Cleaned Dist Directory and Zip File'

	# run it!
	# =======
	runTask()