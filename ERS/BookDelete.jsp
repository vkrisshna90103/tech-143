<%@ page import ="java.io.*"%>
<%@ page import ="java.sql.*"%>
<html>
<head>
</head>
<body bgcolor="99CCFF" >
<center>
<form method=post action="http://localhost:8080/ERS/BookRemove" name=f>
<%
  try
    {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
	 PreparedStatement ps=con.prepareStatement("select distinct Bookid from BookDetails");
	 ResultSet rs=ps.executeQuery();
    %>
<CENTER>

<H1>         Remove Book  </h1>
<BR><BR>
Select The Book Id
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
</body>
</html>