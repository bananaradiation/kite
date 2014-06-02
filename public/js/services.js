'use strict';

var KiteServices = angular.module('KiteServices', ['ngResource', 'ngCookies']);

//Handle activity APIs
KiteServices.factory('ActivitiesSvc', ['$resource', 'DataSvc',
	function($resource, DataSvc) {
		return {
			get_categories: function() {
				var key = 'categories';
				var data = DataSvc.read_data(key);
				if (data==null) {
					var categories = this.resources.get_categories();
					categories.$promise.then(function(response) {
						DataSvc.write_data(key, response);
					}, function(error) {
					});
					return categories;
				} else return data;
			},
			resources: $resource(null, {}, {
				get_categories: {method: 'GET', url:'categories/get_categories', isArray:false},
				get_activities: {method:'GET', url:'activities/get_activities', isArray:false},
                get_activity: {method:'GET', url:'activities/get_activity', isArray:false},
                vote_on: {method:'POST', url:'activities/vote_on', isArray:false},
                add_activity: {method:'POST', url:'activities/add_activity', isArray:false}
			})
		}
	}
]);

//Handle users APIs
KiteServices.factory('UsersSvc', ['$resource', 'AuthSvc',
    function($resource) {

    }
]);

//Handle authentication
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
]);

//Handle Google APIs
var GOOGLE_API_KEY = 'AIzaSyBEvxq3OPyoS61EzLuw84NUtd8gVpbYAvY';
KiteServices.factory('GoogleSvc', ['$resource',
	function($resource) {
		return {
			resources: $resource(null, {}, {
				geocode: {method:'GET', url:'https://maps.googleapis.com/maps/api/geocode/json', isArray:false}
			})
		}
	}
]);

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
