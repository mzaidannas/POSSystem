app.directive('convertToNumber', function () {
    return {
        require: 'ngModel',
        link: function (scope, element, attrs, ngModel) {
            ngModel.$parsers.push(function (val) {
                return parseInt(val, 10);
            });
            ngModel.$formatters.push(function (val) {
                return '' + val;
            });
        }
    };
});
app.factory('someService', function ($rootScope) {
    /*
    *Some Service Logic and Models
    */

    var some = {
    };

    /*
    *Return Some Service to be Injected into other controllers
    */
    return some;
});