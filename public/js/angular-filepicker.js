var filepicker_callback = null;
KiteApp.directive("filepicker", function(){
	return {
		scope: {
			callback: '&',
			'pickerclass': '@'
		},
		transclude: true,
		restrict: "A",
		template: "<a href='javascript:;' class='{{pickerclass}}' ng-click='pickFiles()' ng-transclude></a>",
		link: function(scope, element, attrs) {
			scope.pickFiles = function () {
				var picker_options = {
					container: 'modal',
					multiple: false,
					services: ['instagram', 'computer'],
					openTo: 'instagram'
				};

				var path = attrs.path ? attrs.path : '/uploads/',
					container = attrs.container ? attrs.container : 'documents.e-freightliner.com';

				var store_options = {
					location: 'S3',
					path: path,
					container: container
				};

				filepicker.pickAndStore(picker_options, store_options, function (fpfiles) {
					filepicker_callback = fpfiles;
					scope.$apply(function(){
						scope.callback({file:fpfiles});
					});
				});
			};
		}
	};
});