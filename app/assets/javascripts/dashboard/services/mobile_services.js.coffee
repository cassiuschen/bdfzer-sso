window.MobileServer = angular.module 'mobile.services', []

window.MobileServer
	.factory 'Friends', () ->
		friends = [
			{ id: 0, name: '管理员', avatar: "http://bdfzer-auth.qiniudn.com/user_avatar/1/avatar.jpg", phone: '159-1036-4815', email: 'chzsh1995@gmail.com' }
		]

		return {
			all: () ->
				friends
		}

		get: (friendId) ->
			friends[friendId]

