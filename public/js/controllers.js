'use strict';

var KiteControllers = angular.module('KiteControllers', []);

//AppRoot controller
KiteControllers.controller('AppRootCtrl', ['$scope', 'AuthSvc',
	function($scope,AuthSvc) {
		$scope.user = AuthSvc.get_user();
		$scope.get_user = function() {
			return AuthSvc.get_user();
		}
    }
])

KiteControllers.controller('ActivitiesCtrl', ['$scope', '$routeParams', '$location', 'ActivitiesSvc', 'GoogleSvc',
    function($scope, $routeParams, $location, ActivitiesSvc, GoogleSvc) {
		var userID = null;
		if ($scope.get_user()!=null) userID = $scope.get_user().id;
		
		$scope.award = null;
		/*
		$scope.$watch('award', function(award) {
			if (award==null) return;
			console.log(award);
			$.fancybox($('#'+award));
		})
		*/

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
					}).$promise.then(function(response) {
						console.log(response);
						if ($scope.activity != null) $scope.activity = response.activity;
						else if ($scope.activity_data != null) {
							for (var ndx=0; ndx<$scope.activity_data.activities.length; ndx++) {
								var activity = $scope.activity_data.activities[ndx];
								if (activity.id==activity_id) {
									$scope.activity_data.activities[ndx] = response.activity;
									break;
								}
							}
						}
					}, function(error) {
						alert(error.data);
					});
                }
            },
            vote_down:function(activity_id) {
                if ($scope.vote.check_votability()) {
                    ActivitiesSvc.resources.vote_on({
                            rating:-1,
                            activity_id:activity_id,
                            user_id:userID
					}).$promise.then(function(response) {
						if ($scope.activity != null) $scope.activity = response.activity;
						else if ($scope.activity_data != null) {
							for (var ndx=0; ndx<$scope.activity_data.activities.length; ndx++) {
								var activity = $scope.activity_data.activities[ndx];
								if (activity.id==activity_id) {
									$scope.activity_data.activities[ndx] = response.activity;
									break;
								}
							}
						}
					}, function(error) {
						alert(error.data);
					});
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
        };
		
		$scope.categories = ActivitiesSvc.get_categories();

        $scope.activity = null;
		$scope.activity_data = null;
		// go to single activity detail page
        if ($routeParams.id != null) {
			$scope.activity = {map: {center: {latitude:32.8800604, longitude:-117.2340135}, draggable: false, zoom:14}};
            ActivitiesSvc.resources.get_activity({activity_id:$routeParams.id, user_id:userID}).
            $promise.then(function(response) {
                $scope.activity = response.activity;
				$scope.activity.map = {center: {latitude:32.8800604, longitude:-117.2340135}, draggable: false, zoom:14};
				GoogleSvc.resources.geocode({key:GOOGLE_API_KEY, address:$scope.activity.location}).
				$promise.then(function(gresponse) {
					if (gresponse.results.length>0) {
						$scope.activity.map.center.latitude = gresponse.results[0].geometry.location.lat;
						$scope.activity.map.center.longitude = gresponse.results[0].geometry.location.lng;
					}
				}, function(error) {
				});
				$scope.activity.add_image = function() {
					var apiKey = "AI1Xy0rGrRQSx7W6sJbUHz";
					filepicker.setKey(apiKey);
					ActivitiesSvc.resources.add_photo({activity_id:$scope.activity.id, user_id:userID, photo_url:filepicker_callback[0].url}).
					$promise.then(function(aresponse) {
						$scope.activity.photos = aresponse.activity.photos;
					}, function(error) {
					});
				}
            }, function(error) {
                console.log(error);
            });
        }
        // show activities list
        else {
            ActivitiesSvc.resources.get_activities({user_id:userID}).
			$promise.then(function(response) {
				$scope.activity_data = response;
				for (var ndx=0; ndx<response.activities.length; ndx++) {
					var activity = response.activities[ndx];
					$scope.award = activity.award;
					
					if ($scope.award != null) {
						$.fancybox($('#'+$scope.award));
					}
				}
			}, function(error) {
			});
        }
		
		//Complete activity
		$scope.complete_activity = function(activity_id) {
			ActivitiesSvc.resources.complete_activity({activity_id:activity_id, user_id:userID}).
			$promise.then(function(response) {
				console.log(response);
				if ($scope.activity_data != null) {
					for (var ndx=0; ndx<$scope.activity_data.activities.length; ndx++) {
						if ($scope.activity_data.activities[ndx].id==response.activity.id) {
							$scope.activity_data.activities[ndx] = response.activity;
							
							$scope.award = response.activity.award;
					
							break;
						}
					}
				} else {
					$scope.activity = response.activity;
					$scope.award = response.activity.award;
				}
				if ($scope.award != null) {
					$.fancybox($('#'+$scope.award));
				}
			}, function(error) {
				console.log(error);
			});
		}
		
        $scope.create_activity = {
			categories: ActivitiesSvc.get_categories(),
            data: {name: null, description: null, photos: [], location: null, category: 1},
			map: {center: {latitude:32.8800604, longitude:-117.2340135}, draggable: false, zoom:14},
			refresh_map: function() {
				GoogleSvc.resources.geocode({key:GOOGLE_API_KEY, address:$scope.create_activity.data.location}).
				$promise.then(function(response) {
					$scope.create_activity.map.center.latitude = response.results[0].geometry.location.lat;
					$scope.create_activity.map.center.longitude = response.results[0].geometry.location.lng;
				}, function(error) {
				});
				
			},
            add_activity:function() {
				ActivitiesSvc.resources.add_activity({
					user_id: userID,
					activity: $scope.create_activity.data,
				}).$promise.then(function(response) {
					$location.path('/');
				}, function(error) {
				});
                console.log($scope.create_activity)
            },
			init_filepicker: (function() {
				var apiKey = "AI1Xy0rGrRQSx7W6sJbUHz";
				filepicker.setKey(apiKey);
			})(),
			upload_photo: function(event) {
				$scope.create_activity.data.photo_url = filepicker_callback[0].url;
			}
        }
		
		//Fancybox hacks
		var fancybox = {
			initialize: (function() {
				if ($.fancybox==null) $.noConflict();
				$(".fancybox").fancybox({
					openEffect	: 'none',
					closeEffect	: 'none'
				});
			})()
		}
	}
])

KiteControllers.controller('UsersCtrl',['$scope', '$routeParams', 'UsersSvc',
    function($scope, $routeParams, UsersSvc) {
		var uid = null;
		if ($scope.get_user()!=null) uid = $scope.get_user().id;
		
		$scope.user_profile = {
			get_user: (function() {
				if ($routeParams.id==0) {
					UsersSvc.resources.get_profile({id:uid})
					.$promise.then(function(response) {
						$scope.user = response.user;
						console.log(response);
					}, function(error) {
					});
				}
			})(),
		}
		console.log($routeParams.id)
    }
])

KiteControllers.controller('AuthCtrl',['$scope', '$routeParams', '$location', 'AuthSvc',
    function($scope, $routeParams, $location, AuthSvc) {
        $scope.login = {
            credentials:{
                email:null,
                password:null,
            },
            login:function() {
                AuthSvc.resources.login($scope.login.credentials).$promise
                    .then(function(response) {
						console.log(response.user);
                        AuthSvc.store_user(response.user);
						$location.path('/');
                    }, function(error) {
						alert(error.data);
                    })
            },
        }
		
		$scope.signup = {
			signup:function() {
				AuthSvc.resources.signup($scope.login.credentials).$promise
                    .then(function(response) {
						console.log(response.user);
                        AuthSvc.store_user(response.user);
						$location.path('/');
                    }, function(error) {
						alert(error.data);
                    })
			}
		}

        $scope.logout = function() { AuthSvc.logout() }
    }
])
