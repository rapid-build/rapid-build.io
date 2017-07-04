# ===========================
# REDIRECT HTTP TO HTTPS
# opts:
#   ignoreHostnames :string[]
#   ignoreRoutes    :string[]
# ===========================

# Helpers
# =======
isHttps = (req) ->
	return true if req.secure # first check if directly requested via https
	# for hosts like heroku that use reverse proxies which offer
	# SSL endpoints but then forward unencrypted HTTP traffic to the website
	(req.headers['x-forwarded-proto'] or '').substring(0,5) is 'https'

# Export It!
# ==========
module.exports = (opts={}) ->
	(req, res, next) ->
		return next() if isHttps req
		opts.ignoreHostnames = opts.ignoreHostnames or []
		opts.ignoreRoutes    = opts.ignoreRoutes    or []
		return next() if opts.ignoreHostnames.includes req.hostname
		return next() if opts.ignoreRoutes.includes req.path # req.path doesn't include query string
		method = req.method.toLowerCase()

		# only redirect GET methods
		if ['get','head'].includes method
			host = req.headers['x-forwarded-host'] or req.headers.host
			redirectUrl = "https://#{host}#{req.originalUrl}"
			return res.redirect 301, redirectUrl

		# 'post, put, etc'
		result =
			status: 403
			action: method
			message: 'Please use HTTPS when submitting data to this server.'

		res.status(result.status).json result