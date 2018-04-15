<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
<script language =Javascript>
</script>
</head>


<body bgcolor="#99CCFF">
<form method =post name = xx1 >
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />

<%
java.util.Date d =new java.util.Date();
String sub=request.getParameter("sub");
String send=request.getParameter("send");
String email=request.getParameter("em");
String msg=request.getParameter("msg");
try
{

   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection cn=DriverManager.getConnection("jdbc:odbc:Intranet","","");
   
   PreparedStatement ps1=cn.prepareStatement("insert into Trash(Email,Sender,Subject,Message) values(?,?,?,?)" );
   ps1.setString(1,email);
   ps1.setString(2,send);
   ps1.setString(3,sub);
   ps1.setString(4,msg);
   ps1.executeUpdate();
   PreparedStatement ps=cn.prepareStatement("delete from Mail where Email=? and Subject=?" );
   ps.setString(1,email);
   ps.setString(2,sub);
   int xx= ps.executeUpdate();
   
 
}catch(Exception e){}
%>
<jsp:forward page="CheckMail.jsp"/>  
</form>

 </body>
 </html>
