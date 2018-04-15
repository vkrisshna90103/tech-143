<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>


<body bgcolor="99CCFF">

<center>
<br><br><br>
<h2> Employee Leave Information </h2>
<br><br><br>

<table border=1>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from Leave_Details");
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();
for(int i=1;i<=rsmd.getColumnCount();i++)
{
%>
<th>
<%= rsmd.getColumnName(i) %> 
<%
 }
 %><tr>
 <%
 while(rs.next())
 {
  for(int i =1;i<=rsmd.getColumnCount();i++)
   {
    
    %>
    <td>
    <%=
     rs.getString(i)%>

   <%
   }  
  
   %>
  <tr>
  <%
  }
 }catch(Exception e){}
 %>
</table>
</body>
</html>
