'use strict';

var KiteServices = angular.module('KiteServices', ['ngResource', 'ngCookies']);

KiteServices.factory('ActivitiesSvc', ['$resource',
	function($resource) {
		return {
			resources: $resource(null, {}, {
				get_activities: {method:'GET', url:'activities/get_activities', isArray:false},
                get_activity: {method:'GET', url:'activities/get_activity', isArray:false},
                vote_on: {method:'POST', url:'activities/vote_on', isArray:false},
                add_activity: {method:'POST', url:'activities/add_activity', isArray:false}
			})
		}
	}
]);

KiteServices.factory('UsersSvc', ['$resource', 'AuthSvc',
    function($resource) {

    }
])

KiteServices.factory('AuthSvc', ['$resource', 'DataSvc',
    function($resource, DataSvc) {
        var key = "user"
        return {
            store_user: function(user) {
                DataSvc.write_data(key, user)
            },
            get_user: function() {
                return DataSvc.read_data(key)
            },
            logout: function() {
                DataSvc.clear_data(key)
            },
            resources: $resource(null, {}, {
                login: {method:'POST', url:'users/login', isArray:false}
            })
        }
    }
])

/* ************************************ */
/* Data: Store app data in cookie		*/
/* ************************************ */
var COOKIE_NAME = 'KiteServices_Data'
KiteServices.factory('DataSvc', ['$cookieStore',
	function($cookieStore) {
		return {
			read_data: function(key) {
				var cookie = $cookieStore.get(COOKIE_NAME);
				if (cookie != null) return cookie[key];
			},
			write_data: function(key, val) {
				var cookie = $cookieStore.get(COOKIE_NAME);
				if (cookie == null) cookie = {};
				cookie[key] = val;
				$cookieStore.put(COOKIE_NAME, cookie);
                console.log($cookieStore.get(COOKIE_NAME));
			},
			clear_data: function(key) {
				var cookie = $cookieStore.get(COOKIE_NAME);
				if (cookie != null) cookie[key] = null;
				$cookieStore.put(COOKIE_NAME, cookie);
			},
			clear_cookie: function() {
				$cookieStore.remove(COOKIE_NAME);
			}
		}
	}
])
