<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import ="java.util.Date"%>
	<HTML>
	<head>
	<meta http-equiv="Page-Enter"
	content="revealTrans(Duration=3.0,Transition=23)">
	<meta http-equiv="Page-Exit"
	content="revealTrans(Duration=3.0,Transition=23)">
	</head>

        <center>
        <Body bgcolor=99CCFF>
<%   java.util.Date d = new java.util.Date();
   int mm=d.getMonth()+1;
   int yy=d.getYear() +1900;
   if(mm==1)
   {
    mm=12;
    yy--;
   }
   else
   {
   mm-=1;
   }
   String mnth=" ";
   if(mm==1) mnth="January";
   if(mm==2) mnth="February";
   if(mm==3) mnth="March";
   if(mm==4) mnth="April";
   if(mm==5) mnth="May";
   if(mm==6) mnth="June";
   if(mm==7) mnth="July";
   if(mm==8) mnth="Aguest";
   if(mm==9) mnth="September";
   if(mm==10) mnth="October";
   if(mm==11) mnth="November";
   if(mm==12) mnth="December";
   
           
%>        
        <u><h3><font color= brown>Salary Of the Month <b><%=mnth%> <%=yy%></b>
        <br>
        <table border=2 cellspacing =7 size=3>
        <th><font color= red><b>Empid</th>
        <th><font color= red><b>Emp Name</th>
        <th><font color= red><b>Salary</th>
<%! String[] tpt;%>
<%! String[] eid;%>
<%! int[] smm;%>
<%! int[] sts;%>


<%
   int clcnt=0;
   int elcnt=0;
   int slcnt=0;
   int cnt=0,count=0;
   String dd1 ="01/"+mm+"/"+yy+"";
   String dd2 ="31/"+mm+"/"+yy+"";
   try
       {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
       PreparedStatement pss1=cn.prepareStatement("update Leave set CL=?,SL=?,EL=?");
	pss1.setInt(1,0);
	pss1.setInt(2,0);
	pss1.setInt(3,0);
	pss1.executeUpdate();
	PreparedStatement ps11=cn.prepareStatement("select Empid from LeaveDet group by Empid,TypesofLeave");
        ResultSet rs11 = ps11.executeQuery();
        while(rs11.next())
        {
         count++;
        }
        tpt = new String[count+1];
        smm = new int[count+1];
        sts = new int[count+1];
        eid = new String[count+1];
        PreparedStatement ps=cn.prepareStatement("select Empid,sum(NoOfDays),TypesofLeave from LeaveDet  where  Fromdate between ? and ? group by Empid,TypesofLeave");
   
        ps.setString(1,dd1);
        ps.setString(2,dd2);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
        eid[cnt]=rs.getString(1);
        smm[cnt]=Integer.parseInt(rs.getString(2));
        tpt[cnt]=rs.getString(3);
         Connection cn1 = DriverManager.getConnection("jdbc:odbc:Intranet","","");
	        PreparedStatement psx1=cn1.prepareStatement("select St from LeaveDet where Empid=? and TypesofLeave=?");
	        psx1.setString(1,eid[cnt]);
	        psx1.setString(2,tpt[cnt]);
	        ResultSet rsx1=psx1.executeQuery();
	        if(rsx1.next())
	        {
	         sts[cnt]=Integer.parseInt(rsx1.getString(1));
	        }
	        cn1.close();
       
        cnt++;
        }
        int xx=0;
        for(int i=0;i<cnt;i++)
        {
        xx=0;
        if(sts[i]==1)
        {
        PreparedStatement ps1=cn.prepareStatement("update Leave set CL=? where Empid=?");
        ps1.setInt(1,smm[i]);
        ps1.setString(2,eid[i]);
        xx=ps1.executeUpdate();
        }
       }   
 
           PreparedStatement ps12=cn.prepareStatement("select Empid,Salary,Name  from Employee");
	 	 ResultSet rss = ps12.executeQuery();
	 	 while(rss.next())
	 	 {
	 	  String ss=rss.getString(1);
	 	  double sal = Double.parseDouble(rss.getString(2));
	 	  String nm =rss.getString(3);
	          Connection cn1 = DriverManager.getConnection("jdbc:odbc:Intranet","","");
                  PreparedStatement ps13=cn1.prepareStatement("select CL from Leave where Empid=?");
                  ps13.setString(1,ss);
                  ResultSet rsx1 = ps13.executeQuery();
                  if(rsx1.next())
                  {
                   int cl = Integer.parseInt(rsx1.getString(1));
                   if(cl >1)
                   {
                    sal = sal - ((cl-1)*(sal / 30));
                   }
                  } 
                  %>
                  <tr>
                     <td><font color= white><b><%=ss%></td>
                     <td><font color= white><b><%=nm%></td>
                     <td><font color= white><b><%=sal%></td>
                   </tr>
                  <%
                  
	
	         }
	
	
         %>
         </table>
        <br>
        <b>
        <a href =http://localhost:8080/ERS/rollLeave.html>Back </a>
<%
  }catch(Exception e){%><%=e%><%}
%>