window.UserServer = angular.module 'FeedServer', [
	'ngResource',
	'UserServer'
]

window.UserServer.factory 'FeedList', ['$http','UserInfo', ($http, UserInfo) ->
	#@current_user = UserInfo.get()
	#id = window.CurrentUser.user.pku_id
	getList = (id) ->
		$http
	 		method: 'GET',
	 		url: "/api/v1/feed/#{id}.json",
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