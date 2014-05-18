'use strict';

var KiteControllers = angular.module('KiteControllers', []);

//AppRoot controller
KiteControllers.controller('AppRootCtrl', ['$scope',
	function($scope) {
	}
])

KiteControllers.controller('ActivitiesCtrl', ['$scope', '$routeParams', 'ActivitiesSvc',
	function($scope, $routeParams, ActivitiesSvc) {
        console.log($routeParams);
        if ($routeParams.id != null) {
            $scope.activity = ActivitiesSvc.resources.get_activity(
                {
                    activity_id:43
                }
            );
        }
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

