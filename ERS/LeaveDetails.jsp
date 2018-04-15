<%@ page import ="java.io.*"%>
<%@ page import ="java.sql.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>
<body bgcolor="99CCFF" >
<center>
<form method=post action="EmpLeaveDet1.jsp" name=f>
<%
  try
    {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
	 PreparedStatement ps=con.prepareStatement("select Empid from LeaveDet");
	 ResultSet rs=ps.executeQuery();
    %>
<CENTER>

<H1>        Leave Status </h1>
<BR><BR><h4>
Select The Employee Id
<select name =s1>
<%
  while(rs.next())
  {
%>
<option><%=rs.getString(1)%></option>
<%
  }
 }catch(Exception e){}
 %>
</select>

<br><br>
<input type = submit value="Submit">
</form>
</center>
<h3><a href =EmpLeaveDet2.jsp>View All Employee's Details...</a>

</body>
</html>