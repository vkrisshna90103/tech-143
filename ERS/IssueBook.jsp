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

<body bgcolor = "99CCFF">
<%! String eid1,bid1,bnm1;%>
<font color=brown><h2>The books which are to be Issued...
<form method =post action ="http://localhost:8080/ERS/IssueBookAdd">
<%! int count;%>
<%
java.util.Date d =new java.util.Date();
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from ReserveBook");
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();
if(rs.next())
{
 %>
 <table cellspacing=10>
 <th></th>
<%
for(int i=1;i<=rsmd.getColumnCount();i++)
{
%>
<th bgcolor="green"><font color="yellow">
<%= rsmd.getColumnName(i) %> </th>
<%
 }
 %>
 
 <%
 count=0;
 do
 {
   count++;
   %>
   <tr><td >  <input type = checkbox name=ch1<%=count%>> </td>

  <%
  for(int i =1;i<=rsmd.getColumnCount();i++)
   {
    if(i==1)
    {
    bid1=rs.getString(i);
    %>
    
    <input type =hidden name=Bookid<%=count%> value =<%=bid1 %>>
    <%
     }
         if(i==4)
         {
          eid1=rs.getString(i);
        %>
         
         <input type =hidden name=Empid<%=count%> value=<%=eid1 %>>
         <%
          }
          
     
     if(i==2)
         {
          bnm1=rs.getString(i);
        %>
         
         <input type =hidden name=bnm<%=count%> value=<%=bnm1 %>>
         <%
          }
          %>
     
    <td bgcolor="bgcolor=gray ">
    <h4>
    <font color="white">
    
    <%
      if(i==4)
      {
       %>
       <%=eid1%>
     <%
       }
     
      if(i==1)
          {
           %>
           <%=bid1%>
         <%
           }
      if(i==2)
          {
           %>
           <%=bnm1%>
         <%
           }
        if(i!=1 && i!=4 && i!=2)
        {
        %>
         <%=rs.getString(i)%>
        <%
         }
   
   }  
  
   %>
  </tr>
  
  <%
  } while(rs.next());
 %>
</table>
 <center><input type =submit name =submit value=Issue>

<%
 }
 
 else
 {
 %>
 <br><br><br><br><br><br><br>
 <center><h3>There is no books in the Reservation area...
 
 <%
  }
 
}catch(Exception e){}
 %>
 <input type =hidden name=date value=<%=d.getDate()%>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>>
 <input type =hidden name=rdate value=<%=(d.getDate()+10)%>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>>
         
 
 <input type =hidden name=cnt value=<%=count%>>
 </form>

 </body>
 </html>
