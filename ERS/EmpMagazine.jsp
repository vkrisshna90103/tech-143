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

<body bgcolor=99ccff>
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />
<%
  java.util.Date d = new java.util.Date();

     
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
    String dat =d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900);
     String tt =d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
%>
     <form method =post action =http://localhost:8080/ERS/MagazineSend>
     Date    :<%=dat%>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     Time   :<%=tt%>
  
     <table><tr><td> Empid   </td>
     <td><input type =text name =ss value=<%=eid%> readonly>
      </td></tr>
     <tr><td>Subject   </td>  <td><input type = text name =t1 ></td></tr>
     <tr><td>Content  </td> <td><textarea name =ta  rows =5 cols=45></textarea></td></tr>
     </table><br><center><input type = Submit name =submit value = Send></center>
     </form>
     </body>
     </html>
 