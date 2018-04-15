<jsp:useBean id ="userdet" class ="session.UserDetails" scope="page"/>
<jsp:setProperty name="userdet" property="*"/>
<%! String nextpage;%>
<% 
 if(loginManager.login(userdet))
  {
   nextpage="http://localhost:8080/ERS/logindb";
  }
  %>
  <jsp:forward page="ReserveBookView.jsp"/>
  