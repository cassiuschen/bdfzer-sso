# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
# require jquery_ujs
# require turbolinks
# require semantic-ui
#= require angular
#= require angular-animate
#= require angular-resource
#= require angular-touch
#= require angular-sanitize
#= require angular-cookies
#= require ionic/ionic
#= require ionic/angular-ui/angular-ui-router
#= require ionic/ionic-angular
#= require_self
#= require ./dashboard/mobile_app
#= require ./dashboard/services/mobile_services
#= require ./dashboard/controllers/mobile_controller
#= require_tree ../templates
window.secret = "<%= $app_config['angular_secret'] %>"

$ ->
	#window.base.Init()
	


