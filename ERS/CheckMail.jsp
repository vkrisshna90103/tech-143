<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date.*"%>
<html>

<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
<script language =Javascript>
function compose()
{
 document.xx1.action="ComposeMail.jsp";
}



</script>
</head>


<body bgcolor="#99CCFF">
<%! String eid1,bid1,send;%>
<form method =post name = xx1 action ="http://localhost:8080/ERS/ClearMail">
<%! int count=0;%>
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
   PreparedStatement ps1=cn.prepareStatement("select * from Mail where Email=? ");
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
  if(i==2 || i==3 ||i==5 || i==6)
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
 
	   for(int i =2;i<=rsmd.getColumnCount();i++)
	    {
             if(i==2)
             {
              send=rs1.getString(i);
%>               <input type =hidden name=Send<%=count%> value=<%=send%>>  
<%             }
             if(i==2 || i==3 || i==5 || i==6)
 	     {
%> 	     
 	      <td>
<% 	            
              if(i==3)
               {
		String s = rs1.getString(i);
		String msg =rs1.getString(i+1);
		
%>              <input type =hidden name=Sub<%=count%> value=<%=s%>> 
                <input type =hidden name=Msg<%=count%> value=<%=msg%>> 
                <a href ="Message1.jsp?Message=<%=msg%>&sub=<%=s%>&email=<%=email%>&send=<%=send%>"><%=s%></a>
<%	        }
	        else
	        {
	         if(i==2)
	         {
	          
%>                <%=send%>
<%		 }
                  else
                  {
%>                  
                 <%=rs1.getString(i)%></td>
<%      	  }       
	        }
	       }

	    }
%>	   </tr>
<%
	  }while(rs1.next());
 %>  </table>
 <table >
  <tr rowspan=2 colspan=2>
   <td align=center><input type =submit name =submit value=Remove></td>
   <td align=center><input type =submit name =submit value=Compose onClick=compose()></td>
   </tr> 
  </table>
  <br>
  <input type =hidden name=cnt value=<%=count%>>
 <input type =hidden name =email value=<%=email%>>
 
 <%  }
   
   else
   {
    %>
    <h3><font color = red><b>There is no Messages in the Inbox
    <%
   }
}catch(Exception e){}
 %>
 
 
 
</form>

 </body>
 </html>
