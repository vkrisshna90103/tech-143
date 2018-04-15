<% @ page  import=" java.io.*"%>
<% @ page   import=" java.sql.*"%>

<%
   try
     {

     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select distinct Senddate from Magazine");
     ResultSet rs= ps.executeQuery();
  %>
  
  <html>
  <head>
  </head>
  <body bgcolor = #123456>
  <form method = post action ="http://localhost:8080/ERS/MagazineView">
  <table>
  <tr><td>Select The Date to be Viewed</td>
  <td><select name =s1>
  <%
    while(rs.next())
     {
   
  %>  
   <option>
   <%rs.getString(1)
   %>
   </option>
     <%}%>
     </select></td>

</table><br><center><input type = Submit name =submit value = View></center>");
 </form>
 </html>
 <%    

    }catch(Exception e){out.println(e);}
 %>				
