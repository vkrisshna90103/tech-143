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
<form method=post action="http://localhost:8080/ERS/BookProfile" name=f>
<%
  try
    {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	 Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
	 PreparedStatement ps=con.prepareStatement("select distinct Bookid from BookDetails");
	 ResultSet rs=ps.executeQuery();
    %>
<CENTER>

<H2><font color=brown><center> Book View</center> </h2>
<BR><BR><h4><font color =red>
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
<h3><a href =BookView.jsp>View All Book's Details...</a>

</body>
</html>