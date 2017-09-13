angular.module('rapid-build').directive 'rbClickaway', ['$rootElement', '$parse',
	($rootElement, $parse) ->
		# Link
		# ====
		link = (scope, $elm, attrs) ->
			return unless !!attrs.rbClickaway

			# flags
			# =====
			clickaway =
				id:     null  # :number | null
				enable: false # :boolean

			# event handlers
			# ==============
			handlers =
				elm: ->
					clickaway.id = scope.$id
					clickaway.enable = true

				rootElm: (event) ->
					return if clickaway.id is null
					return if clickaway.id isnt scope.$id
					return clickaway.enable = false if clickaway.enable
					fn = $parse attrs.rbClickaway
					scope.$apply ->
						fn scope, $event: event
						clickaway.id = null

			# event listeners
			# ===============
			$elm[0].addEventListener 'click', handlers.elm
			$rootElement[0].addEventListener 'click', handlers.rootElm

			# destroy
			# =======
			scope.$on '$destroy', ->
				$elm[0].addEventListener 'click', handlers.elm
				$rootElement[0].removeEventListener 'click', handlers.rootElm

		# API
		# ===
		link: link
		restrict: 'A'
		# rb-clickaway: '&'
]