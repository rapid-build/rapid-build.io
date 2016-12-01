module.exports = (paths) ->
	path    = require 'path'
	zipdir  = require 'zip-dir'
	bufMsgs = require "#{paths.helpers}/buffer-msgs"
	distDir = path.join paths.root, 'dist'
	distZip = path.join paths.root, 'dist.zip'
	opts    = saveTo: distZip

	# task
	# ====
	runTask = ->
		new Promise (resolve, reject) ->
			zipdir distDir, opts, (e, buffer) ->
				return reject bufMsgs.getE e if e
				resolve 'Packed Dist: Created dist.zip'

	# run it!
	# =======
	runTask()
