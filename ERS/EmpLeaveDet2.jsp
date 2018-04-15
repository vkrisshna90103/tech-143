<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.String"%>

	<HTML>
	<head>
	<meta http-equiv="Page-Enter"
	content="revealTrans(Duration=3.0,Transition=23)">
	<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
	</head>
	
        <center>
        <Body bgcolor=99CCFF>
     <table border=2 cellspacing =7 size=3>
      <th><font color= red><b>Empid</th>
        <th><font color= red><b>Casual Leave</th>
        <th><font color= red><b>Sick Leave</th>
        <th><font color= red><b>Earned Leave</th>
<%! String[] tpt;%>
<%! String[] eid;%>
<%! int[] smm;%>
<%! int[] sts;%>


<%
   int clcnt=0;
   int elcnt=0;
   int slcnt=0;
   int cnt=0,count=0;
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
        PreparedStatement ps=cn.prepareStatement("select Empid,sum(NoOfDays),TypesofLeave from LeaveDet group by Empid,TypesofLeave");
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
        switch(sts[i])
        
        {
        case    1 :
        	PreparedStatement ps1=cn.prepareStatement("update Leave set CL=? where Empid=?");
        	ps1.setInt(1,smm[i]);
        	ps1.setString(2,eid[i]);
        	xx=ps1.executeUpdate();
        	break;
        case	2 :
        
        
        		PreparedStatement ps2=cn.prepareStatement("update Leave set SL=? where Empid=?");
		        ps2.setInt(1,smm[i]);
		        ps2.setString(2,eid[i]);
		        xx=ps2.executeUpdate();
			break;
	case	3 :
		 PreparedStatement ps3=cn.prepareStatement("update Leave set EL=? where Empid=?");
			 ps3.setInt(1,smm[i]);
			 ps3.setString(2,eid[i]);
			 xx=ps3.executeUpdate();
        		break;
          }
        }
         PreparedStatement ps12=cn.prepareStatement("select * from Leave");
	 ResultSet rss = ps12.executeQuery();
	 while(rss.next())
	 {
	 %>
          <tr><td align =center><font color= white><b><%=rss.getString(1)%></td>
              <td align =center><font color= white><b><%=rss.getString(2)%></td>
              <td align =center><font color= white><b><%=rss.getString(3)%></td>
              <td align =center><font color= white><b><%=rss.getString(4)%></td>
          </tr>
         <%
         }
          
         %>
         </table>
        <br>
        <b>
        <a href =http://localhost:8080/ERS/LeaveDetails.jsp>Back </a>
<%
  }catch(Exception e){%><%=e%><%}
%>






