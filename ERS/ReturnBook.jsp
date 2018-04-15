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

<body BGCOLOR="99CCFF">
<%! String eid1,bid1;%>
<form method =post action ="http://localhost:8080/ERS/ReturnBookDet">
<%! int count;%>
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />
<%
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

java.util.Date d =new java.util.Date();

try{
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select * from IssueBook where Empid=?");
ps.setString(1,eid);
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
 //while(rs.next())
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
         if(i==2)
         {
          eid1=rs.getString(i);
        %>
         
         <input type =hidden name=Empid<%=count%> value=<%=eid1 %>>
         <%
          }
          %>
     
    <td bgcolor="gray">
    <h4>
    <font color="white">
    
    <%
      if(i==2)
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
        if(i!=1 && i!=2)
        {
        %>
         <%=rs.getString(i)%>
        <%
         }
   
   }  
  
   %>
  </tr>
  
  <%
 }while(rs.next());
%>
 </table>
 <center><input type =submit name =submit value=Return>
<%
}else
{
 %>
   <br><br><b>
   <center><h3><font color= red>There is no Books to return...
 <%
}
}catch(Exception e){}
 %>
 <input type =hidden name=date value=<%=d.getDate()%>/<%=(d.getMonth()+1)%>/<%=(d.getYear()+1900)%>>
         
 <input type =hidden name=cnt value=<%=count%>>
 </form>

 </body>
 </html>
