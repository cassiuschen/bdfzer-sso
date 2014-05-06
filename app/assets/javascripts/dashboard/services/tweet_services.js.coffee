window.UserServer = angular.module 'TweetServer', [
	'ngResource'
]

window.UserServer.factory 'CurrentUser', ['$http', ($http) ->
	list = $http
	 	method: 'GET',
	 	url: "/api/v1/feed/#{current_user.pku_id}.json",
	 	isArray: true
]

window.UserServer.factory 'UserInfo', ['$resource', '$http', ($resource, $http) ->
	$resource "api/v1/angular/user.json", {},
		get:
			method: 'GET',
			params:
				angular_secret: window.secret
			,isArray: false
]