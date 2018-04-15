<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date.*"%>
<html>

<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>
<body bgcolor="#99CCFF">
<h3><font color =gray>You have Send the following Mails...<br>
<%! String eid1,bid1,eid;%>
<form>
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />

<%
try
  
    {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps1=cn.prepareStatement("select Empid from Employee where Username=?");
     ps1.setString(1,userdet.getUser());
     ResultSet rs1=ps1.executeQuery();
     if(rs1.next())
     {
      eid=rs1.getString(1);
     }
     PreparedStatement ps=cn.prepareStatement("select Email,subject,Senddate,Message from SendItem where Empid=?");
     ps.setString(1,eid);
     ResultSet rs=ps.executeQuery();
      ResultSetMetaData rsmd=rs.getMetaData();  
 if(rs.next())
 {
 %>
 <table border=1 cellspacing=2>

  
<%
 for(int i=1;i<=rsmd.getColumnCount();i++)
 {
 %>  
   <th bgcolor="#AAAADE"><font color="blue">
   <%= rsmd.getColumnName(i) %> </th>
<%
 }
  do
   {
   %>
    <tr>
       <td><%=rs.getString(1)%></td>
       <td><%=rs.getString(2)%></td>
       <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        
    </tr>
   <%
    }while(rs.next());
 %>  </table>
<%  
 }
}catch(Exception e){}
 %>
 
 
 
</form>

 </body>
 </html>
