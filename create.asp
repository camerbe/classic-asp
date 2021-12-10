<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--#include virtual="AspEtnic/inc/bootstrap.inc"-->

    <title>Users</title>
</head>
<body>
    <!--#include virtual="AspEtnic/inc/header.asp"-->
    
   
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3>Add User <i class="bi bi-plus-lg"></i></h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="add.asp">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nom</label>
                                <input type="text" class="form-control" id="name" name="name" >
                                
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tél</label>
                                <input type="text" class="form-control" name="phone" >
                                
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email</label>
                                <input type="text" class="form-control" name="email" >
                                
                            </div>
                            
                        
                            <button type="submit" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Add </button>
                        </form>          
                    </div>
                    
                </div>
                      
               
                
            </div>
        </div>
    </div>
</body>
</html>