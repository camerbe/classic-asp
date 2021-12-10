<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--#include virtual="AspEtnic/inc/bootstrap.inc"-->

    <title>JSon</title>
</head>
<body>
    <!--#include virtual="AspEtnic/inc/header.asp"-->
    <!--#include virtual="AspEtnic/classes/aspJSON1.19.asp"-->
    <!--#include virtual="AspEtnic/inc/dbConnection.asp"-->
    <!--#include virtual="AspEtnic/tools/dbHelpers.asp"-->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <%
                    ' Dim cpt
                    ' Set rst=getAllUsers
                    ' rst.MoveLast
                    ' rst.MoveFirst
                    ' Response.Write rst.RecordCount
                    ' cpt=1
                    
                    Dim objSvrHttp,baseUrl,oJSON ,strJson
                    baseUrl="https://jsonplaceholder.typicode.com/comments"
                    Set objSvrHttp =Server.CreateObject("Msxml2.ServerXMLHTTP.6.0")
                    With objSvrHttp
                        .Open "Get",baseUrl,False
                        .setRequestHeader "Content-Type", "application/json"
                        .setRequestHeader "Accept", "application/json"
                        .send
                        ' Set oJSON =.responseText
                        strJson=CStr(.responseText)
                    End With
                    
                    Set oJSON = New aspJSON
                    oJSON.loadJSON(strJson)
                    Response.Write oJSON.data("email") & "<br>"
                    Response.Write oJSON.JSONoutput()    
                    
                    Response.Write strJson
                    ' Response.Write oJSON.data("title") & "<br>"
                %>
                
                </div>

            </div>
        </div>
    </div>
</body>
</html>