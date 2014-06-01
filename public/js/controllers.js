'use strict';

var KiteControllers = angular.module('KiteControllers', []);

//AppRoot controller
KiteControllers.controller('AppRootCtrl', ['$scope', 'AuthSvc',
	function($scope,AuthSvc) {
		$scope.user = AuthSvc.get_user()
		console.log($scope.user)
    }
])

KiteControllers.controller('ActivitiesCtrl', ['$scope', '$routeParams', 'ActivitiesSvc', 'GoogleSvc',
    function($scope, $routeParams, ActivitiesSvc, GoogleSvc) {
        // console.log($routeParams);
        var userID=123;

        $scope.vote = {
            check_votability:function() {
                return true;
            },
            vote_up:function(activity_id) {
                if ($scope.vote.check_votability()) {
                    ActivitiesSvc.resources.vote_on({
                            rating:1,
                            activity_id:activity_id,
                            user_id:userID
					});
                }
            },
            vote_down:function(activity_id) {
                if ($scope.vote.check_votability()) {
                    ActivitiesSvc.resources.vote_on(
                        {
                            rating:-1,
                            activity_id:activity_id,
                            user_id:userID
                        }
                    );
                }
            }
        };

        $scope.category = {
            selected: 0,
            cat_filter: function(r) {
                if ($scope.category.selected==0) {
                    return true
                }
                else {
                    return (r.category.category.id==$scope.category.selected)
                }
            },
            // set_selected: function()
        };

        // go to single activity detail page
        $scope.activity={};
        if ($routeParams.id != null) {
            ActivitiesSvc.resources.get_activity({activity_id:$routeParams.id}).
            $promise.then(function(response) {
                $scope.activity = response.activity;
            }, function(error) {
                console.log(error);
            });
            // console.log($scope.activity);
        }
        // show activities list
        else {
            $scope.activity_data = ActivitiesSvc.resources.get_activities(
                {
                    user_id:userID
                }
            );
        }
		
        $scope.create_activity = {
            data: {name: null, description: null, photos: [], location: null, category: null},
			map: {center: {latitude:32.8800604, longitude:-117.2340135}, draggable: false, zoom:14},
			refresh_map: function() {
				GoogleSvc.resources.geocode({key:GOOGLE_API_KEY, address:$scope.create_activity.data.location}).
				$promise.then(function(response) {
					console.log(response);
					$scope.create_activity.map.center.latitude = response.results[0].geometry.location.lat;
					$scope.create_activity.map.center.longitude = response.results[0].geometry.location.lng;
				}, function(error) {
				});
				
			},
            add_activity:function() {
                console.log($scope.create_activity)
            }
        }


// POST /activities/add_activity
// Params:
// user_id, activity_name, description, location, category
// Returns:
// success

		//console.log(activities);
	}
])

KiteControllers.controller('UsersCtrl',['$scope', '$routeParams', 'UsersSvc',
    function($scope, $routeParams, UsersSvc) {

    }
])

KiteControllers.controller('AuthCtrl',['$scope', '$routeParams', 'AuthSvc',
    function($scope, $routeParams, AuthSvc) {
        $scope.login = {
            credentials:{
                email:null,
                password:null,
            },
            login:function() {
                AuthSvc.resources.login($scope.login.credentials).$promise
                    .then(function(response) {
                        AuthSvc.store_user(response.user)
                    }, function(error) {
                        controller.log(error)
                    })
            },
        }

        $scope.logout = function() { AuthSvc.logout() }
    }
])
