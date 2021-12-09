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
            <div class="col-md-12">
                <%
                    Dim cpt
                    Set rst=getAllUsers
                    
                    Response.Write rst.RecordCount
                    cpt=1
                    
                    
                %>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <th>#</th>
                            <th>Nom</th>
                            <th>Tél</th>
                            <th>Email</th>
                            <th>Action</th>
                        </thead>
                        <tbody>
                            <% While Not rst.EOF %>
                                      
                            <tr>
                                <td><% =cpt %></td>
                                <td><% =rst.Fields("name") %></td>
                                <td><% =rst.Fields("phone") %></td>
                                <td><% =rst.Fields("email") %></td>
                                <td>
                                    <a href="delete.asp?id=<% =rst.Fields("userID") %>" class="text-danger"><i class="bi bi-trash"></i></a> | 
                                    <a href="edit.asp?id=<% =rst.Fields("userID") %>" class="text-danger"><i class="bi bi-pencil"></i></a>
                                    

                                    </td>
                            </tr>
                            <%
                                cpt=cpt+1
                                rst.MoveNext
                                Wend
                                rst.close
                                Set rst=Nothing
                            %>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</body>
</html>