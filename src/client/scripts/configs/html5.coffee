angular.module('rapid-build').config ['$locationProvider'
	($locationProvider) ->
		$locationProvider.html5Mode
			enabled: true
			requireBase: false
]