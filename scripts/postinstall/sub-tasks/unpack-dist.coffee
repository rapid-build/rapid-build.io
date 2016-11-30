module.exports = (paths) ->
	path    = require 'path'
	unzip   = require 'extract-zip'
	bufMsgs = require "#{paths.helpers}/buffer-msgs"
	distZip = path.join paths.root, 'dist.zip'
	opts    = dir: paths.root

	# task
	# ====
	runTask = ->
		new Promise (resolve, reject) ->
			unzip distZip, opts, (e) ->
				return reject bufMsgs.getE e if e
				resolve 'Unpacked Dist'

	# run it!
	# =======
	runTask()