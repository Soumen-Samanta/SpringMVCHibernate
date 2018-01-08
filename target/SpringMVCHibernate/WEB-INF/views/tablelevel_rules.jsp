<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
  	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	      <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<title>Join/Merge</title>
<script type="text/javascript">
var app = angular.module('myApp', []);
app.controller('tableleveRulesController', function($scope, $http) {
	$scope.index=1;
	$scope.leftTableColumns = ["Demog.STUDYID", "Demog.USUBJID"];
	$scope.joinTypes = ["Inner Join", "Left Outer Join","Right Outer Join","FULL"];
	$scope.rightTableColumns = ["AE.STUDYID", "AE.USUBJID"];
	 $scope.joins = [
	                   /*  {
	                     "leftTableColumns" : "employee.name",
	                     "joinType":"equal to",
	                     "rightTableColumns":"23"
	                     
	                   },
	                   {
	                	   "leftTableColumns" : "employee.age",
		                     "joinType":"gretter then",
		                     "rightTableColumns":"43"
	                   },
	                   {
	                	   "leftTableColumns" : "employee.DOB",
		                     "joinType":"less then",
		                     "rightTableColumns":"20"
	                   }, */
	                   {
	                	   "leftTableColumn" : "",
		                     "joinType":"",
		                     "rightTableColumn":""
	                   } 
	                 ]
     $scope.addNew = function(join){
         $scope.joins.push({ 
             'leftTableColumn': "", 
             'joinType': "",
             'rightTableColumn': "",
         });
     };
     $scope.sqlQuery='';
     $scope.generateSql= function(){
       //  alert("hi generate sql");
         //$scope.sqlQuery=$scope.joins;
         for (i=0;i<$scope.joins.length;i++){
             alert($scope.joins[i].joinType);
             $scope.sqlQuery= $scope.sqlQuery+$scope.joins[i].joinType+" ON "+$scope.joins[i].leftTableColumn+" = "+$scope.joins[i].rightTableColumn;
         }
         $scope.sqlQuery=$scope.sqlQuery+"(+)"
         };
         
});
</script>
</head>
<body ng-app="myApp" ng-controller="tableleveRulesController">
<div class="container-fluid">
<div class="col-sm-12">
<h1>Join/Merge
</h1>

</div>
 <div class="col-sm-12" style="border: 1px solid"" >
      <table class="table table-hover">
            <thead>
              <tr style="background-color: lightyellow;">
                <th>Order</th>
                <th>Left Table Columns </th>
                <th>Join Type</th>
                <th>Right table Columns</th>
                <th>Edit</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="join in joins">
                <td> {{$index+1}}</td>
                <td>  <select ng-model="join.leftTableColumn" class="form-control">
                            <option>select</option>
                            <option  ng-repeat="leftTableColumn in leftTableColumns" value={{leftTableColumn}}>{{leftTableColumn}}</option>
                          </select>
                 </td>
                <td> <select ng-model="join.joinType" class="form-control">
                            <option>select</option>
                            <option  ng-repeat="joinType in joinTypes" value={{joinType}}>{{joinType}}</option>
                          </select>
                </td>
                 <td>  <select ng-model="join.rightTableColumn" class="form-control">
                            <option>select</option>
                            <option  ng-repeat="rightTableColumn in rightTableColumns" value={{rightTableColumn}}>{{rightTableColumn}}</option>
                          </select>
                   </td>
                 <td></td>
                 <td></td>
              </tr>	
            </tbody>
          </table>
          <button type="button" class="btn btn-info" style="margin-left: 500px" ng-click="addNew()">ADD NEW</button> 
     </div>
     <div class="row" style="margin-top: 20px">
     <div class="col-sm-12" >
     <button type="button" class="btn btn-info" style="margin-left: 500px" ng-click="generateSql()">Generate SQL</button> 
     </div>
     </div>
    <div class="row" style="margin-top: 20px">
     <div class="col-sm-3">
      <label for="comment">SQL/Custom SQL</label>
     </div>
     
       <div class="col-sm-5">
               <textarea class="form-control" rows="3" id="comment" style="margin-left:-95px;width: 500px" ng-model="sqlQuery"></textarea>
        </div>
     <div class="col-sm-4">
      <button type="button" class="btn btn-info" style="margin-left:0px">Modify SQL</button> 
     </div>
     </div>
      <div class="row" style="margin-top: 20px">
     <div class="col-sm-12">
     <button type="button" class="btn btn-info" style="margin-left: 500px">Generate SQL</button> 
     </div>
     </div>
</div>
</body>
</html>