<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<%

   String eid=req.getParameter("s1");
   int clcnt=0;
   int elcnt=0;
   int slcnt=0;
   try
       {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet"," "," ");
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
        <table border=2>
        <th>Empid</th>
        <th>CL</th>
        <th>SL</th>
        <th>EL</th>
        <tr>
            <td><%=eid%></td>
            <td><%=clcnt%></td>
            <td><%=slcnt%></td>
            <td><%=elcnt%></td>
        </tr>
        </table>
        <a href =http://localhost:8080/ERS/LeaveDetails.jsp>Back </a>
<%
  }catch(Exception e){}
%>