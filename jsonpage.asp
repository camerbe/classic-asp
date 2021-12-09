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
    <!--#include virtual="AspEtnic/inc/header.inc"-->
   
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
                    
                    Dim objSvrHttp,baseUrl
                    baseUrl="https://api.coinbase.com/v2/currencies"
                    Set objSvrHttp =Server.CreateObject("Msxml2.ServerXMLHTTP.6.0")
                    objSvrHttp.Open "Get",baseUrl,False
                    objSvrHttp.send
                    
                    Response.Write objSvrHttp.responseText
                %>
                
                </div>

            </div>
        </div>
    </div>
</body>
</html>