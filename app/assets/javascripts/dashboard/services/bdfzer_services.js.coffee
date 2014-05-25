window.BDFZerServer = angular.module 'BDFZerServer', [
	'ngResource'
]

window.BDFZerServer.factory 'TweetList', ['$http', ($http) ->
	getPublicList = () ->
		$http
			method: 'GET',
			url: '/api/v1/tweet',
			params:
				area: "public",
				angular_secret: window.secret
			isArray: true

	getUserList = (userID) ->
		$http
			method: 'GET',
			url: "/api/v1/tweet/#{userID}",
			params:
				area: "personal",
				angular_secret: window.secret
			isArray: true
	return {
		getPublic : () ->
			getPublicList()
		#getPersonal : (id) ->
			#$getUserList(id)
	}
]