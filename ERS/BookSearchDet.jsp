<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>
<html>
<head>

<title></title>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">


</head>


<body bgcolor="#DDEEFF">

<table>
<center>
<h3>
      The Searching Result :
 <br><br>
<%
 try
    {
     String bnm = request.getParameter("bnm"); 
     String auth = request.getParameter("auth"); 
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select * from BookDetails where Bookname=? or Author=?");
     ps.setString(1,bnm);
     ps.setString(2,auth);
     ResultSet rs= ps.executeQuery();
     ResultSetMetaData rsmd=rs.getMetaData();
      
     
      if(rs.next())
       {
     
     
     for(int i=1;i<=rsmd.getColumnCount();i++)
     {
     %>
     <th bgcolor="#AAAADE"><font color="red">
     <%= rsmd.getColumnName(i) %> 
     <%
      }
      %><tr>
      <%
      
         
      
        do
        {
       for(int i =1;i<=rsmd.getColumnCount();i++)
        {
         
         %>
         <td bgcolor="blue">
         <h4>
         <font color="white">
         <%=
          rs.getString(i)%>
     
        <%
        }  
       
        %>
       <tr>
       <%
      }while(rs.next());
     }
     else
       {
       %> There is is no books as the name specified
       <%} 

     }catch(Exception e){}
      %>
      </table>
      <a href="rolllib.html">Back</a>
</body>
</html>