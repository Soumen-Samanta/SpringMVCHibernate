<!doctype html>
<html lang="en">
  <head>
    <title>Flatworlds Demo</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.3/angular.min.js"></script>
  	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	      <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" />
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
        
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
  	 <style>
            .tree {
                min-height: 5px;
                padding: 19px;
                margin-bottom: 20px;
                background-color: #ffffff;
                border: 1px solid #999;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
                -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05)
            }
            .tree li {
                list-style-type: none;
                margin: 0;
                padding: 10px 5px 0 5px;
                position: relative
            }
            .tree li::before,
            .tree li::after {
                content: '';
                left: -20px;
                position: absolute;
                right: auto
            }
            .tree li::before {
                border-left: 1px solid #999;
                bottom: 50px;
                height: 100%;
                top: 0;
                width: 1px
            }
            .tree li::after {
                border-top: 1px solid #999;
                height: 20px;
                top: 25px;
                width: 25px
            }
            .tree li span {
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                border: 1px solid #999;
                border-radius: 5px;
                display: inline-block;
                padding: 3px 8px;
                text-decoration: none
            }
            .tree li.parent_li>span {
                cursor: pointer
            }
            .tree>ul>li::before,
            .tree>ul>li::after {
                border: 0
            }
            .tree li:last-child::before {
                height: 30px
            }
            .tree li.parent_li>span:hover,
            .tree li.parent_li>span:hover+ul li span {
                background: #eee;
                border: 1px solid #94a0b4;
                color: #000
            }
            #dialog-window {
                height: 300px;
                border: 1px black solid;
            }
            #scrollable-content {
                height: 450px;
                overflow: auto;
            }
        </style>
 <script type="text/javascript">
 
 </script>
    <script type="text/javascript">
    $(function() {
        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Collapse this branch');
        $('.tree li.parent_li > span').on('click', function(e) {
            var children = $(this).parent('li.parent_li').find(' > ul > li');
            if (children.is(":visible")) {
                children.hide('fast');
                $(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
            } else {
                children.show('fast');
                $(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
            }
            e.stopPropagation();
        });
    });

    angular.module('plunker', ['ui.bootstrap'])
    var app = angular.module('myApp', []);
	app.controller('myController', function($scope, $http) {
		 $scope.value = "23";
		 $scope.names = ["equal to", "not equal to", "is blank","is not blank","greater than","like","greater than or equal","less than or equal"];
		 $scope.andOr = ["AND", "OR"];
		 $scope.column = [];
     	$scope.condition = null;
     	$scope.node=null;

     	$scope.setCurrent = function setCurrent(index) {
     	    $scope.current = index;
     	};
     	
     	$scope.setCurrentnode = function setCurrentnode(data) {
     		//alert(data.name);
     	    $scope.node = data.name;
     	};

     	
		 
		buildEmptyTree();
	     $scope.selectedNode = "";
	    $scope.showNode = function(data) {
	        return data.name;
	     };
	     $scope.tableview=function(){
	    	 
	     };

	  $scope.isClient = function(selectedNode) {

	         if (selectedNode == undefined) {
	             return false;
	         }

	         if (selectedNode.device_name != undefined) {
	             return true;
	         }

	         return false;
	     };

	  function buildEmptyTree() {

	         $scope.displayTree =
	             [{
	             "name": "Table",
	             "type_name": "Node",
	             "show": true,
	             "nodes": [{
	                 "name": "Demog",
	                 "group_name": "Node-1",
	                 "show": true,
	                 "nodes": [{
	                     "name": "STUDYID",
	                     "device_name": "Node-1-1",
	                     "show": true,
	                     "nodes": []
	                 }, {
	                     "name": "USUBJID",
	                     "device_name": "Node-1-2",
	                     "show": true,
	                     "nodes": []
	                 }, {
	                     "name": "AGE",
	                     "device_name": "Node-1-3",
	                     "show": true,
	                     "nodes": []
	                 },
	                 {
	                     "name": "RACE",
	                     "device_name": "Node-1-4",
	                     "show": true,
	                     "nodes": []
	                 }]
	             }, {
	                 "name": "AE",
	                 "group_name": "Node-2",
	                 "show": true,
	                 "nodes": [{
	                     "name": "STUDYID",
	                     "device_name": "Node-2-1",
	                     "show": true,
	                     "nodes": []
	                 },{
	                     "name": "USUBJID",
	                     "device_name": "Node-2-2",
	                     "show": true,
	                     "nodes": []
	                 },
	                 {
	                     "name": "AETERM",
	                     "device_name": "Node-2-3",
	                     "show": true,
	                     "nodes": []
	                 }
	                 ]
	             }, {
	                 "name": "Borg",
	                 "group_name": "Node-3",
	                 "show": true,
	                 "nodes": []
	             }, {
	                 "name": "Fess",
	                 "group_name": "Node-4",
	                 "show": true,
	                 "nodes": []
	             }]
	         }];
	         [{
	             "name": "Android",
	             "type_name": "Android",
	             "icon": "icon-android icon-3",
	             "show": true,
	             "nodes": []
	         }];
	     }
		 $scope.records = [
		                   /* {
		                     "source" : "employee.name",
		                     "condition":"equal to",
		                     "value":"23",
		                     "braces":"("
		                     
		                   },
		                   {
		                	   "source" : "employee.age",
			                     "condition":"gretter then",
			                     "value":"43",
			                     "braces":")"
		                   },
		                   {
		                	   "source" : "employee.DOB",
			                     "condition":"less then",
			                     "value":"20",
			                     "braces":"("
		                   },
		                   {
		                	   "source" : "employee.DOJ",
			                     "condition":"less then equal to",
			                     "value":"23",
			                     "braces":")"
		                   } */
		                 ]
		 $scope.add=function(){
		     	
		     	//$scope.tableview=false;
		     	
		     	$scope.records.push({ 'source':$scope.node, 'condition': $scope.current, 'value': $scope.value});
		     	alert("test");
		     	alert($scope.node+"__"+$scope.condition+"__"+$scope.value);
		      	
		     };
		  });
	
		  // java script
		
    </script>
</head>

<body ng-app="myApp" ng-controller="myController">
<div class="container">


         <div class="row" style=" margin-top: 80px;background-color: lightyellow;">
           <div class="col-sm-4">
           <label style="font-size:16px">Source Columns</label>
           </div>
         <div class="col-sm-4">
           <label style="font-size:16px">Conditions</label>
         </div>
       <div class="col-sm-2">
        <label style="font-size:16px;margin-left: -110px;">Value</label>
       </div>
     <div class="col-sm-2">      
    </div>
    </div>
    <div class="row" style="margin-top: 5px;" >
           <form ng-submit="add()">
           <div class="col-sm-4">
                  <div ng-style="{'overflow': 'auto','height':'325px'}">

                  <script type="text/ng-template" id="tree_item_renderer">

                                <span ng-click="setCurrentnode(data)">
         
             <i class="{{ switcher( isLeaf(data), '', 'icon-minus-sign' )}}"></i> 
            {{showNode(data)}}
            </span>
                                <!-- <a href="">{{data.name}}</a> -->

                                <ul class="some" ng-show="data.show">

                                    <li ng-repeat="data in data.nodes" class="parent_li" ng-include="'tree_item_renderer'" tree-node"></li>
                                </ul>

                            </script>


               <div class="tree well">
                 <ul>
                    <li ng-repeat="data in displayTree"  ng-include="'tree_item_renderer'"></li>
                 </ul>
               </div>
          </div>
           </div>
              <div class="col-sm-4" style="overflow: auto; height: 400px">
         <!-- <select ng-model="selectedName" ng-options="x for x in names" style="width: 250px;" >
         </select> -->
            <ul class="list-group">
                       <li ng-repeat="name in names" ng-click="setCurrent(name)" class="list-group-item list-group-item-action">{{name}}</li>
             </ul>
             </div>
            <div class="col-sm-3">
                       <input type="text" id="value" ng-model="value" style="height: 35px">
            </div>
             <div class="col-sm-1" style="margin-left: 0px;">  
                    <button type="button" class="btn btn-info" ng-click="add()" >ADD</button>    
             </div>
         </form>
     </div>
     <div class="row" style="margin-top: 0px;border: 1px solid">
     <div class="col-sm-12" >
      <table class="table table-hover">
            <thead>
              <tr style="background-color: lightyellow;">
                <th>Order</th>
                <th>Source Column</th>
                <th>Condition</th>
                <th>Value</th>
                <th>AND/OR</th>
                <th>Braces</th>
                <th>Edit</th>
                <th>Delete</th>
              </tr>
            </thead>
            <tbody>
              <tr ng-repeat="record in records">
                <td> {{$index+1}}</td>
                <td> {{record.source}} </td>
                <td>{{record.condition}}</td>
                 <td> {{record.value}}</td>
                <td>  <select ng-model="selectedAndOr" ng-options="x for x in andOr" style="width: 70px;" >
         </select>

                 </td>
                <td>
                <input type="text" style="width: 70px;height: 30px" ng-model=record.braces>
              </td>
                
                 <td><button style="font-size:14px;border: hidden;"  data-toggle="modal" data-target="#myModal"><i class="fa fa-edit" style="font-size:16px"></i></button></td>
                 <td><button style="font-size:14px;border: hidden;" ng-click=""><i class="fa fa-trash-o" style="font-size:16px"></i></button></td>
              </tr>	
              	      
            </tbody>
          </table>
     </div>
     </div>
      <div class="row" style="margin-top: 20px">
     <div class="col-sm-12" >
     <button type="button" class="btn btn-info" style="margin-left: 500px">Generate SQL</button> 
     </div>
     </div>
    <div class="row" style="margin-top: 20px">
     <div class="col-sm-3">
      <label for="comment">SQL/Custom SQL</label>
     </div>
     
       <div class="col-sm-5">
               <textarea class="form-control" rows="3" id="comment" style="margin-left:-95px;width: 500px"></textarea>
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

