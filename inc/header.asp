<%
  Dim strCurrent
  strCurrent= Request.ServerVariables("SCRIPT_NAME")
  
%>

<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <% If InStr(2,strCurrent,"default")>0 Then %>
      <li class="nav-item active">
      <%Else%>  
      <li class="nav-item">
      <%End If%>
          <a class="nav-link" href="default.asp">Liste <span class="sr-only">(current)</span></a>
      </li>
      <% If InStr(2,strCurrent,"create")>0  Then %>
      <li class="nav-item active">
        <a class="nav-link" href="create.asp">Add User <span class="sr-only">(current)</span></a>
      <%Else%>   
      <li class="nav-item">
      <a class="nav-link" href="create.asp">Add User</a>
      <%End If%> 
      
      </li>
      
      <% If InStr(2,strCurrent,"json")>0  Then %>
      <li class="nav-item active">
        <a class="nav-link" href="jsonpage.asp">Json Page <span class="sr-only">(current)</span></a>
      <%Else%>   
      <li class="nav-item">
      <a class="nav-link" href="jsonpage.asp">Json Page</a>
      <%End If%> 
      
    </ul>
    
  </div>
</nav>