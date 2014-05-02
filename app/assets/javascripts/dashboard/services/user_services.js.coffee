window.UserServer = angular.module 'UserServer', [
	'ngResource'
]

window.UserServer.factory 'CurrentUser', ['$resource', ($resource) ->
	$resource "api/v1/angular/current_info.json", {},
		query:
			method: 'GET'
]

window.UserServer.factory 'UserInfo', ['$resource', '$http', ($resource, $http) ->
	$resource "api/v1/angular/user.json", {},
		get:
			method: 'GET',
			params:
				angular_secret: window.secret
			,isArray: false
]
