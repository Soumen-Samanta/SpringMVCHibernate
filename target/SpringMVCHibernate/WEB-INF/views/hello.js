/*angular.module('demo', [])
.controller('Hello', function($scope, $http) {
    $http.get('http://localhost:8085/SpringMVCHibernate/user/soumen').
        then(function(response) {
            $scope.greeting = response.data;
            console.log("response");
            alert("hi");
        });
});*/
var app = angular.module('myApp', ['ngResource']);
app.factory('LoginBean', ['$resource', function ($resource) {
    return $resource('http://localhost:8085/SpringMVCHibernate/user/soumen',
	{
    	query:  {method:'GET', isArray:true}
	}
    );
}]);
app.controller('LoginBeanController', ['$scope', 'LoginBean', function($scope, LoginBean) {
	console.log("hi");
	var ob = this;
    ob.loginBeans=[];
    ob.loginBeans = new LoginBean(); 
    ob.fetchAllEmployee = function(){
        ob.loginBeans = LoginBean.query();
    };
    ob.fetchAllEmployee();
    alert("hi");
}]);