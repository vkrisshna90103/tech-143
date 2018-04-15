<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body bgcolor =99ccff>
<%! String eid1,bid1;%>
<form >
<jsp:useBean id="userdet" class="Session.UserDetails" scope ="session" />
<%
  String email =request.getParameter("add");
  int st=0;
  String eid=" ",email1=" ";
  
try
   
    {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         
     Connection cn1 = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     
     PreparedStatement ps12=cn1.prepareStatement("select Empid,Email from Employee where Username=?");
     ps12.setString(1,userdet.getUser());
     
     ResultSet rs=ps12.executeQuery();
     
   if(rs.next())
     {
      eid=rs.getString(1);
      email1 =rs.getString(2);
  
     }
     PreparedStatement ps=cn1.prepareStatement("select Email from AddressBook where Empid=?");
     ps.setString(1,eid);
     ResultSet rs1 =ps.executeQuery();
     while(rs1.next())
     {
      if(rs1.getString(1)==email)
      st=1;
     }
         
     
     }catch(Exception e){%><%=e%><%}
     if(email==email1)
     {
      st=1;
     }
  if(st==0)
  {
    try{
  	Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
	PreparedStatement psx1=con.prepareStatement("insert into AddressBook(Empid,Email) values(?,?)");
	psx1.setString(1,eid);
	psx1.setString(2,email);
	psx1.executeUpdate();
	}catch(Exception e){}
%>
    <b><font color=red>The Mail Id is added to Your Address Book...
<%
  }
  
  else
  {
%>
   <b><font color=red>Already in Address Book..
<%
  }
%>   
<br>
<a href ="CheckMail.jsp">Back</a>
</center>
 </form>
 </body>
 </html>
