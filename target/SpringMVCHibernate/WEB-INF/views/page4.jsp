<!doctype html>
<html lang="en">

<header><div ng-include="'header.jsp'"></div> </header>
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
    
<<script type="text/javascript">
<!--

//-->
var app = angular.module('myApp', []);
app.controller("page4Controller", function($scope, fetchData,$interval, $rootScope, $location, $timeout) {
			$scope.STAGE_TYPE="IMPORT";
			$scope.studySchema = "<STUDY_NAME>_STABLE";
			$scope.patternOne = "<StudyName>_<SDTM Version> <DateTime>";
			$scope.patternTwo = "<Schema.Table#Column>_<Table#Column>_<>";
				$scope.payload= {
					"masterStagesConfigPK": {
					"enterpriseId": $rootScope.enterpriseID,
					"stageID": $rootScope.stageId,
					"studyStageID": $rootScope.studyStageId
					},
					"loadTypeCode":"",
					"dbLink": "OCRDC_PROD",
					"schemaPattern": "",
					"loadAs": "",
					"fileFormat":"",
					"isFileProtected": "",
					"unlockPassword": "",
					"envFindMethod": "",
					"envFindFormula": "",
					"envNameInterpretation": "",
					"stageDir":  "",
					"fileNamePattern":"",
					"fileValidationRule":"",
					"recDelimiterChar": "",
					"colDelimiterChar":"",
					"enclosingChar":"",
					"initialRowsToSkip": "",
					"maxAllowedErr":""
					};


			$scope.update = false;
			function fetchDataCall(data){
				fetchData.GetStudyStagesConf(data).then(function(response){
					if(response.data.length > 0){
						$scope.payload.loadTypeCode = response.data[0].loadTypeCode;
						$scope.payload.schemaPattern = response.data[0].schemaPattern
						$scope.payload.loadAs = response.data[0].loadAs;
						$scope.payload.fileFormat = response.data[0].fileFormat;
						$scope.payload.stageDir = response.data[0].stageDir;
						$scope.payload.fileNamePattern = response.data[0].fileNamePattern;
						$scope.payload.fileValidationRule = response.data[0].fileValidationRule;
						$scope.payload.recDelimiterChar = response.data[0].recDelimiterChar;
						$scope.payload.colDelimiterChar = response.data[0].colDelimiterChar;
						$scope.payload.enclosingChar = response.data[0].enclosingChar;
						$scope.payload.initialRowsToSkip = response.data[0].initialRowsToSkip !="" ? response.data[0].initialRowsToSkip : 0;
						$scope.payload.maxAllowedErr = response.data[0].maxAllowedErr !="" ? response.data[0].maxAllowedErr : 0;
						$scope.update = true;
					}else{
						fetchData.GetMasterStudyStagesConf($rootScope.masterStageID).then(function(response){
							if(response.data.length > 0){
								$scope.payload.loadTypeCode = response.data[0].loadTypeCode;
								$scope.payload.schemaPattern = response.data[0].schemaPattern
								$scope.payload.loadAs = response.data[0].loadAs;
								$scope.payload.fileFormat = response.data[0].fileFormat;
								$scope.payload.stageDir = response.data[0].stageDir;
								$scope.payload.fileNamePattern = response.data[0].fileNamePattern;
								$scope.payload.fileValidationRule = response.data[0].fileValidationRule;
								$scope.payload.recDelimiterChar = response.data[0].recDelimiterChar;
								$scope.payload.colDelimiterChar = response.data[0].colDelimiterChar;
								$scope.payload.enclosingChar = response.data[0].enclosingChar;
								$scope.payload.initialRowsToSkip = response.data[0].initialRowsToSkip !="" ? response.data[0].initialRowsToSkip : 0;
								$scope.payload.maxAllowedErr = response.data[0].maxAllowedErr !="" ? response.data[0].maxAllowedErr : 0;
							}else{
								$scope.payload.loadTypeCode = "";
							}							
						})
					}

				});
			}
			$scope.popupOptionsExit = {
		        width: 600,
		        height:170,
		        contentTemplate: "info2",
		        showTitle: true,
		        title:"Confirm",
		        bindingOptions: {
			            visible: "visiblePopup2",
		        },
                showCloseButton: false,
                
			};
			$scope.popupOptions = {
			        width: 600,
			        height:550,
			        contentTemplate: "info",
			        showTitle: true,
			        title: "Configuration",    
			        dragEnabled: true,
				        bindingOptions: {
				            visible: "visiblePopup",
			        },
                    showCloseButton: false,
                    buttons: [
                        {
                            toolbar: 'top',
                            location: 'after',
                            widget: 'button',
                            options: {
                                type: 'close',
                                icon: 'close',
                                onClick: function() {
                        			$scope.visiblePopup = false;
                                }
                            }
                        }
                    ]
			};
		    $scope.showInfo = function (data) {
        			$scope.visiblePopup = true;
		    }; 
			$scope.closePopUp = function(){
        			$scope.visiblePopup = false;
			}
			$scope.saveData = function(){
				if($rootScope.studyStageId){
					delete $scope.payload.masterStagesConfigPK;
					$scope.payload.studyStagesConfigPK ={
							"enterpriseId": $rootScope.enterpriseID,
							"studyStageID": $rootScope.studyStageId}
				}
				$scope.payload.fileNamePattern = $scope.patternOne;//+","+$scope.patternTwo;
			$scope.payload.loadAs = $scope.payload.loadAs ? $scope.payload.loadAs:"";
			$scope.payload.fileValidationRule = $scope.payload.fileValidationRule ? $scope.payload.fileValidationRule :""; 
			$scope.payload.recDelimiterChar = $scope.payload.recDelimiterChar ? $scope.payload.recDelimiterChar :"";
			$scope.payload.initialRowsToSkip =  $scope.payload.initialRowsToSkip !="" ?  $scope.payload.initialRowsToSkip : 0;
			$scope.payload.maxAllowedErr =  $scope.payload.maxAllowedErr !="" ?  $scope.payload.maxAllowedErr : 0;
			$scope.payload.fileFormat = $scope.payload.fileFormat ? $scope.payload.fileFormat :"";
			$scope.payload.stageDir = $scope.payload.stageDir ? $scope.payload.stageDir :"";
			$scope.payload.colDelimiterChar = $scope.payload.colDelimiterChar ? $scope.payload.colDelimiterChar : ""; 
			$scope.payload.enclosingChar = $scope.payload.enclosingChar ? $scope.payload.enclosingChar : "";
			$scope.payload.schemaPattern = $scope.payload.schemaPattern ? $scope.payload.schemaPattern :"";
			if($scope.payload.loadTypeCode){

				if($scope.update){
					
					fetchData.updateConfigData($scope.payload,$rootScope.studyStageId ? "0":"1").then(function(response){
						if(response.data.result == "success"){
							$scope.displayMsg = true;
							$timeout(function(){
								$scope.displayMsg = false;
								$scope.visiblePopup = false;
							},2000);
						}
						
					},function(){
						$scope.displayMsgError = true;
						autoClosePopUp();
					});
				}else{
				fetchData.addConfig($scope.payload,$rootScope.studyStageId ? "0":"1").then(function(response){
						if(response.data.result == "success"){
							$scope.displayMsg = true;
							$timeout(function(){
								$scope.displayMsg = false;
								$scope.visiblePopup = false;
							},2000);
						}
						
				},function(){
					$scope.displayMsgError = true;
					autoClosePopUp();
				});
				}
				}else{
						$scope.LoadtypeError = true;
						autoClosePopUp();
				}
			}
		$scope.exit = function(){
			$scope.visiblePopup2 = true;
		}
		$scope.exitNo = function(){
			$scope.visiblePopup2 = false;
		}
		$scope.exitY = function(){
			$scope.visiblePopup2 = false;
		}
		function autoClosePopUp(){
			$timeout(function(){
				$scope.LoadtypeError = false;
				$scope.displayMsgError = false;
			},2000);
		}
		 $("#headerFilter").dxCheckBox({
		        text: "Header Filter",
		        value: true,
		        onValueChanged: function(data) {
		            dataGrid.clearFilter();
		            dataGrid.option("headerFilter.visible", data.value);
		        }
		    });			
			
			
			var count = 0;
			$rootScope.subchildHide = false;
			$rootScope.info = true;
			function hide(){
				$timeout(function(){
					$rootScope.info = false;					
				},3000);
			}
			hide();
			$scope.values = [{"data":"0"},{"data":"0"},{"data":"0"},{"data":"0"}];
			var pages = $location.search().value ? $location.search().value.split("\\") : [];
			if(pages.length > 0 ){
				$scope.without_left_panel = false;
			}else{
				$scope.without_left_panel = true;
			}
 		$rootScope.pageHeading = "Study";				
 				fetchData.GetDropdown().then(function(response){
 					var data = response.data.sort(function(a, b){ return a.position - b.position });
					$scope.dropDown = data;
					for(var i = 0;i<data.length; i++){
						$scope.getChild(data[i].studyHierPK,i);
					}
				});
			$scope.getChild = function(request,counts){
				if(request){
				count++;
				$scope.dropDown[counts].dropDownChild = [];
				fetchData.GetDropDownOptions(request).then(function(response){
					$scope.dropDown[counts].dropDownChild = response.data;
					$scope.dropDown[counts].dropDownChild.unshift({"studyHierItemsPK":{"hierListItemID":"0"},"hierListItemName":"select"});
					$scope.values[counts].data = "0"; 
					for(var j = 1; j < pages.length; j++){

						for(var i = 0;i<response.data.length;i++ ){
							if(pages[j] == response.data[i].hierListItemName){
								$scope.values[counts].data = response.data[i].studyHierItemsPK.hierListItemID;
						}
					}
				}
					$scope.$watch('values',function(){
						$scope.callData();
					})
				});			
				}
				
			}

			fetchData.getData("").then(function(response){
				$rootScope.dropDown = response.data;
			})

			
			$scope.callData = function(){
				var request = "";
				var flag = true;
				for(var i = 0; i < count;i++ ){
					if(this.values[i].data =="" || this.values[i].data =="0"){
						flag = false;
					}
				}
				if(pages.length > 0){
					flag = true;
				}
				if(pages.length > 0){
					$scope.$watch("values",function(newValue, old, scope){
						request = '';
						for(var i=0;i<$scope.values.length;i++){
							if($scope.values[i]["data"] != 0){						
								request +="/"+$scope.values[i].data;
							}
						}
						localStorage.setItem("request",request);
					},true);

				}else{
					if(this.values.length <= count && flag){
						for(var i=0;i<$scope.values.length;i++){
							if($scope.values[i]["data"] != 0){						
								request +="/"+$scope.values[i].data;
								
							}
						}
						DrawTable(request);
					}
				}
			}
			$timeout(function(){
				DrawTable(localStorage.getItem("request"));	
				localStorage.removeItem("request");
			},1000);
			fetchData.GetENVTYPE("").then(function(response){
				$scope.EnvType = response.data;
			})

			var oldStage = "";
			function CallChild(){
				var studyId = "";
				var enterprise = "";
				if(pages.length > 0){
					study = pages[pages.length - 1];
					for(var  i = 0; i < $scope.data.length; i++){
						if(study == $scope.data[i].studyName)
						{
							studyId = $scope.data[i].studyPK.studyID;
							enterprise = $scope.data[i].studyPK.enterpriseId;
						}
					}
					if(studyId != "" && oldStage != studyId){
						oldStage = studyId;
						$rootScope.studyPK = {"enterpriseId":enterprise,"studyID":studyId};
						fetchData.GetStudiesStage({"enterpriseId":enterprise,"studyID":studyId}).then(function(response){
							$scope.datachild = response.data;

							if(pages.length >0 ){					
									$scope.childHide = false;
							}
							for(var i=0; i < $scope.datachild.length;i++){
								$scope.datachild[i].blindEnabled = $scope.datachild[i].blindEnabled == "Y" ? true : false; 	
								$scope.datachild[i].isLocked = $scope.datachild[i].isLocked == "Y" ? true : false;
								$scope.datachild[i].auditEnabled = $scope.datachild[i].auditEnabled == "Y" ? true : false; 	
								$scope.datachild[i].isActive = $scope.datachild[i].isActive == "Y" ? true : false; 
								$scope.datachild[i].isStructureChangeAllowed = $scope.datachild[i].isStructureChangeAllowed == "Y" ? true : false;
							}
							$rootScope.subchildHide = true;
							drawChild();
					});
					}
				}				
			}
			function drawChild(){
				$scope.studyGridOptionsChildSubChild = {										
						paging: {
							pageSize: 7
						},
						sorting:{
							mode:'multiple'
						},
						selection: {
				            mode: "single"
				        },
						searchPanel: {
				            visible: true,
				            width: 240,	
				            placeholder: "Search..."
				        },
						headerFilter: {
				            visible: true
				        },
						filterRow: {
				            visible: true,
				            applyFilter: "auto"
				        },
				        pager: {
							showPageSizeSelector: true,
							allowedPageSizes: [5, 10, 20],
							showInfo: true
						},
						bindingOptions:{
							dataSource: "datachild",
						},
						editing: {
							mode: "popup",
							allowUpdating: true,
							allowDeleting: true,
							allowAdding: true,
							popup: {
								title: "Compnay Info",
								showTitle: true,
								width: 700,
								height: 300,
								position: {
									my: "center",
									at: "center",
									of: window
								}
							}
						},
						columns: [{
							dataField: "stageName",
							sortOrder:"asc",
							caption:"Stage Name",
							setCellValue:function(rowData, value){
								for(var i =0 ; i < $rootScope.dropDown.length; i++){
									if(value == $rootScope.dropDown[i].stageName){
										rowData.auditEnabled = $rootScope.dropDown[i].auditEnabled == "Y" ? true : false;
										rowData.blindEnabled = $rootScope.dropDown[i].blindEnabled == "Y" ? true : false;
										rowData.isActive = $rootScope.dropDown[i].isActive == "Y" ? true : false;
										rowData.stageName = value;
									}
								}
							} ,
							lookup:{
								dataSource:$rootScope.dropDown,
								displayExpr:"stageName",
								valueExpr:"stageName"
							}

						}, {
							dataField: "stageTypeCode",
							sortOrder:"asc",
							caption:"Stage Code",
							allowEditing:false,
							formItem: {
						        visible: false
						    }
						},{
							dataField: "auditEnabled",
							sortOrder:"asc",
							caption:"Audit",
							dataType:"boolean"
						},{
							dataField: "blindEnabled",
							sortOrder:"asc",
							caption:"Blind",
							dataType:"boolean"
						},{
							dataField: "isActive",
							sortOrder:"asc",
							caption:"Active",
							dataType:"boolean"
						},{
							dataField: "isLocked",
							sortOrder:"asc",
							caption:"Locked",
							dataType:"boolean"
						},{
							dataField: "isStructureChangeAllowed",
							sortOrder:"asc",
							caption:"Structure change",
							dataType:"boolean"
						},{
							dataField: "stageStoreSchema",
							caption:"Store schema",
							sortOrder:"asc",
						},{
							dataField: "stageTargetViewSchema",
							caption:"Target View",
							sortOrder:"asc",
						},{
							dataField: "Configuration",
							width: 100,
							allowEditing:false,
							formItem: {
						        visible: false
						    },
							cellTemplate: function(container, options) {
								$("<div>", {
										"class": "img-container text-center"
									})
									.append($("<img>", {
										"src": 'img/cog.png'
									}))
									.appendTo(container);
							}
						

						}],
						onRowInserted: function(e) {
							var date = new Date();
							delete e.data.__KEY__;
							for(var i = 0; i < $rootScope.dropDown.length; i++){
								if($rootScope.dropDown[i].stageName == e.data.stageName ){
									e.data.stageTypeCode = $rootScope.dropDown[i].stageTypeCode ;
								}
							}
							e.data.enterpriseID = $rootScope.studyPK.enterpriseId;
							e.data.studyID = $rootScope.studyPK.studyID;
							e.data.studyStageID = 0;
							e.data.blindEnabled = e.data.blindEnabled ? "Y" : "N";
							e.data.isLocked = e.data.isLocked ? "Y" : "N";
							e.data.auditEnabled = e.data.auditEnabled ? "Y" : "N";
							e.data.isActive = e.data.isActive ? "Y" : "N";
							e.data.isStructureChangeAllowed = e.data.isStructureChangeAllowed ? "Y" : "N";
							e.data.linkedMasterStageId = "12345";
							e.data.createdBy =  $rootScope.studyPK.enterpriseId;
							e.data.updatedBy =  $rootScope.studyPK.enterpriseId;
							e.data.createdOn = [date.getFullYear(),date.getMonth()+1,date.getDate()];
							e.data.updatedOn = [date.getFullYear(),date.getMonth()+1,date.getDate()];
							fetchData.AddStudiesStage(e.data).then(function(response){
								$rootScope.displayMsg = true;
								if(response.data.result == "success"){
									fetchData.GetStudiesStage($rootScope.studyPK).then(function(response){
										$scope.datachild = response.data;
										for(var i=0; i < $scope.datachild.length;i++){
											$scope.datachild[i].blindEnabled = $scope.datachild[i].blindEnabled == "Y" ? true : false; 
											$scope.datachild[i].isLocked = $scope.datachild[i].isLocked == "Y" ? true : false;
											$scope.datachild[i].auditEnabled = $scope.datachild[i].auditEnabled == "Y" ? true : false; 
											$scope.datachild[i].isActive = $scope.datachild[i].isActive == "Y" ? true : false; 
											$scope.datachild[i].isStructureChangeAllowed = $scope.datachild[i].isStructureChangeAllowed == "Y" ? true : false;
										}

									});
									$scope.count++;
									$timeout(function(){
									//	window.location.reload();
										$rootScope.displayMsg = false;
									},2000);
								}
							}, function(){
								$rootScope.dangerMsgPosition = true;									
								fetchData.GetStudiesStage($rootScope.studyPK).then(function(response){
									$scope.datachild = response.data;
								});

								$timeout(function(){
									$rootScope.dangerMsgPosition = false;
									for(var i=0; i < $scope.datachild.length;i++){
										$scope.datachild[i].blindEnabled = $scope.datachild[i].blindEnabled == "Y" ? true : false; 
										$scope.datachild[i].isLocked = $scope.datachild[i].isLocked == "Y" ? true : false;
										$scope.datachild[i].auditEnabled = $scope.datachild[i].auditEnabled == "Y" ? true : false; 
										$scope.datachild[i].isActive = $scope.datachild[i].isActive == "Y" ? true : false; 
										$scope.datachild[i].isStructureChangeAllowed = $scope.datachild[i].isStructureChangeAllowed == "Y" ? true : false;
									}
								},2000);
								}											

							);
						},
						onRowUpdated: function(e) {
							for(var i = 0; i < $rootScope.dropDown.length; i++){
								if($rootScope.dropDown[i].stageName == e.key.stageName ){
									e.key.stageTypeCode = $rootScope.dropDown[i].stageTypeCode ;
								}
							}

							delete e.key.jobId;
							delete e.key.operation;
							e.key.blindEnabled = e.key.blindEnabled ? "Y" : "N";
							e.key.isLocked = e.key.isLocked ? "Y" : "N";
							e.key.auditEnabled = e.key.auditEnabled ? "Y" : "N";
							e.key.isActive = e.key.isActive ? "Y" : "N";
							e.key.isStructureChangeAllowed = e.key.isStructureChangeAllowed ? "Y" : "N";
							fetchData.UpdateStudiesStage(e.key).then(function(response){
								if(response.data.result == "success"){
										$rootScope.updateMsg = true;
										fetchData.GetStudiesStage($rootScope.studyPK).then(function(response){
											$scope.datachild = response.data;
											for(var i=0; i < $scope.datachild.length;i++){
												$scope.datachild[i].blindEnabled = $scope.datachild[i].blindEnabled == "Y" ? true : false; 
												$scope.datachild[i].isLocked = $scope.datachild[i].isLocked == "Y" ? true : false;
												$scope.datachild[i].auditEnabled = $scope.datachild[i].auditEnabled == "Y" ? true : false; 
												$scope.datachild[i].isActive = $scope.datachild[i].isActive == "Y" ? true : false; 
												$scope.datachild[i].isStructureChangeAllowed = $scope.datachild[i].isStructureChangeAllowed == "Y" ? true : false;
											}

										})
										$timeout(function(){
										//	window.location.reload();
											$rootScope.updateMsg = false;
										},2000);
								}
							}, function(){
								$rootScope.dangerMsgPosition = true;										
								$timeout(function(){
									$rootScope.dangerMsgPosition = false;
									},2000);
							})
						},
						onRowRemoved: function(e) {
							delete e.key.jobId;
							delete e.key.operation;
							e.key.blindEnabled = e.key.blindEnabled ? "Y" : "N";
							e.key.isLocked = e.key.isLocked ? "Y" : "N";
							e.key.auditEnabled = e.key.auditEnabled ? "Y" : "N";
							e.key.isActive = e.key.isActive ? "Y" : "N";
							e.key.isStructureChangeAllowed = e.key.isStructureChangeAllowed ? "Y" : "N";
							fetchData.DeleteStudiesStage(e.key).then(function(response){
								if(response.data.result == "success"){
									fetchData.GetStudiesStage($rootScope.studyPK).then(function(response){
										$scope.datachild = response.data;
										for(var i=0; i < $scope.datachild.length;i++){
											$scope.datachild[i].blindEnabled = $scope.datachild[i].blindEnabled == "Y" ? true : false; 
											$scope.datachild[i].isLocked = $scope.datachild[i].isLocked == "Y" ? true : false;
											$scope.datachild[i].auditEnabled = $scope.datachild[i].auditEnabled == "Y" ? true : false; 
											$scope.datachild[i].isActive = $scope.datachild[i].isActive == "Y" ? true : false; 
											$scope.datachild[i].isStructureChangeAllowed = $scope.datachild[i].isStructureChangeAllowed == "Y" ? true : false;
										}

									})
									$rootScope.delMsg = true;
									$timeout(function(){
									//	window.location.reload();
										$rootScope.delMsg = false;
									},2000);
								}
							}, function(){
								$rootScope.dangerMsgPosition = true;									
								$timeout(function(){
									$rootScope.dangerMsgPosition = false;
								},2000);
							}														
							)
						},
						onCellClick:function(e){
							if (e.rowType == 'data' && e.column.dataField == "Configuration") {
								if(e.data.stageTypeCode == "IMPORT"){
									for(var i = 0; i < $rootScope.dropDown.length; i++){
										if($rootScope.dropDown[i].stageName == e.data.stageName ){
											$rootScope.masterStageID = $rootScope.dropDown[i].stageID ;
										}
									}
									$rootScope.studyStageId = e.data.studyStageID;
									$rootScope.stageId = null; 
									$rootScope.enterpriseID = e.data.enterpriseID;
									$scope.visiblePopup = true;
									fetchData.getLoad("").then(function(response){
										$scope.loadList = response.data;
									});
									fetchData.LoadAs("").then(function(response){
										$scope.loadAsDropDown = response.data;
									});
									fetchData.FileType("").then(function(response){
										$scope.loadFileType = response.data;
									});
									fetchDataCall($rootScope.studyStageId);
									//$location.path("/configure");
								}
							}
						},
						onInitNewRow: function(e) {
							e.data.isActive = true;
							e.data.blindEnabled = true;
							e.data.auditEnabled = true;

						},
						onRowUpdating: function(e) {

				        },
				}
				
			}
			var oldValue = "";
			function DrawTable(request){
				if(request != "" && request.split("/").length>0 && oldValue != request){
				oldValue = request;
				$scope.childHide = true;
				$rootScope.request = request;
				fetchData.GetStudiestwo(request).then(function(response){
					console.log(response.data);
					$scope.data = response.data;
						CallChild();
						$rootScope.subchildHide = false;
					$scope.studyGridOptionsChild = {
							
							paging: {
								pageSize: 7
							},
							sorting:{
								mode:'multiple'
							},
							selection: {
					            mode: "single"
					        },
							searchPanel: {
					            visible: true,
					            width: 240,	
					            placeholder: "Search..."
					        },
							headerFilter: {
					            visible: true
					        },
							filterRow: {
					            visible: true,
					            applyFilter: "auto"
					        },
					        pager: {
								showPageSizeSelector: true,
								allowedPageSizes: [5, 10, 20],
								showInfo: true
							},
							bindingOptions:{
								dataSource: "data",
							},
							editing: {
								mode: "popup",
								allowUpdating: true,
								allowDeleting: true,
								allowAdding: true,
								popup: {
									title: "Compnay Info",
									showTitle: true,
									width: 700,
									height: 200,
									position: {
										my: "center",
										at: "center",
										of: window
									}
								}
							},
							columns: [{
								dataField: "studyName",
								sortOrder:"asc"
							}, {
								dataField: "studyEnvironment",
								sortOrder:"asc",
								lookup:{
									dataSource:$scope.EnvType,
									displayExpr:"codeListsPK.codeListName",
									valueExpr:"codeListsPK.codeListCode"
								}
							}],
							onRowClick:function(e){
								$rootScope.studyPK = e.data.studyPK;
								fetchData.GetStudiesStage(e.data.studyPK).then(function(response){
									$scope.datachild = response.data;
									for(var i=0; i < $scope.datachild.length;i++){
										$scope.datachild[i].blindEnabled = $scope.datachild[i].blindEnabled == "Y" ? true : false; 
										$scope.datachild[i].isLocked = $scope.datachild[i].isLocked == "Y" ? true : false;
										$scope.datachild[i].auditEnabled = $scope.datachild[i].auditEnabled == "Y" ? true : false; 
										$scope.datachild[i].isActive = $scope.datachild[i].isActive == "Y" ? true : false; 
										$scope.datachild[i].isStructureChangeAllowed = $scope.datachild[i].isStructureChangeAllowed == "Y" ? true : false;
									}
									$rootScope.subchildHide = true;
									drawChild();
								});
							},
							onRowInserted: function(e) {
								delete e.data.__KEY__;
								var date = new Date();
								var json = {
								 	"studyPK": {
								 		"enterpriseId": 1000,
								 		"studyID": Math.round(Math.random(10000,100000)*10000)
								 	},
								 	"studyHierItemsID1": $scope.values[0] ? $scope.values[0].data : "0",
								 	"studyHierItemsID2": $scope.values[1] ? $scope.values[1].data : "0",
								 	"studyHierItemsID3": $scope.values[2] ? $scope.values[2].data : "0",
								 	"studyHierItemsID4": $scope.values[3] ? $scope.values[3].data : "0",
								 	"studyHierItemsID5": $scope.values[4] ? $scope.values[4].data : "0",
								 	"studyEnvironment": e.data.studyEnvironment,
								 	"createdOn": [
								 		date.getFullYear(),
								 		date.getMonth()+1,
								 		date.getDate()
								 	],
								 	"createdBy": 10000,
								 	"updatedOn": [
								 		date.getFullYear(),
								 		date.getMonth()+1,
								 		date.getDate()
								 	],
								 	"updatedBy": 10000,
								 	"studyName": e.data.studyName
								 };
								fetchData.AddStudies(json).then(function(response){
									$rootScope.displayMsg = true;
									fetchData.GetStudiestwo($rootScope.request).then(function(response){
										$scope.data = response.data;
									})

									if(response.data.result == "success"){
										$scope.count++;
										$timeout(function(){
										//	window.location.reload();
											$rootScope.displayMsg = false;
										},2000);
									}
								}, function(){
									$rootScope.dangerMsgPosition = true;									
									$timeout(function(){
										$rootScope.dangerMsgPosition = false;
									},2000);
									}			
								)
							},
							onRowUpdated: function(e) {
								delete e.key.studyHierItemsName1;
								delete e.key.studyHierItemsName2;
								delete e.key.studyHierItemsName3;
								delete e.key.studyHierItemsName4;
								delete e.key.operation;
								fetchData.UpdateStudies(e.key).then(function(response){
									if(response.data.result == "success"){
										$rootScope.updateMsg = true;
										fetchData.GetStudiestwo($rootScope.request).then(function(response){
											$scope.data = response.data;
										})
										$timeout(function(){
										//	window.location.reload();
											$rootScope.updateMsg = false;
										},2000);
									}
								}, function(){
									$rootScope.dangerMsgPosition = true;									
									$timeout(function(){
										$rootScope.dangerMsgPosition = false;
									},2000);
									})
							},
							onRowRemoved: function(e) {
								delete e.key.studyHierItemsName1;
								delete e.key.studyHierItemsName2;
								delete e.key.studyHierItemsName3;
								delete e.key.studyHierItemsName4;
								delete e.key.studyHierItemsName5;
								delete e.key.operation;
								e.key.studyEnvironment = e.key.studyEnvironment ?e.key.studyEnvironment : ""; 
								e.key.studyHierItemsID1 = e.key.studyHierItemsID1 ?e.key.studyHierItemsID1 : "0"; 
								e.key.studyHierItemsID2 = e.key.studyHierItemsID2 ?e.key.studyHierItemsID2 : "0"; 
								e.key.studyHierItemsID3 = e.key.studyHierItemsID3 ?e.key.studyHierItemsID3 : "0"; 
								e.key.studyHierItemsID4 = e.key.studyHierItemsID4 ?e.key.studyHierItemsID4 : "0"; 
								e.key.studyHierItemsID5 = e.key.studyHierItemsID5 ?e.key.studyHierItemsID5 : "0"; 									
								fetchData.DeleteStudies(e.key).then(function(response){
											if(response.data.result == "success"){
												fetchData.GetStudiestwo($rootScope.request).then(function(response){
													$scope.data = response.data;
												})

												$rootScope.delMsg = true;
									$timeout(function(){
										//window.location.reload();
										$rootScope.delMsg = false;
									},2000);
								}
							}, function(){
								$rootScope.dangerMsgPosition = true;									
								$timeout(function(){
									$rootScope.dangerMsgPosition = false;
								},2000);
							})
							}
						};
				});
				}
			}
				
			$interval(function(){
				$(".dx-link-edit").addClass("dx-icon-edit");					
				$(".dx-link-edit").html("")					
				$(".dx-link-delete").html("")					
				$(".dx-link-delete").addClass("dx-icon-trash")
				$("#gridContainerChildStudyStages").css("width","100%");
				$("#gridContainerChildStudyStages").css("overflow","scroll");
			},1000);
		});
		</script>
		</head>
		<body ng-app="myApp" ng-controller="page4Controller"> 
<div >


                      <form class="form-horizontal" dx-popup >
                        <div ng-show="without_left_panel" class="form-group" ng-repeat="data in dropDown track by $index" ng-init="$indexvalue = $index;callData()">
                          <label class="control-label col-sm-3" for="email">{{data.hierName}}</label>
                          <div class="col-sm-3">
                          <select ng-model="values[$index].data" class="form-control" ng-change="callData()" ng-options="datas.studyHierItemsPK.hierListItemID as datas.hierListItemName for datas in data.dropDownChild">
                          </select>
                          </div>
                        </div>
		<div class="col-md-12" ><br>
		<h1 class="page-header2"  ng-show="childHide">Studies</h1><br>
        <div ng-show="childHide" id="gridContainerChild" dx-data-grid="studyGridOptionsChild" ></div>
		</div>                        


		<div class="col-md-12" ><br>
		<h1 class="page-header2"  ng-show="subchildHide">Studies Stages</h1></br>
        <div ng-show="subchildHide" id="gridContainerChildStudyStages" dx-data-grid="studyGridOptionsChildSubChild" ></div>
		</div>                        


                        </form>


<div class="popup" 
                    dx-popup="popupOptionsExit" >
                    <div data-options="dxTemplate: { name:'info2' }">
  		<div class="alert alert-danger">
				Do you want to exit without save the changes ?
		</div><br>
                        <div class="form-group"> 
                          <div class="col-sm-offset-2 col-sm-3" id="topM">
                            <button type="submit" class="btn btn-default" ng-click="exitY()">Yes</button>
                          </div>
                          <div class="col-sm-3" id="topM">
                            <button type="submit" class="btn btn-default" ng-click="exitNo()">No</button>
                          </div>
						</div>
                    </div>
           </div>

<div class="popup2" 
                    dx-popup="popupOptions" >
                    <div data-options="dxTemplate: { name:'info' }">
		<div class="alert alert-success" ng-if="displayMsg">
				Data successfully Saved.
		</div>
		<div class="alert alert-danger" ng-if="displayMsgError">
				Internal server error, Please enter the correct data .
		</div>
		<div class="alert alert-danger" ng-if="LoadtypeError">
				Please Select Load type.
		</div>
                      <form class="form-horizontal">
                        <div class="form-group">
                          <label class="control-label col-sm-5" for="email">Load Type</label>
                          <div class="col-sm-7">
						  
						  
                          <select ng-model="payload.loadTypeCode" class="form-control">
                            <option>select</option>
                            <option  ng-repeat="data in loadList" value={{data.codeListsPK.codeListCode}}>{{data.codeListsPK.codeListName}}</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group" ng-if="STAGE_TYPE=='IMPORT' && payload.loadTypeCode == 'ORACLE' || payload.loadTypeCode == 'SQLSERVER'">
                          <label class="control-label col-sm-5" for="pwd">DB Connection</label>
                            <div class="col-sm-7"> 
                              <select ng-model="dbConnection" class="form-control">
                                <option>select</option>
                              </select>
                            </div>
                        </div>
                        <div class="form-group" ng-if="STAGE_TYPE=='IMPORT' && payload.loadTypeCode== 'ORACLE' || payload.loadTypeCode == 'SQLSERVER'">
                          <label class="control-label col-sm-5" for="pwd">Schema/Study Pattern</label>
                            <div class="col-sm-7"> 
                              <input type="text" class="form-control" name="" ng-model="payload.schemaPattern" value={{studySchema}}>
                            </div>
                        </div>
                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'ORACLE' || payload.loadTypeCode == 'SQLSERVER'">
                          <label class="control-label col-sm-5" for="pwd">Load As</label>
                            <div class="col-sm-7"> 
                              <select ng-model="payload.loadAs" class="form-control">
                                <option>select</option>
								<option ng-repeat="LoadAsData in loadAsDropDown" value={{LoadAsData.codeListsPK.codeListCode}}>{{LoadAsData.codeListsPK.codeListName}}</option>
                              </select>
                            </div>
                        </div>


                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'SAS' || payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">Stage Directory</label>
                            <div class="col-sm-7"> 
                              <input type="text" class="form-control" name="" ng-model="payload.stageDir">
                            </div>
                        </div>

                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'SAS' || payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">File Type</label>
                            <div class="col-sm-7"> 
                              <select ng-model="payload.fileFormat" class="form-control">
                                <option>select</option>
								<option ng-repeat="data in loadFileType" value={{data.codeListsPK.codeListCode}}>{{data.codeListsPK.codeListName}}</option>
                              </select>
                            </div>
                        </div>


                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'SAS' || payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">File Name pattern</label>
                            <div class="col-sm-7"> 
                              <input type="text" class="form-control" name="" ng-model="patternOne" value={{patternOne}}>
                            </div></div>
                            
                            <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'SAS' || payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'"> 
                             <label class="control-label col-sm-5" for="pwd"></label>
                            <div class="col-sm-7"> 
                              <input type="text" class="form-control" name="" ng-model="patternTwo" value={{patternTwo}}>
                            </div>
                        </div>


                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">Delimiter Char</label>
                            <div class="col-sm-5"> 
                              <input type="text" class="form-control" maxlength="1" name="" ng-model="payload.colDelimiterChar" value={{payload.colDelimiterChar}}>
                            </div>
                        </div>
                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">Enclosing Char</label>
                            <div class="col-sm-5"> 
                              <input type="text" class="form-control" maxlength="1" name="" ng-model="payload.enclosingChar">
                            </div>
                        </div>
                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">Initial Row to Skip</label>
                            <div class="col-sm-7"> 
                              <input type="number" class="form-control" name="" ng-model="payload.initialRowsToSkip" value={{payload.initialRowsToSkip}}>
                            </div>
                        </div>
                        <div class="form-group" ng-if="STAGE_TYPE == 'IMPORT' && payload.loadTypeCode == 'CSV' || payload.loadTypeCode == 'TEXT'">
                          <label class="control-label col-sm-5" for="pwd">Maximum Allowed Error</label>
                            <div class="col-sm-7"> 
                              <input type="number" class="form-control" name="" ng-model="payload.maxAllowedErr" value={{payload.maxAllowedErr}}>
                            </div>
                        </div>
						<div class="bottemPopup">
                        <div class="form-group"> 
                          <div class="col-sm-offset-7 col-sm-2">
                            <button type="submit" class="btn btn-default" ng-click="saveData()">SAVE</button>
                          </div>
                          <div class="col-sm-2">
                            <button type="submit" class="btn btn-default" ng-click="closePopUp()">CANCEL</button>
                          </div>
                        </div>
						</div>
                      </form>
                    </div>
                </div>
</div>
<!-- </body> -->
</html>
