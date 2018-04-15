<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body bgcolor=99ccff>
<table border=2>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from Employee");
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();
for(int i=1;i<=rsmd.getColumnCount();i++)
{
%>
<th bgcolor="green"><font color="yellow">
<%= rsmd.getColumnName(i) %> 
<%
 }
 %><tr><h4>
 <%
 while(rs.next())
 {
  for(int i =1;i<=rsmd.getColumnCount();i++)
   {
    
    %>
    <td bgcolor="gray">
    <h4>
    <font color="white">
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
 <tr><td><a href =EmployeeDet.jsp><b>Back</a></td></tr>
 </table>
 </body>
 </html>
