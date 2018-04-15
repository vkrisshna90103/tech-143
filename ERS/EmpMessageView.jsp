<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.Date.*" %>
<%@ page import ="java.io.*"%>


<%
  java.util.Date d = new java.util.Date();

     try
     {
     String ss = request.getParameter("s1");
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement("select * from Magazine ");
     
     ResultSet rs= ps.executeQuery();
     ResultSetMetaData rsmd=rs.getMetaData();
%>
     <HTML>
     <head>
     <meta http-equiv="Page-Enter"
     content="revealTrans(Duration=3.0,Transition=23)">
     <meta http-equiv="Page-Exit"
     content="revealTrans(Duration=3.0,Transition=23)">
     </head>

     <body bgcolor = #99ccff>
     <%! String eid; %>       
     <table border =1>
<%
	 for(int i=1;i<=rsmd.getColumnCount();i++)
	 {
	  if(i!=4 && i!=3)
	  {
	  
%>	
	   <th bgcolor=green><font color=yellow><%=rsmd.getColumnName(i)%></th>
<%
          }
	 }
%>
	<h4>
<%
 	  while(rs.next())
	  {
%>	    <tr bgcolor=gray>
<%
	   for(int i =1;i<=rsmd.getColumnCount();i++)
	    {
           if(i!=4 && i!=3)
 	     {
 	     if(i==1)
	  	  {
	  	  eid=rs.getString(i);
	  	  }
%>	  	  
 	      <td><font color=white><b>
<% 	      
              if(i==2)
               {
		String s = rs.getString(i);
%>
                <a href ="MessageEmp.jsp?Message=<%=rs.getString(i+1)%>&sub=<%=s%>&frm=<%=eid%>"><font color=white+green><b><%=s%></a>
<%	        }
	        else
	        {
	         if(i==1)
	         {
	         
%>               <%=eid%>
        
<%		 }
                 else{
%>                
                   <%=rs.getString(i)%></td>
<%               }
	        }
	       }

	    }
%>	   </tr>
<%


	  }


   }catch(Exception e){}

%>