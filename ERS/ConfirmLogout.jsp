<jsp:useBean id="login" class="Session.LoginCheck" scope="application" />
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />
<% 
   login.logout(userdet.getUser());
   session.invalidate();
 %>
  
<jsp:forward page ="login.html"/>