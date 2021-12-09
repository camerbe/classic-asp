<!--#include virtual="AspEtnic/adovbs.inc"-->
<%

    Dim objCon,objRst,objCmd
    Dim strConnectionString

    Set objCon =Server.CreateObject("ADODB.connection")
    Set objRst =Server.CreateObject("ADODB.RecordSet")
    Set objCmd =Server.CreateObject("ADODB.Command")

    strConnectionString="Provider=MSOLEDBSQL;" & _
                        "Server=WIN-QJELTLFM9E5;" & _
                        "Database=etnicdb;" & _
                        "Trusted_Connection=yes;" 

    objCon.Open strConnectionString


    
    
    


%>