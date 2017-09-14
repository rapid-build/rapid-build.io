angular.module('rapid-build').directive 'rbClickaway', ['$rootElement', '$parse',
	($rootElement, $parse) ->
		# LINK
		# ====
		link = (scope, $elm, attrs) ->
			return unless !!attrs.rbClickaway

			# clickaway (cw)
			# =========
			cw =
				active: null # :null | boolean
				fn: $parse attrs.rbClickaway # expression to function

			# handlers
			# ========
			handlers =
				trigger: -> # fires before clickaway
					cw.active = false

				clickaway: (event) ->
					return if cw.active is null # trigger not clicked
					return cw.active = true unless cw.active # trigger clicked
					scope.$apply -> # fire clickaway
						cw.active = null # deactivate clickaway
						cw.fn scope, $event: event

			# listeners
			# =========
			$elm[0].addEventListener 'click', handlers.trigger
			$rootElement[0].addEventListener 'click', handlers.clickaway

			# destroy
			# =======
			scope.$on '$destroy', ->
				$elm[0].removeEventListener 'click', handlers.trigger
				$rootElement[0].removeEventListener 'click', handlers.clickaway

		# API
		# ===
		link: link
		restrict: 'A'
		# rb-clickaway: '&'
]