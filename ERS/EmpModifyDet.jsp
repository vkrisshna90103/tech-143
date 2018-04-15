<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>
<%! String addr,email,dept,desig,sal; %>
<%! int phno; %>

<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>
<body bgcolor="99ccff">


<form method = post action="http://localhost:8080/ERS/EmpModify" name=form>
<h3><font color=brown>Edit the necessary fields to be modified:
<br><br>
<center>

<%
 try
    {
     String ss = request.getParameter("s1"); 
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select Address,Phone,Email,Department,Designation,Salary from Employee where Empid=?");
     ps.setString(1,ss);
     ResultSet rs= ps.executeQuery();
     if(rs.next())
     {
      addr=rs.getString(1);
      phno=Integer.parseInt(rs.getString(2));
      email=rs.getString(3);
      dept=rs.getString(4);
      desig=rs.getString(5);
      sal=rs.getString(6);
     } 
  %>
     
     
     
<table>
  
<tr> 
 <input type = hidden name=eid value=<%=request.getParameter("s1") %>>
</tr>
<tr>
<td><b>
Address</td>
<td>
<input type=text name=t4 value=<%=addr %>></td></tr>

<tr>
<td><b>Phone</td>
<td>
<input type=text name=t5 value=<%=phno %>></td>
</tr>
<tr>
<td>
<b>
E-Mail</td>
<td>
<input type=text name=t6 value=<%=email %>></td></tr>
<tr>
<td><b>Department</td>
<td><input type=text name=t7 value=<%=dept %>></td>
</tr>


<tr>
<td><b>
Designation
</td>
<td>
<input type=text name=t8 value=<%=desig %>></td>
</tr>


<tr>
<td><b>
Salary
</td>
<td>
<input type=text name=t9 value=<%=sal %>></td>
</tr>

<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td></td><td><input type =submit value="Update">
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