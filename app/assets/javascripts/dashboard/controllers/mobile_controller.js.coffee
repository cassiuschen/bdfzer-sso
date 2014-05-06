window.MobileController = angular.module 'mobile.controllers', []

window.MobileController
	.controller 'DashCtrl', ['$scope', '$http', 'FeedList', 'UserInfo', ($scope, $http, FeedList, UserInfo) -> 
		#$scope.feeds = FeedList.getList()
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