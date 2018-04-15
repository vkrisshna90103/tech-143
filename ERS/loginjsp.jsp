<%@ page import="java.util.StringTokenizer"%>
<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>
<%  String nm=request.getParameter("name");
  String old=request.getParameter("psd");
  if(nm.equals("Admin") && old.equals("Admin"))
  {
	  %>
	  
	  <jsp:forward page="WinAdminHomeINDEX.html" />
	  <%
  }
 else
 {
  try
    {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select * from Employee where Username=? and Password =?");
     ps.setString(1,nm);
     ps.setString(2,old);
     ResultSet rs=ps.executeQuery();
     if(rs.next())
     {
      
      %>

    <jsp:useBean id="userdet" class ="Session.UserDetails" scope ="session" />
    <%
       userdet.setUser(nm);
       userdet.setPassword(old);
     %>

<jsp:forward page="WinEmpHomeINDEX.html"/>
  <%
  }
     else
     {
		%>
		<html>
		<head>
		<meta http-equiv="Page-Enter"
		content="revealTrans(Duration=3.0,Transition=23)">
		<meta http-equiv="Page-Exit"
		content="revealTrans(Duration=3.0,Transition=23)">
		</head>

		<body bgcolor=99ccff>
		<center>
		<b><font color=red size=3 face=System><center>Invalid Username and Password</font>
				
		
		<%@ include file ="index.jsp"%>
		
		</center>
		
		</body>
		</html>
		
		<%
	 }
    }catch(Exception e){}
 }

%>