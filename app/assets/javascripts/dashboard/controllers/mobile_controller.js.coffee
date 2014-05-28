window.MobileController = angular.module 'mobile.controllers', []

window.MobileController
	.controller 'DashCtrl', ['$scope', '$http', 'TweetList', 'UserInfo', ($scope, $http, TweetList, UserInfo) -> 
		TweetList.getPublic()
			.success (data, status, headers) ->
				$scope.tweets = data
				window.base.timeago()
			.finally () ->
				$scope.$broadcast('scroll.refreshComplete')
				window.base.timeago()

		$scope.refresh = () ->
			TweetList.getPublic()
				.success (data, status, headers) ->
					$scope.tweets = data
				.finally () ->
					$scope.$broadcast('scroll.refreshComplete')	
					window.base.timeago()
	]

	.controller 'FriendsCtrl', ['$scope', 'Friends', ($scope, Friends) ->
  		$scope.friends = Friends.all()
  	]

	.controller 'FriendDetailCtrl', ['$scope', '$stateParams', 'Friends', ($scope, $stateParams, Friends) ->
  		$scope.friend = { id: 0, name: '管理员', avatar: "http://bdfzer-auth.qiniudn.com/user_avatar/1/avatar.jpg", phone: '15910364815', email: 'chzsh1995@gmail.com' }
  	]

	.controller 'AccountCtrl', ['$scope', 'CurrentUser', 'UserInfo', '$http', ($scope, CurrentUser, UserInfo, $http) -> 
		$scope.raw_user = CurrentUser.get()
		$scope.user = UserInfo.get()

		$scope.logout = () ->
			$http.delete("/users/sign_out", {}, method: 'DELETE')
	]

	.controller 'SideMenuController', [
		'$scope',
		'$ionicSideMenuDelegate',
		'CurrentUser',
		'$rootScope',
		'$http',
		($scope, $ionicSideMenuDelegate, CurrentUser, $rootScope, $http) ->
			$rootScope.current_user = CurrentUser.get()
			$scope.toggleLeft = () ->
    			$ionicSideMenuDelegate.toggleLeft()
    		$scope.signOut = () ->
				$http.delete("/users/sign_out", {}, method: 'DELETE')
	]