
<%

    Function addUser(ByRef cls)
        Dim strSql,bIsAdded

        On Error Resume Next

        bIsAdded=True
        strSql="INSERT INTO Users (name,phone,email) VALUES (?,?,?)"
        With objCmd
            .ActiveConnection =objCon
            .CommandType=adCmdText
            .CommandText =strSql
            Set oNameParam=.CreateParameter("@name")
            With oNameParam
                .Type=adVarChar
                .Direction=adParamInput
                .Size=Len(cls.Name)
                .Value=cls.Name
            End With
            .Parameters.Append oNameParam
            Set oPhoneParam=.CreateParameter("@phone")
            With oPhoneParam
                .Type=adVarChar
                .Direction=adParamInput
                .Size=Len(cls.Phone)
                .Value=cls.Phone
            End With
            .Parameters.Append oPhoneParam
            Set oEmailParam=.CreateParameter("@email")
            With oEmailParam
                .Type=adVarChar
                .Direction=adParamInput
                .Size=Len(cls.Email)
                .Value=cls.Email
            End With
            .Parameters.Append oEmailParam

            .Execute
        End With

        If Err.Number <> 0 Then
            bIsAdded=False

        End If
        addUser=bIsAdded

    End Function
    Function getAllUsers()
        Dim rst,strSql
        
        Set rst=Server.CreateObject("ADODB.Recordset")
       
        strSql ="Select * From Users  Order By name"
        With rst
            .CacheSize=5
            .PageSize=5
            .CursorType = adOpenStatic
            .LockType = adLockBatchOptimistic
            
            .Open strSql, strConnectionString
        End With
        'rst.Open  strSql, strConnectionString
        Set getAllUsers= rst
        
        
    End Function

    Function findOne(id)
        On error Resume Next
        Dim rst,strSql
        strSql ="Select * From Users  Where userID=" & id
        Set rst=Server.CreateObject("ADODB.Recordset")
        With rst
            .CursorLocation=adUseClient
            .CursorType = adOpenDynamic
            .LockType = adLockOptimistic
            
            .Open strSql, strConnectionString
        End With
        If Err.Number <> 0 then
            Response.Write Err.Description
            Set findOne= Nothing
        Else
            Set findOne= rst
        End if
        
    End Function

    Function delete(id)
         Dim rst,strSql,bIsDeleted
         bIsDeleted=True
        ' Dim rst,strSql
        strSql ="Delete  From Users  Where userID=?" 
   
        With objCmd
            .ActiveConnection =objCon
            .CommandType=adCmdText
            .CommandText =strSql
            Set oIDParam=.CreateParameter("@userID")
            With oIDParam
                .Type=adInteger
                .Direction=adParamInput
                .Size=Len(id)
                .Value=id
            End With
            .Parameters.Append oIDParam
            
            .Execute
        End With

        If Err.Number<>0 then
            
         bIsDeleted=False

        End If
        delete=bIsDeleted
    End Function

    Function update(ByVal id,ByRef cls)
        On Error Resume Next
        Dim rst,strSql,bIsUpdateOk
        bIsUpdateOk=True

        strSql ="Update Users Set name=? , phone=?,email=? Where userID=?"  

        ' Set oCon=Server.CreateObject("ADODB.connection")
        ' oCon.Open strConnectionString

        ' oCon.Execute("Select * From Users")

        ' Set cmd=Server.CreateObject("ADODB.Command")
        
        With objCmd
            .ActiveConnection =objCon
            .CommandType=adCmdText
            .CommandText =strSql

            Set oNameParam=.CreateParameter("@name")
            With oNameParam
                .Type=adVarChar
                .Direction=adParamInput
                .Size=Len(cls.Name)
                .Value=cls.Name
            End With
            .Parameters.Append oNameParam
            Set oPhoneParam=.CreateParameter("@phone")
            With oPhoneParam
                .Type=adVarChar
                .Direction=adParamInput
                .Size=Len(cls.Phone)
                .Value=cls.Phone
            End With
            .Parameters.Append oPhoneParam
            Set oEmailParam=.CreateParameter("@email")
            With oEmailParam
                .Type=adVarChar
                .Direction=adParamInput
                .Size=Len(cls.Email)
                .Value=cls.Email
            End With
            .Parameters.Append oEmailParam


            Set oIDParam=.CreateParameter("@userID")
            With oIDParam
                .Type=adInteger
                .Direction=adParamInput
                .Size=Len(id)
                .Value=id
            End With
            .Parameters.Append oIDParam
            
            .Execute
        End With
       
        If Err.Number<>0 then
            
            bIsUpdateOk=Err.Description & " Source " & Err.Source

        End If
        update=bIsUpdateOk
    End Function
%>