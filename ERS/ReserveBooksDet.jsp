<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>
<%@ page import ="java.util.Date.*"%>

<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
<title></title>
</head>

<body bgcolor="#99ccff">
<%! String eid1;%>
 <jsp:useBean id="userdet" class ="Session.UserDetails" scope ="session" />
<% java.util.Date d =new java.util.Date(); %>
<h2><center><font color=brown>Book Reservation</font></center></h2>
    
<form method=post action ="http://localhost:8080/ERS/ReserveBookAdd"> 
<%
 try
    {
     String ss =request.getParameter("bid");
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select Bookname,Author from BookDetails where Bookid=?");
     ps.setString(1,ss);
     ResultSet rs= ps.executeQuery();
     
           
      %>
      <input type =hidden name=dd value=<%= d.getDate() %>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>>

<table >
    <tr>
           <td><font color = blue><h3>Reserve Date :</font></td>
           <td><font color =green><h3>
                <%= d.getDate() %>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>
           </font></td>
    
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    
    <td><h3><font color = blue>Reserve Time :</font></td>
       <td><h3><font color =green><%= d.getHours() %>:<%=d.getMinutes()%>:<%=d.getSeconds() %></font></td>
    
    </tr>
</table>
<center>
<table>    
    
    <tr><td>Book Id</td>
     <td ><font color =red>     <input type =text name=bid value=<%=ss %>></font></td>
     </tr>
     <%
      if(rs.next())
      {
      %>
      <tr>
        <td>Bookname</td>
        <td><font color =red>
        <input type =text name=bnm value= 
        <%=rs.getString(1) %>></font></td>
        
       
       
    </tr>
    
        <tr>
          <td>Author </td>
            <td><font color =red>
            <input type =text name=auth value=<%=rs.getString(2) %>></font></td>
         </tr>
    <input type=hidden name=rt value=<%= d.getHours() %>:<%=d.getMinutes()%>:<%=d.getSeconds() %>></td>
    
    <%
       }
      Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
        PreparedStatement ps1=con.prepareStatement("select Empid from Employee where Username=? and Password=?");
        ps1.setString(1,userdet.getUser());
        ps1.setString(2,userdet.getPassword());
        
        ResultSet rs1=ps1.executeQuery();
        if(rs1.next())
        {
         eid1 =rs1.getString(1);
         
         
        
   }
    %>
   
    <tr>
      <td>Employee Id</td>
      <td><input type =text name=eid value=<%=eid1%> readonly>
      </td>  
     </tr>
           
    <%
     }catch(Exception e){}
      %>
      </table>
      
<input type =submit name=submit value=Reserve >
      
</center>
</form>
</body>
</html>