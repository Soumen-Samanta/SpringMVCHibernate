<!doctype html>
<html lang="en">
  <head>
    <title>Anjular JS Demo</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
  	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    var app = angular.module('myApp', []);
	app.controller('myCtrl', function($scope, $http) {
		   $scope.deps;
	     	$scope.baseUrl='http://localhost:8085/SpringMVCHibernate/';
		   $scope.departments = {};
		   $scope.employeeList={};
		   getUserDetails();
		  
		   function getUserDetails() {
		    $http({
		     method : 'GET',
		     url : $scope.baseUrl+'department'
		    }).then(function successCallback(response) {
		     $scope.departments = response.data;
		    }, function errorCallback(response) {
		      console.log("error angular");
		     console.log(response.statusText);
		    });
		   }
		   
		   $scope.getdeartment = function(index) {
			 //  $scope.deps={};
			   $http({
				     method : 'GET',
				     url : $scope.baseUrl+'department/'+index
				    }).then(function successCallback(response) {
				    	
				     $scope.deps = response.data;
				    // alert($scope.deps.departmentName);
				    }, function errorCallback(response) {
				    	alert(response.status);
				      console.log("error angular");
				     console.log(response.statusText);
				    });
				   }
		   $scope.removeDepartment = function(index) {
				 //  $scope.deps={};
				   $http({
					     method : 'DELETE',
					     url : $scope.baseUrl+'department/'+index
					    }).then(function successCallback(response) {
					    	
					     $scope.deleteStatus = response.status;
					     if($scope.deleteStatus==200){
						     alert("You have successfully deleted department")
						     }
					    // alert($scope.deps.departmentName);
					    }, function errorCallback(response) {
					    	alert(response.status);
					      console.log("error angular");
					     console.log(response.statusText);
					    });
					   }
		   $scope.getEmployeeList = function(index) {
				   $http({
					     method : 'GET',
					     url : $scope.baseUrl+'employeeList/'+index
					    }).then(function successCallback(response) {
					    	  $scope.employeeList = response.data;
					    // alert($scope.deps.departmentName);
					    }, function errorCallback(response) {
					    	alert(response.status);
					      console.log("error angular");
					     console.log(response.statusText);
					    });
					   }
		  });
    </script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">
<div class="container">
     <div>
       <label style="font-size:30px;text-align: center">Department Details</label>
       <table class="table table-striped">
            <thead>
              <tr style="background-color: lightyellow;">
                <th>Sl No.</th>
                <th>Department Name</th>
                <th>Description</th>
                <th>View Details</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="department in departments">
                <td> {{ $index+1 }}.</td>
                <td> {{department.departmentName}} </td>
                <td>{{department.description}}</td>
                <td><button style="font-size:24px;border: hidden;" ng-click="getdeartment(department.id)"><i class="fa fa-eye" style="font-size:18px;"></i></button></td>
              </tr>		      
            </tbody>
          </table>
          </div>
          <div ng-hide="!deps">
           <h4 align="center">Department/Employee Update</h4>
       <table class="table table-striped">
            <thead>
              <tr style="background-color: lightyellow;">
                <th>Department ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Delete</th>
                <th>Employees</th>
              </tr>
            </thead>
            <tbody>
              <tr >
                <td> {{ deps.id }}.</td>
                <td> {{deps.departmentName}} </td>
                <td>{{deps.description}}</td>
                <td><button style="font-size:24px;border: hidden;" ng-click="removeDepartment(deps.id)"><i class="fa fa-trash-o" style="font-size:16px"></i></i></button></td>
                 <td><button style="font-size:24px;border: hidden;" ng-click="getEmployeeList(deps.id)"><i class="fa fa-group" style="font-size:16px"></i></button></td>
              </tr>		      
            </tbody>
          </table>
          </div>
      <div ng-hide="!employeeList.length">
           <div>
          <h4 align="center">Employees Details</h4>
           </div>
         <table class="table table-striped">
            <thead>
              <tr style="background-color: lightyellow;">
                <th>Employee ID</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Update</th>
                <th>Remove</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="employee in employeeList">
                <td> {{ employee.id }}.</td>
                <td> {{employee.employeeName}} </td>
                <td>{{employee.dob}}</td>
                 <td><button style="font-size:14px;border: hidden;"  data-toggle="modal" data-target="#myModal"><i class="fa fa-edit" style="font-size:16px"></i></button></td>
                 <td><button style="font-size:14px;border: hidden;" ng-click=""><i class="fa fa-trash-o" style="font-size:16px"></i></button></td>
              </tr>		      
            </tbody>
          </table>
        </div>
        
        
        <!--  -->
       <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
        
       <!-- Modal -->
    <div id="myModalEdit" class="modal fade" role="dialog">
      <div class="modal-dialog">
    
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Employee Details</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label for="inputEmailEid" class="col-sm-2 control-label">Employee ID</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmailEid" ng-model="clickedUser.username">
                </div>
              </div>
    
              <div class="form-group">
                <label for="inputEmailName" class="col-sm-2 control-label">Name</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmailName"  ng-model="clickedUser.email">
                </div>
              </div>
    
              <div class="form-group">
                <label for="inputEmailDOB" class="col-sm-2 control-label">DOB</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmailDOB" ng-model="clickedUser.fullName">
                </div>
              </div>
                            
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Done</button>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
              
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
    
      </div>
    </div>
</div>

</body>
</html>