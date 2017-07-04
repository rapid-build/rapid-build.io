# ===========================
# REDIRECT HTTP TO HTTPS
# opts:
#   ignoreHostnames :string[]
#   ignoreRoutes    :string[]
# ===========================
module.exports = (opts={}) ->
	(req, res, next) ->
		return next() if req.secure # 'https'
		opts.ignoreHostnames = opts.ignoreHostnames ? []
		opts.ignoreRoutes    = opts.ignoreRoutes    ? []
		return next() if opts.ignoreHostnames.includes req.hostname
		return next() if opts.ignoreRoutes.includes req.path # req.path doesn't include query string
		method = req.method.toLowerCase()

		# only redirect GET methods
		if ['get','head'].includes method
			redirectUrl = "https://#{req.headers.host}#{req.originalUrl}";
			return res.redirect 301, redirectUrl

		# 'post, put, etc'
		result =
			status: 403
			action: method
			message: 'Please use HTTPS when submitting data to this server.'

		res.status(result.status).json result