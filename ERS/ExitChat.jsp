	<%@ page import ="java.io.*"%>
<%@ page import ="java.sql.*"%>
<jsp:useBean id="userdet" class="Session.UserDetails" scope="session" />

<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body>

<%
  try
    {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
	 PreparedStatement ps=con.prepareStatement("delete from ChatUser where user_id=?");
	 ps.setString(1,userdet.getUser());
	 ps.executeUpdate();
	   	 PreparedStatement ps1=con.prepareStatement("delete from messages where from_user=?");
	 	 ps1.setString(1,userdet.getUser());
	 	 ps1.executeUpdate();
 
    }catch(Exception e){}
    %>

<%@ include file ="rollChat.html" %>


</body>
</html>