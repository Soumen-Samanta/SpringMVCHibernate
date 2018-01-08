angular.module('demo', [])
.controller('Hello', function($scope, $http) {
    $http.get('http://localhost:8085/SpringMVCHibernate/user/soumen').
        then(function(response) {
            $scope.greeting = response.data;
        });
});