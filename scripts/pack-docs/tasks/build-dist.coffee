module.exports = (paths) ->
	exec    = require('child_process').exec
	bufMsgs = require "#{paths.helpers}/buffer-msgs"
	cmd     = 'rapid-build prod'

	# task
	# ====
	runTask = ->
		new Promise (resolve, reject) ->
			exec cmd, {}, (e, stdout, stderr) ->
				msgs = bufMsgs.get e, stdout, stderr
				return reject msgs.e if e
				res  = msgs.stds or 'Prod Built'
				resolve res

	# run it!
	# =======
	runTask()