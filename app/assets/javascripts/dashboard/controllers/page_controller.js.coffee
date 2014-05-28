window.App.controller 'PageNavController', [
	'$scope',
	'$rootScope', 
	'$http', 
	'$cookies', 
	'UserInfo',
	($scope, $rootScope, $http, $cookies, UserInfo) ->
		$rootScope.page = 
			title: "北附人",
			version: "3.0.5.1"
		$rootScope.errors = []
]