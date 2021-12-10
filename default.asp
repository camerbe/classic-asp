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
   
    <!--#include virtual="AspEtnic/inc/dbConnection.asp"-->
    <!--#include virtual="AspEtnic/tools/dbHelpers.asp"-->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <%
                    Dim cpt,lngPageCount,intPageNum
                    Set rst=getAllUsers
                    rst.PageSize=5
                    lngPageCount=rst.PageCount
                    If Request.QueryString("page")="" Then
                        intPageNum=1
                    Else
                        intPageNum=Cint(Request.QueryString("page"))
                    End If
                    
                    rst.AbsolutePage=intPageNum
                    cpt=1
                    
                    
                %>
                <div class="card">
                    <div class="card-header">
                        <h3><i class="bi bi-card-list"></i> Liste</h3> 
                    </div>
                    <div class="card-body">
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
                                    <% While Not rst.EOF And cpt <=rst.PageSize %>
                                            
                                    <tr>
                                        <td><% =cpt %></td>
                                        <td><% =rst.Fields("name") %></td>
                                        <td><% =rst.Fields("phone") %></td>
                                        <td><% =rst.Fields("email") %></td>
                                        <td>
                                            
                                            <button class="text-danger"  id="delete<% =rst.Fields("userID") %>" data-id="<% =rst.Fields("userID") %>"><i class="bi bi-trash"></i></button > | 
                                            <a href="edit.asp?id=<% =rst.Fields("userID") %>" class="text-danger"><i class="bi bi-pencil"></i></a>
                                            

                                            </td>
                                    </tr>
                                    <%
                                        cpt=cpt+1
                                        rst.MoveNext
                                        Wend
                                        
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                            <% For i=1 to lngPageCount  %>
                                <li class="page-item"><a class="page-link" href="default.asp?page=<%=i%>"><%=i%></a></li>
                            <% Next %>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                        <%
                            rst.close
                            Set rst=Nothing
                        %>
                    </div>
                </div>
                

            </div>
        </div>
    </div>
    <script defer>
        let btnDeletes=document.querySelectorAll("button");
        // let id=btnDelete.getAttribute("data-id")[0];
        btnDeletes.forEach(element => {
           // let btn=element.get("#delete");
           element.addEventListener("click",function(){
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                if (result.isConfirmed) {
                    const xhttp=new XMLHttpRequest();
                    const url="delete.asp?id="+ element.getAttribute("data-id");
                    xhttp.open("GET", url, false);
                    xhttp.send();
                    Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                    )
                    location.reload();
                }
                })
           });    
            //console.log();
        });
        
        // btnDelete.addEventListener("click",function(){
        //     //console.log(id)
        //     Swal.fire(
        //     'Good job!',
        //     'You clicked the button! ',
        //     'success'
        //     )
        // })
        
    </script>
</body>
</html>