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
<jsp:useBean id="userdet" class ="Session.UserDetails" scope="session" />


<center>

<table border=1>
<%
String eid=" ";
   
try
  {
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select Empid from Employee where Username=?");
ps.setString(1,userdet.getUser());
ResultSet rs=ps.executeQuery();
if(rs.next())
{
 eid=rs.getString(1);
}
}catch(Exception e){}


   int clcnt=0;
   int elcnt=0;
   int slcnt=0;
   try
       {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
        PreparedStatement ps=cn.prepareStatement(" select NoOfDays from LeaveDet where Empid=? and TypesofLeave=?");
        ps.setString(1,eid);
        ps.setString(2,"CL");
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
         clcnt+=Integer.parseInt(rs.getString(1));
        }     
        PreparedStatement ps1=cn.prepareStatement(" select NoOfDays from LeaveDet where Empid=? and TypesofLeave=?");
        ps1.setString(1,eid);
        ps1.setString(2,"SL");
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next())
        {
         slcnt+=Integer.parseInt(rs1.getString(1));
        }     
        PreparedStatement ps2=cn.prepareStatement(" select NoOfDays from LeaveDet where Empid=? and TypesofLeave=?");
        ps2.setString(1,eid);
        ps2.setString(2,"EL");
        ResultSet rs2 = ps2.executeQuery();
        while(rs2.next())
        {
         elcnt+=Integer.parseInt(rs2.getString(1));
        }     
           
    %>
        
        <HTML>
        <center>
        <Body bgcolor=99CCFF>
        
        <table  cellspacing=7 cellpadding=5>
        <tr bgcolor=brown  width=600><td><b><font size =4 color=white >Leave Status</td></tr>
        <tr>
            <td><b><font color=brown>Empid</td>
            <td><b><font color=white><%=eid%></td>
        </tr>
        <tr>
            <td><b><font color=brown>Casual Leave</td>
            <td><b><font color=white><%=clcnt%></td>
        </tr>
        <tr>
            <td><b><font color=brown>Sick Leave</td>
            <td><b><font color=white><%=slcnt%></td>
        </tr>
        <tr>
            <td><b><font color=brown>Earned Leave</td>
            <td><b><font color=white><%=elcnt%></td>
        </tr>
        </table>
        <br>
        <b>
        <a href =http://localhost:8080/ERS/rollLeave.html>Back </a>
<%
  }catch(Exception e){}
%>
</body>
</html>
