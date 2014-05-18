'use strict';

var KiteControllers = angular.module('KiteControllers', []);

//AppRoot controller
KiteControllers.controller('AppRootCtrl', ['$scope',
	function($scope) {
	}
])

KiteControllers.controller('ActivitiesCtrl', ['$scope', 'ActivitiesSvc',
	function($scope, ActivitiesSvc) {
		$scope.activities = ActivitiesSvc.resources.get_activities();
		//console.log(activities);
	}
])