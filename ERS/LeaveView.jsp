<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body bgcolor = 99ccff>
<center><h2> <font color =blue+bink+red+red+red>Leave Details</font></h2>
<table cellspacing=4 border=1>
<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from LeaveDet order by Fromdate");
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();
for(int i=1;i<=rsmd.getColumnCount();i++)
{
%>
<th ><font color="blue">
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
    <td >
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
 </table>
 <a href =LeaveDetails.jsp>Back </a>

 </center> 
 </body>
 </html>
