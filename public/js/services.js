'use strict';

var KiteServices = angular.module('KiteServices', ['ngResource', 'ngCookies']);

/* ************************************ */
/* Data: Store app data in cookie		*/
/* ************************************ */
// var COOKIE_NAME = 'KiteServices_Data'
// KiteServices.factory('DataSvc', ['$cookieStore',
// 	function($cookieStore) {
// 		return {
// 			read_data: function(key) {
// 				var cookie = $cookieStore.get(COOKIE_NAME);
// 				if (cookie != null) return cookie[key];
// 			},
// 			write_data: function(key, val) {
// 				var cookie = $cookieStore.get(COOKIE_NAME);
// 				if (cookie == null) cookie = {};
// 				cookie[key] = val;
// 				$cookieStore.put(COOKIE_NAME, cookie);
// 			},
// 			clear_data: function(key) {
// 				var cookie = $cookieStore.get(COOKIE_NAME);
// 				if (cookie != null) cookie[key] = null;
// 				$cookieStore.put(COOKIE_NAME, cookie);
// 			},
// 			clear_cookie: function() {
// 				$cookieStore.remove(COOKIE_NAME);
// 			}
// 		}
// 	}
// ])
