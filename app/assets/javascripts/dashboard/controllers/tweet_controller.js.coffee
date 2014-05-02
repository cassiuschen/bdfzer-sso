window.App.controller 'TweetController', [
	'$scope',
	'$http',
	'$cookies',
	'CurrentUser',
	($scope, $http, $cookies, CurrentUser) ->
		$scope.current_user = CurrentUser.get()
		
		window.$scope = $scope
	
		$scope.new_tweets = []

		$scope.create_tweet = () ->
			secret = $scope.secret
			tweet_body = $scope.tweet
			user = $scope.current_user.id
			$http.post("/api/v1/tweet.json",{},
							method: 'POST',
							params:
								user: user,
								tweet: tweet_body,
								secret: secret
							,isArray: false).
					success () ->
						$scope.new_tweets.push
							body: $scope.tweet,
							date: "刚刚更新",
							user_name: $scope.current_user.name,
							user_avatar: "http://bdfzer-auth.qiniudn.com/user_avatar/#{$scope.current_user.id}/avatar.jpg"
]
