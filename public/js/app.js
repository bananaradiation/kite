'use strict';

var KiteApp = angular.module('KiteApp', ['ngRoute', 'KiteControllers', 'KiteServices']);

KiteApp.config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.when('/', {
			templateUrl: 'html/activities/main_list.html',
			controller: 'ActivitiesCtrl'
		}).
		// when('/collections', {
		// 	templateUrl: HOST + 'html/collections/home.html',
		// 	controller: 'CollectionsCtrl'
		// }).
		// when('/collections/ucsd/new', {
		// 	templateUrl: HOST + 'html/collections/new_ucsd.html',
		// 	controller: 'CollectionsCtrl'
		// }).
		// when('/collections/non-ucsd/new', {
		// 	templateUrl: HOST + 'html/collections/new_non_ucsd.html',
		// 	controller: 'CollectionsCtrl'
		// }).
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
	}
])