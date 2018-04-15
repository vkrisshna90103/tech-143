<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>

<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>
<body bgcolor="#99CCFF">


<form method = post action="http://localhost:8080/ERS/EmpModifyDet.jsp" name=form>
<center><h2><font color=brown><b>Modify Employee Details<br><br><br>
<%
 try
    {

     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select  Empid from Employee");
     ResultSet rs= ps.executeQuery();
  %>
     
     
     
<table>
  
<tr> 
 <td><b><font color=red>Select the Employee ID to be Modified</td>
   <td><select name =s1 >
  <%
    while(rs.next())
     {
   
  %>  
   <option>
   <%=rs.getString(1)
   %>
   </option>
     <%}%>
</tr>

<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td></td><td><input type =submit value="Next">
</td>
</tr>

</table>
</center>
</form>
 <%    

    }catch(Exception e){out.println(e);}
 %>

</body>
</html>