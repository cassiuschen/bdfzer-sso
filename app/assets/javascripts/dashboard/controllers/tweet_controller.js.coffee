@TweetController = window.App.controller 'TweetController', [
	'$scope',
	'$rootScope',
	'$http',
	'$cookies',
	'CurrentUser',
	($scope, $rootScope, $http, $cookies, CurrentUser) ->

		window.$scope = $scope

		$rootScope.page.title = '新鲜事'

		$rootScope.current_user = CurrentUser.get()

		$rootScope.submit =
			count: 0

		$scope.new_tweets = []

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
						$scope.new_tweets.push
							body: $scope.tweet,
							date: "刚刚更新",
							user_name: $scope.current_user.name,
							user_avatar: $scope.current_user.avatar.url
						$rootScope.submit.count = 0
						$scope.tweet = ""
]
@TweetController.$inject = ['$scope', '$http', '$cookies', 'CurrentUser']
