window.App.controller 'HomeController', [
	'$scope', 
	'$http', 
	'$cookies', 
	'UserInfo',
	($scope, $http, $cookies, UserInfo) ->
		$scope.data = UserInfo.get()
]