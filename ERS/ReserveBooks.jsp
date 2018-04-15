<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>
<%@ page import ="java.util.Date.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>
<body bgcolor="#99CCFF">
<center>
<h2><font color=brown>Book Reservation

<br><br>

<font face="Impact" color="white"> Select Book Id To be Reserved </font>

<% java.util.Date d =new java.util.Date(); %>
<h3>
    
 
<%
 try
    {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select Bookid from BookDetails where NOC >0");
     ResultSet rs= ps.executeQuery();
     ResultSetMetaData rsmd=rs.getMetaData();
      
     
           
      %>
      
<center>
<form method =post action="http://localhost:8080/ERS/ReserveBooksDet.jsp">
<table>

      <tr>
        <td>Bookid</td>
      
        <td><select name =bid >
      <%
       while(rs.next())
       {
       %>
        <option><%=rs.getString(1) %></option>
       <%
        }
       %>
       </select></td>
    <%
     }catch(Exception e){}
      %>
      </table>
      <input type =submit name=submit value=Next >
 </form>     
</center>
</body>
</html>