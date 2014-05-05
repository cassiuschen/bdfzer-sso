window.MobileController = angular.module 'mobile.controllers', []

window.MobileController
	.controller 'DashCtrl', ['$scope', ($scope) -> ]

	.controller 'FriendsCtrl', ['$scope', 'Friends', ($scope, Friends) ->
  		$scope.friends = Friends.all()
  	]

	.controller 'FriendDetailCtrl', ['$scope', '$stateParams', 'Friends', ($scope, $stateParams, Friends) ->
  		$scope.friend = Friends.get($stateParams.friendId)
  	]

	.controller 'AccountCtrl', ['$scope', 'CurrentUser', 'UserInfo', ($scope, CurrentUser, UserInfo) -> 
		$scope.raw_user = CurrentUser.get()
		$scope.user = UserInfo.get()
]