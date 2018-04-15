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


<body bgcolor="#99CCFF">
<h2><font color=red>The Trash having following mails...
<%! String eid1,bid1;%>
<form method =post action ="http://localhost:8080/ERS/TrashMail">
<%! int count;%>
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />

<%
java.util.Date d =new java.util.Date();
String email="";

try
{

   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
   PreparedStatement ps=con.prepareStatement("select Email from Employee where Username=? and Password=?");
   ps.setString(1,userdet.getUser());
   ps.setString(2,userdet.getPassword());
   
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
    email =rs.getString(1);
    
    
   
   }
   
}catch(Exception e){}
try
{
   Connection cn=DriverManager.getConnection("jdbc:odbc:Intranet","","");
   PreparedStatement ps1=cn.prepareStatement("select * from Trash where Email=? ");
   ps1.setString(1,email);
   ResultSet rs1=ps1.executeQuery();
   ResultSetMetaData rsmd=rs1.getMetaData();
 %>
<%
 if(rs1.next())
 {
 %>
 <table border=1 cellspacing=2>

  <th></th>
<%
 for(int i=2;i<=rsmd.getColumnCount();i++)
 {
  if(i==2 || i==3 ||i==4 )
  {
%>
   <th bgcolor="#AAAADE"><font color="blue">
   <%= rsmd.getColumnName(i) %> </th>
<%
   } 
  }
  count=0;
  do
  //while(rs1.next())
   {
   count++;   
%>
    <tr><td> <input type = checkbox name=ch1<%=count%>> </td>
<%
 
	   for(int i =1;i<=rsmd.getColumnCount();i++)
	    {
	     if(i==2 || i==3)
 	     {
%> 	     
 	      <td>
 	      
<% 	      

 		if(i==3)
               {
		String s = rs1.getString(i);
		
%>              <input type =hidden name=Sub<%=count%> value=<%=s%>> 
                <% String msg =rs1.getString(i+1);%>
                <input type =hidden name=Msg<%=count%> value=<%=msg%>> 
                <%=s%></td><td><%=msg%>   </td>
             
<%	        }
	        else
	        {
%>
                 <%=rs1.getString(i)%></td>
<%             
	        }
	       }

	    }
%>	   </tr>
<%
	  }while(rs1.next());
 %>  </table>
 <table >
  <tr rowspan=2 colspan=2>
   <td align=center><input type =submit name =submit value=Clear></td>
   </tr> 
  </table>
  <br>
  <input type =hidden name=cnt value=<%=count%>>
 <input type =hidden name =email value=<%=email%>>
 
 <%  }
   
   else
   {
    %>
    <h3><font color = red><b>There is no Messages in the Trash
    <%
   }
}catch(Exception e){}
 %>
 
 
 
</form>

 </body>
 </html>
