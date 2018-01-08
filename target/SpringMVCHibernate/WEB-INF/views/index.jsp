<!doctype html>
<html ng-app="myApp">
	<head>
		<title>Hello AngularJS</title>
		 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
    	<!--  <script src="hello.js"></script>-->
    	<script type="text/javascript">
    	// var app = angular.module('myApp', ['ngResource']);
    	/*app.factory('LoginBean', ['$resource', function ($resource) {
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
    	    	console.log('Inside get');
    	        ob.loginBeans = LoginBean.query();
    	    };
    	    ob.fetchAllEmployee();
    	    
    	}]);  */
    	var app = angular.module('myApp', []);
    	app.controller('myCtrl', function($scope, $http) {
    		   $scope.departments = {};
    		   getUserDetails();

    		   function getUserDetails() {
    		    $http({
    		     method : 'GET',
    		     url : 'http://localhost:8085/SpringMVCHibernate/user/soumen'
    		    }).then(function successCallback(response) {
        		    alert("hi");
    		     //alert(Object.keys(response.data)[0]);
    		     alert(angular.fromJson(response.data));
    		     $scope.employees = response.data;
    		            alert($scope.departments);
    		           console.log(response);

    		    }, function errorCallback(response) {
    		      console.log("error angular");
    		     console.log(response.statusText);
    		    });
    		   }
    		  });
    	</script>
	</head>

	<body>
		<div ng-controller="myCtrl">
			 <table class="table table-striped">
            <thead>
              <tr>
                <th>Index</th>
                <th>username</th>
                <th>email</th>
                <th>Edit</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="employee in employees">
                <td> {{ $index+1 }}.</td>
                <td> {{employee.id}} </td>
                <td>{{employee.userName}}</td>
                 <td>{{employee.password}}</td>
                <td> <button class="btn btn-info btn-sm"  type="button" data-toggle="modal" data-target="#myModalEdit" ng-click="selectUser(user)">Edit</button> </td>
                <td> <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#myModalDelete" ng-click="selectUser(user)">Delete</button> </td>
              </tr>		      
            </tbody>
          </table>
		</div>
	</body>
</html>