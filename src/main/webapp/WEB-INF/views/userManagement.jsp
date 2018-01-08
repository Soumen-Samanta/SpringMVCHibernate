<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<body>
	<script>
		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope, $http) {
			$scope.users = [];
			getUserDetails();

			function getUserDetails() {
				$http({
					method : 'GET',
					url : 'listItems'
				}).then(function successCallback(response) {
					$scope.departments = response.data;
					alert(response.data);
			          alert(response.status);
			        console.log(response);

				}, function errorCallback(response) {
					 console.log(" hello error angular");
					console.log(response.statusText);
				});
			}
		});
	</script>
	<div ng-app="myApp" ng-controller="myCtrl">
		<div class="w3-container w3-padding-small w3-blue">
			<div class="w3-right">
				<i class="fa fa-volume-up"></i> <i class="fa fa-wifi"></i> <i
					class="fa fa-battery-2"></i>
			</div>
		</div>

		<div class="w3-bar w3-xlarge w3-light-blue">
			<a class="w3-bar-item w3-button" href="#"><i class="fa fa-bars"></i></a>
			<span class="w3-bar-item">IQ SOFTWARE SERVICES</span> <a
				class="w3-bar-item w3-button w3-right" href="#"><i
				class="fa fa-search"></i></a>
		</div>
		<div class="w3-sidebar w3-bar-block w3-light-grey" style="width: 20%">
			<a href="#" class="w3-bar-item w3-button">Administration</a> <a
				href="#" class="w3-bar-item w3-button" ng-show="table=true">Department
				Update</a>
		</div>
		<div style="margin-left: 20%" ng-show="table">
			<div class="w3-container w3-cell-middle">
				<h3 align="center">Sample Application for Employee and
					Department Update</h3>
				<hr>
			</div>
			<table class="w3-table w3-striped">
				<tr class="w3-indigo">
					<th>ID</th>
					<th>Department name</th>
					<th>Description</th>
					<th>View Details</th>
				</tr>
				<tr ng-repeat="user in users">
					<td>{{ user.ID}}</td>
					<td>{{ user.Department_Name }}</td>
					<td>{{ user.Description }}</td>
					<td><i class="fa fa-search w3-text-blue"
						ng-click="clicked=true"></i></td>
				</tr>
			</table>
			<i class="fa fa-calendar-plus-o w3-text-blue w3-right"
				ng-click="clicked=true"></i>
		</div>
		<hr>
		<div class="w3-container w3-cell-middle" ng-show="clicked"
			style="margin-left: 20%">
			<h4 align="center">Department details</h4>
			<i class="fa fa-close w3-text-red w3-right" ng-click="clicked=false"></i>
			<table class="w3-table w3-striped">
				<tr class="w3-indigo">
					<th>Department ID</th>
					<th>Name</th>
					<th>Description</th>
					<th>Delete</th>
					<th>Employees</th>
				</tr>
				<tr>
					<td>1</td>
					<td>HR</td>
					<td>Details</td>
					<td><i class="fa fa-trash w3-text-blue"
						ng-click="clicked=false"></i></td>
					<td><i class="fa fa-group w3-text-blue"
						ng-click="dbclicked=true"></i></td>
				</tr>
				<tr>
					<td>2</td>
					<td>SALES</td>
					<td>Details</td>
					<td><i class="fa fa-trash w3-text-blue"
						ng-click="clicked=false"></i></td>
					<td><i class="fa fa-group w3-text-blue"
						ng-click="dbclicked=true"></i></td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="w3-container w3-cell-middle" ng-show="dbclicked"
			style="margin-left: 20%">
			<h4 align="center">Employee details</h4>
			<i class="fa fa-close w3-text-red w3-right"
				ng-click="dbclicked=false"></i>
			<table class="w3-table w3-striped">
				<tr class="w3-indigo">
					<th>Employee ID</th>
					<th>Name</th>
					<th>DOB</th>
					<th>Update</th>
					<th>Remove</th>
				</tr>
				<tr>
					<td>0001</td>
					<td>Ramya</td>
					<td>10/08/1990</td>
					<td><i class="fa fa-edit w3-text-blue"
						ng-click="dbclicked=false"></i></td>
					<td><i class="fa fa-remove w3-text-red"
						ng-click="dbclicked=false"></i></td>
				</tr>
				<tr>
					<td>0002</td>
					<td>Aadya</td>
					<td>23/03/14</td>
					<td><i class="fa fa-edit w3-text-blue"
						ng-click="dbclicked=false"></i></td>
					<td><i class="fa fa-remove w3-text-red"
						ng-click="dbclicked=false"></i></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>