window.App.controller 'TweetListController', [
	'$scope', 
	'$http', 
	'$cookies', 
	'UserInfo',
	($scope, $http, $cookies, UserInfo) ->
		$scope.data = UserInfo.get()
]