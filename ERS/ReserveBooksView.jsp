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

<body>
<%! String eid1,bid1;%>
<form method =post action ="http://localhost:8080/ERS/IssueBookAdd">
<%! int count;%>
<table cellspacing=10>
<th></th>
<%
java.util.Date d =new java.util.Date();
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from ReserveBook order by ReserveDate,ReserveTime ");
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();

for(int i=1;i<=rsmd.getColumnCount();i++)
{
%>
<th bgcolor="#AAAADE"><font color="blue">
<%= rsmd.getColumnName(i) %> </th>
<%
 }
 %>
 
 <%
 count=0;
 while(rs.next())
 {
   count++;
   %>
   <tr><td>  <input type = checkbox name=ch1<%=count%>> </td>

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
          %>
     
    <td bgcolor="#AAAEEE">
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
        if(i!=1 && i!=4)
        {
        %>
         <%=rs.getString(i)%>
        <%
         }
    
   }  
  
   %>
  </tr>
  
  <%
 }
}catch(Exception e){}
 %>
 <input type =hidden name=date value=<%=d.getDate()%>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>>
 <input type =hidden name=rdate value=<%=(d.getDate()+10)%>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>>
         
 </table>
 <input type =hidden name=cnt value=<%=count%>>
 <center><input type =submit name =submit value=Issue>
</form>

 </body>
 </html>
