<%
    Class User

    Private mstrName
    Private mstrPhone
    Private mstrEmail
    Private mlngID
    

    Property Let Name(value)
        mstrName=value
    End Property
    Property Let Phone(value)
        mstrPhone=value
    End Property

    Property Let Email(value)
        mstrEmail=value
    End Property

    Property Let ID(value)
        mlngID=value
    End Property

    Property Get Name
        Name=mstrName
    End Property

    Property Get Phone
        Phone=mstrPhone
    End Property
    Property Get Email
        Email=mstrEmail
    End Property

    Property Get ID
        ID=mlngID
    End Property

    End Class


%>