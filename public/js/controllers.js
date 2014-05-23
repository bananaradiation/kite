'use strict';

var KiteControllers = angular.module('KiteControllers', []);

//AppRoot controller
KiteControllers.controller('AppRootCtrl', ['$scope',
	function($scope) {
	}
])

KiteControllers.controller('ActivitiesCtrl', ['$scope', '$routeParams', 'ActivitiesSvc',
    function($scope, $routeParams, ActivitiesSvc) {
        // console.log($routeParams);
        var userID=123;

        // $scope.map = {
        //     center: {
        //         latitude: 45,
        //         longitude: -73
        //     },
        //     zoom: 8
        // };

        $scope.vote = {
            check_votability:function() {
                return true;
            },
            vote_up:function(activity_id) {
                if ($scope.vote.check_votability()) {
                    ActivitiesSvc.resources.vote_on(
                        {
                            rating:1,
                            activity_id:activity_id,
                            user_id:userID
                        }
                    );
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

        $scope.user = {
            get_user:function() {
                return AuthSvc.get_user()
            }
        }
    }
])
