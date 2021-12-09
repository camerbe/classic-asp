
<!--#include virtual="AspEtnic/classes/clsUser.asp"-->
<!--#include virtual="AspEtnic/inc/dbConnection.asp"-->
<!--#include virtual="AspEtnic/tools/dbHelpers.asp"-->

<%
    Dim clsuser , id,isUpdated
    set clsuser =New User
    id=Request.Form("userID")
    With clsuser
        .Name=Request.Form("name")
        .Phone=Request.Form("phone")
        .Email=Request.Form("email")
        
    End With
    
    isUpdated=update(id,clsuser)
    
    If isUpdated Then
        Response.Redirect "default.asp" 
    Else
        Response.Write Request.ServerVariables("HTTP_REFERER") 
    End If
    
    

    
%>