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
    <!--#include virtual="AspEtnic/inc/header.inc"-->
    
    <!--#include virtual="AspEtnic/inc/dbConnection.asp"-->
    <!--#include virtual="AspEtnic/tools/dbHelpers.asp"-->
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="bi bi-pencil"></i> Mise à jour</h3>
                    </div>
                    <div class="card-body">
                        <% 
                        Dim intID

                        intID= Request.QueryString("id")
                        
                        Set rst=findOne(intID) 
                        
                        %>
                        <form method="post" action="update.asp">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Nom</label>
                                <input type="text" class="form-control" id="name" name="name" value="<% =rst.Fields("name") %>">
                                
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tél</label>
                                <input type="text" class="form-control" name="phone" value="<% =rst.Fields("phone") %>">
                                
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email</label>
                                <input type="text" class="form-control" name="email" value="<% =rst.Fields("email") %>">
                                
                            </div>
                            
                            <input type="hidden" name="userID" value="<%=rst.Fields("userID")%>">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>          
                    </div>
                      
                </div>
                     
               
                
            </div>
        </div>
    </div>
</body>
</html>