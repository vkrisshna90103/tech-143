<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>

<jsp:useBean id="chatbean" class ="Session.ChatBean" scope="session" />
<jsp:useBean id="userdet" class ="Session.UserDetails" scope="session" />
  <%
    String user=userdet.getUser();
    chatbean.addParticipant(userdet.getUser());
 chatbean.setUser(user);
 
 chatbean.enterRoom();

 %>
<jsp:forward page="frames.jsp" />
  