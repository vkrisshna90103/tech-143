<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>
<%! String bnm,auth,pub; %>
<%! int noc; %>
<%! double price; %>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
<title></title>
</head>
<body bgcolor="#DDEEFF">


<form method = post action="http://localhost:8080/ERS/BookModify" name=form>
<h3>Edit the necessary fields to be modified:
<br><br>
<center>

<%
 try
    {
     String ss = request.getParameter("s1"); 
     //String auth = request.getParameter("auth"); 
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select Bookname,Author,Publisher,Price,NOC from BookDetails where Bookid=?");
     ps.setString(1,ss);
     ResultSet rs= ps.executeQuery();
     
     if(rs.next())
     {
      bnm=rs.getString(1);
      auth=rs.getString(2);
      pub=rs.getString(3);
      price=Double.parseDouble(rs.getString(4));
      noc=Integer.parseInt(rs.getString(5));
     } 
  %>
     
     
     
<table>
  
<tr> 
 <input type = hidden name=bid value=<%=request.getParameter("s1") %>>
</tr>
<tr>
<td><b>
Book Name</td>
<td>
<input type=text name=t4 value=<%=bnm %>></td></tr>

<tr>
<td><b>Author</td>
<td>
<input type=text name=t5 value=<%=auth %>></td>
</tr>
<tr>
<td>
<b>
 Publisher</td>
<td>
<input type=text name=t6 value=<%=pub %>></td></tr>
<tr>
<td><b>Price</td>
<td><input type=text name=t7 value=<%=price %>></td>
</tr>


<tr>
<td><b>
No of Copies
</td>
<td>
<input type=text name=t8 value=<%=noc %>></td>
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