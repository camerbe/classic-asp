
<!--#include virtual="AspEtnic/classes/clsUser.asp"-->
<!--#include virtual="AspEtnic/inc/dbConnection.asp"-->
<!--#include virtual="AspEtnic/tools/dbHelpers.asp"-->

<%
    Dim clsuser , id,bIsAdded
    set clsuser =New User
    
    With clsuser
        .Name=Ucase(Request.Form("name"))
        .Phone=Request.Form("phone")
        .Email=Request.Form("email")
        
    End With
    
    bIsAdded=addUser(clsuser)
    
    If bIsAdded Then
        Response.Redirect "default.asp" 
    Else
        Response.Redirect Request.ServerVariables("HTTP_REFERER") 
    End If
    
    

    
%>