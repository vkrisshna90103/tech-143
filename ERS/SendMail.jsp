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
<%! int count;%>


<jsp:useBean id="userdet" class="Session.UserDetails" scope ="session" />
<%
  String to =request.getParameter("t1");
  String sub =request.getParameter("t2");
  String msg =request.getParameter("ta1");
  int stst=0;
  String xxx=" ",uid= " ";
  String email=" ",eid=" ";

try
   
    {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement pss1=cn.prepareStatement("select Email from Employee where Email=?");
     pss1.setString(1,to);
     ResultSet rss1 =pss1.executeQuery();
     if(rss1.next())
     {
      stst=1;
     }
     
     
     Connection cn1 = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     
     PreparedStatement ps12=cn1.prepareStatement("select Empid,Email from Employee where Username=?");
     ps12.setString(1,userdet.getUser());
     
     ResultSet rs=ps12.executeQuery();
     
   if(rs.next())
     {
      eid=rs.getString(1);
      email =rs.getString(2);
      
      
     }
     }catch(Exception e){%><%=e%><%}
java.util.Date d =new java.util.Date();
String dd = d.getDate() +"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900);
String tt = d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
if(stst==1)
{
 try{
  	Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
	PreparedStatement ps=con.prepareStatement("insert into Mail(Email,Sender,Subject,Message,Senddate,SendTime,Empid) values(?,?,?,?,?,?,?)");
	ps.setString(1,to);
	ps.setString(2,userdet.getUser());
	ps.setString(3,sub);
	ps.setString(4,msg);
	ps.setString(5,dd);
	ps.setString(6,tt);
	ps.setString(7,eid);
	ps.executeUpdate();
	PreparedStatement ps1=con.prepareStatement("insert into SendItem(Email,Subject,Message,Empid,Senddate) values(?,?,?,?,?)");
	ps1.setString(1,to);
	ps1.setString(2,sub);
	ps1.setString(3,msg);
	ps1.setString(4,eid);
	ps1.setString(5,dd);
		
	ps1.executeUpdate();
 }catch(Exception e){}
%>
  Message Sent Successfully....
<%
}

else
 {
  %>
    Your mail id  <%=to %> is Invalid
 <%
  }
 %>
     
</center>
 </form>
<pre>
                 
                                 
                 <a href ="MailForm.jsp">Back</a> <a href ="CheckMail.jsp">Check Mail</a>
                 
</pre>
 </body>
 </html>
