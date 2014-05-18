'use strict';

var KiteApp = angular.module('KiteApp', ['ngRoute', 'KiteControllers', 'KiteServices']);

KiteApp.config(['$routeProvider',
	function($routeProvider) {
		// $routeProvider.when('/', {
		// 	templateUrl: HOST + 'html/landing/landing.html',
		// 	controller: 'AuthCtrl'
		// }).
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
		// when('/collections/print/:id', {
		// 	templateUrl: HOST + 'html/collections/print.html',
		// 	controller: 'PrintsCtrl'
		// }).
		// when('/collections/labels', {
		// 	templateUrl: HOST + 'html/collections/labels.html',
		// 	controller: 'PrintsCtrl'
		// }).
		// otherwise({redirectTo:HOST});
	}
])