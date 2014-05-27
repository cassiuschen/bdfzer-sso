@TweetController = window.App.controller 'TweetController', [
	'$scope',
	'$rootScope',
	'$http',
	'$cookies',
	'CurrentUser',
	'TweetList',
	($scope, $rootScope, $http, $cookies, CurrentUser, TweetList) ->

		#$scope.tweet_list = TweetList.getPublic()
		TweetList.getPublic()
			.success (data, status, headers) ->
				$scope.tweet_list = data
				$('.timeago').timeago()
		#$scope.tweet_list = [{"body":"卧槽= =！这个顺序不科学…………","date":"2014-05-02T12:28:00.639+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"豪爽！！！！！","date":"2014-05-02T12:27:40.726+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"tweet from angular~~~","date":"2014-05-02T12:27:09.894+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"adsfasdfddae","date":"2014-05-02T12:26:27.072+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"uou","date":"2014-05-02T12:02:49.730+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"testtest","date":"2014-05-02T11:55:58.906+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"test","date":"2014-05-02T10:46:02.781+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}},{"body":"Hello World!","date":"2014-05-02T10:45:33.069+08:00","user":{"name":"陈紫晟","avatar":"http://bdfzer-auth.qiniudn.com/user_avatar/21/avatar.jpg"}}]
		#$http (
#			method: 'GET',
#			url: '/api/v1/tweet',
#			params:
#				area: "public",
#				angular_secret: window.secret
#			isArray: true
#		)
#			.success (data, status, headers) ->
#				$scope.tweet_list = data.data
#			.error () ->
#				$rootScope.errors.push
#					content: "error when connect to BDFZer"

		$rootScope.page.title = '新鲜事'

		$rootScope.current_user = CurrentUser.get()

		$rootScope.submit =
			count: 0

		$scope.$watch 'tweet', () ->
			$rootScope.submit.count = $('textarea').val().length

		$scope.create_tweet = () ->
			secret = $scope.secret
			tweet_body = $scope.tweet
			user = $rootScope.current_user.id
			$http.post("/api/v1/tweet.json",{},
							method: 'POST',
							params:
								user: user,
								tweet: tweet_body,
								secret: secret
							,isArray: false).
					success () ->
						$scope.tweet_list.push
							body: $scope.tweet,
							date: "刚刚更新",
							user:
								name: $scope.current_user.name,
								avatar: $scope.current_user.avatar.url
						$rootScope.submit.count = 0
						$scope.tweet = ""
]
