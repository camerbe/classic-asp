
<!--#include virtual="AspEtnic/inc/dbConnection.asp"-->
<!--#include virtual="AspEtnic/tools/dbHelpers.asp"-->

<%
    Dim bIsdeleted
    id=Request.QueryString("id")
   
    
    bIsdeleted=delete(id)
    ' Response.Write isUpdated & "<br />"
    If bIsdeleted Then
        Response.Redirect "default.asp" 
    Else
        Response.Write Request.ServerVariables("HTTP_REFERER") 
    End If
    
    

    
%>