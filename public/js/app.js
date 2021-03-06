'use strict';

var KiteApp = angular.module('KiteApp', ['ngRoute', 'KiteControllers', 'KiteServices', 'google-maps', 'ngDisqus']);

window.disqus_shortname = 'kiteapp';

KiteApp.config(['$routeProvider', '$locationProvider', '$disqusProvider',
	function($routeProvider, $locationProvider, $disqusProvider) {
		$routeProvider.when('/', {
			templateUrl: 'html/activities/main_list.html',
			controller: 'ActivitiesCtrl'
		}).
		when('/users/:id', {
			templateUrl: 'html/users/profile.html',
			controller: 'UsersCtrl'
		}).
		when('/auth/login', {
			templateUrl: 'html/auth/login.html',
			controller: 'AuthCtrl'
		}).
		when('/activities/add', {
			templateUrl: 'html/activities/add.html',
			controller: 'ActivitiesCtrl'
		}).
		// when('/collections/print', {
		// 	templateUrl: HOST + 'html/collections/print.html',
		// 	controller: 'PrintsCtrl'
		// }).
		when('/activities/:id', {
			templateUrl: 'html/activities/details.html',
			controller: 'ActivitiesCtrl'
		}).
		// when('/collections/labels', {
		// 	templateUrl: HOST + 'html/collections/labels.html',
		// 	controller: 'PrintsCtrl'
		// }).
		otherwise({redirectTo:'/'});
		
		//$locationProvider.html5Mode(true);
		$locationProvider.hashPrefix('!');
		$disqusProvider.setShortname('kiteapp');
	}
])