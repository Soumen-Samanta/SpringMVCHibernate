<!doctype html>
<html lang="en">
  <head>
    <title>angularCURD</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <script type="text/javascript" src="js/angular.main.js"></script>
    <script type="text/javascript" src="js/app.js"></script>
</head>
  <body ng-app="myApp" ng-controller="myController">
    <div class="container">  		
        <hr>
        <label style="font-size:30px">All Users</label>
        <button type="button" class="btn btn-info btn-lg pull-right" style="margin-left:1000px" data-toggle="modal" data-target="#myModal">Add New</button>
        <div class="clearfix"></div>
        <hr>
            
        <div class="alert alert-info alert-dismissible" role="alert" ng-if="info">
          <button type="button" class="close" aria-label="Close"><span aria-hidden="true" ng-click="clearInfo()">&times;</span></button>
          {{info}}
        </div>

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
              <tr ng-repeat="user in users">
                <td> {{ $index+1 }}.</td>
                <td> {{user.username}} </td>
                <td>{{user.email}}</td>
                <td> <button class="btn btn-info btn-sm"  type="button" data-toggle="modal" data-target="#myModalEdit" ng-click="selectUser(user)">Edit</button> </td>
                <td> <button class="btn btn-danger btn-sm" type="button" data-toggle="modal" data-target="#myModalDelete" ng-click="selectUser(user)">Delete</button> </td>
              </tr>		      
            </tbody>
          </table>
        </div>    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    

    
    
    <!-- Modal -->
    <div id="myModal" class="modal fade" role="dialog">
      <div class="modal-dialog">
    
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">New User Registration</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" placeholder="Username" ng-model="newUser.username">
                </div>
              </div>
    
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" placeholder="Email" ng-model="newUser.email">
                </div>
              </div>
    
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">FullName</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" placeholder="Full Name" ng-model="newUser.fullName">
                </div>
              </div>
                            
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="saveUser();">Save</button>
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
    
    
    <!-- Modal -->
    <div id="myModalEdit" class="modal fade" role="dialog">
      <div class="modal-dialog">
    
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Edit This User</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" placeholder="Username" ng-model="clickedUser.username">
                </div>
              </div>
    
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" placeholder="Email" ng-model="clickedUser.email">
                </div>
              </div>
    
              <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">FullName</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="inputEmail3" placeholder="Full Name" ng-model="clickedUser.fullName">
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
    
    <!-- Modal -->
    <div id="myModalDelete" class="modal fade" role="dialog">
      <div class="modal-dialog">
    
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Are You Sure?</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <strong style="color: red">You are going to delete the user</strong>
            <br/>
          </div>
          <div class="modal-footer">
          <button type="button" class="btn btn-default pull-left" data-dismiss="modal" ng-click="deleteUser()">Yes</button>	      	
            <button type="button" class="btn btn-default pull-right" data-dismiss="modal">No</button>
          </div>
        </div>
    
      </div>
    </div>
  
  
  
  

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>