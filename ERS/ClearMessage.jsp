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

<body bgcolor =99CCFF>
<center><h2>Select the Message to be Cleared
<%! String eid1,msg1,sub1,date1;%>
<form method =post action ="http://localhost:8080/ERS/ClearMessageDet">
<%! int count;%>
<table cellspacing=5 border=5>
<th bgcolor="green"><font color="yellow">Click</th>
<%
java.util.Date d =new java.util.Date();
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet",""," ");
PreparedStatement ps=con.prepareStatement("select * from Magazine");
ResultSet rs=ps.executeQuery();
ResultSetMetaData rsmd=rs.getMetaData();

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
    eid1=rs.getString(i);
    %>
    
    <input type =hidden name=Empid<%=count%> value =<%=eid1 %>>
    <%
     }
         if(i==2)
         {
          sub1=rs.getString(i);
        %>
         
         <input type =hidden name=Subj<%=count%> value=<%=sub1 %>>
         <%
          }
    if(i==3)
        {
        msg1=rs.getString(i);
        %>
        
        <input type =hidden name=Msg<%=count%> value =<%=msg1 %>>
        <%
         }
    if(i==4)
        {
        date1=rs.getString(i);
        %>
        
        <input type =hidden name=Date<%=count%> value =<%=date1 %>>
        <%
         }
    
    %>
     
    <td bgcolor="gray">
    <h4>
    <font color="white">
    
    <%
      if(i==1)
      {
       %>
       <%=eid1%>
     <%
       }
     
      if(i==2)
          {
           %>
           <%=sub1%>
         <%
           }
      if(i==3)
                {
                 %>
                 <%=msg1%>
               <%
                 }
      if(i==4)
                {
                 %>
                 <%=date1%>
               <%
                 }
      
      if(i!=1 && i!=2 && i!=3 && i!=4)
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
        
 </table>
 <input type =hidden name=cnt value=<%=count%>>
 <center><input type =submit name =submit value=Clear>
</form>

 </body>
 </html>
