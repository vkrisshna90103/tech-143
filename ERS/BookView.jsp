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
<h3><font color=brown>The availability of Books in the Library...</font><br>
<table cellspacing=4>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from BookDetails");
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
    <td bgcolor="brown">
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
 </table><center>
 <a href="rolllib.html"><font color =red>Back</a>
 </body>
 </html>
