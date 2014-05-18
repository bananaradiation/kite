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

        // $scope.map = {
        //     center: {
        //         latitude: 45,
        //         longitude: -73
        //     },
        //     zoom: 8
        // };

        $scope.vote_on = function(rating) {
            console.log(rating);
            // logic to check for rating
            // if (ratingOK) {
            //     ActivitiesSvc.resources.vote_on(
            //         {
            //             activity_id:123,
            //             user_id:12122
            //         }
            //     );
            // }
            // else {
            //     // do nothing
            // }
        }
        // go to single activity detail page
        if ($routeParams.id != null) {
            $scope.activity = ActivitiesSvc.resources.get_activity(
                {
                    activity_id:43
                }
            );
            // console.log($scope.activity);
        }
        // show activities list
        else {
            $scope.activities = ActivitiesSvc.resources.get_activities(
                {
                    user_id:123
                }
            );
        }

		//console.log(activities);
	}
])

