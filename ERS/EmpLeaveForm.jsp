<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</HEAD>

<BODY bgcolor="99CCFF">
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />



<%
String eid=" ";
try
{

   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
   PreparedStatement ps=con.prepareStatement("select Empid from Employee where Username=? and Password=?");
   ps.setString(1,userdet.getUser());
   ps.setString(2,userdet.getPassword());
   
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
    eid =rs.getString(1);
    
    
   
   }
   
}catch(Exception e){}
%>

<i><u><h3>Please Enter The Following Details Correctly : </h3></i>


<center>
<form name = form method=post action ="http://localhost:8080/ERS/LeaveDet.jsp">

<table cellspacing=5>
<tr><td>
Employee Id</td>
<td><input type="text" name=eid value ="<%=eid%>"></td></tr>
<tr>
<td>From </td>
<td><input type="text" name=sd ></td><td><b><font color =blue >(dd/mm/yyyy)</font></td></tr>
<tr><td>To </td>
<td><input type="text" name=sd1 ></td><td><b><font color =blue >(dd/mm/yyyy)</font></td></tr>
<tr><td>Particular </td>
<td><input type="text" name=part ></td></tr>

<tr><td>Type Of Leave</td>

<td><select name = stp>
            <option>CL</option>
            <option>SL</option>
            <option>PL</option>
</select></td></tr>

</table>

<center><input type="submit" name=s1 value="Apply"></center>
</form>
</center>
</body>
</html>
