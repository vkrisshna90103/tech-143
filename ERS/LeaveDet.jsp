<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.StringTokenizer"%>
<%! int st=1; %>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body bgcolor=99CCFF>

<%! int dd,mm,yy,mm1,dd1,yy1; %>
<%
  int status=0;
  int xx=0;
  int nod=0;

  String eid = request.getParameter("eid");

  String ltype = request.getParameter("stp");
  String part = request.getParameter("part");
  
  String ss = request.getParameter("sd");
  String ss1 = request.getParameter("sd1");
  StringTokenizer st = new StringTokenizer(ss,"/");
  if(st.countTokens()!=3)
  {
  %>
   <h3><center><b>  Invalid Date Format
     
     <%
     
     status=1;
     }
     else{
     while(st.hasMoreTokens())
     {
     
     dd=Integer.parseInt(st.nextToken());
     mm=Integer.parseInt(st.nextToken());
     yy=Integer.parseInt(st.nextToken()); 
     }
     }

if(status==0)
{

 StringTokenizer st1 = new StringTokenizer(ss1,"/");
  if(st1.countTokens()!=3)
  {
  %>
 <b><h3><center>    Invalid Date Format
     
<%
     
     status=1;
     }
     else{
     while(st1.hasMoreTokens())
     {
     dd1=Integer.parseInt(st1.nextToken());
     mm1=Integer.parseInt(st1.nextToken());
     yy1=Integer.parseInt(st1.nextToken()); 
     }
     }

 }
 if (status==0)
 {
   Date d1=new Date(dd,mm,yy);
   Date d2=new Date(dd1,mm1,yy1);
   
if(!d1.before(d2) && !d1.equals(d2))
{

%>

<b><h3>Invalid  --- To -- Date



<% 
status=1;
}
if(mm1-mm ==1)
{
 if(mm==1 || mm==3 || mm==5 ||mm==7 ||mm==8|| mm==10||mm==12)
 {
  nod = 31 - dd;
 }
 if(mm==4 ||mm==6 ||mm==9 ||mm==11)
 {
  nod= 30 - dd;
 }
 if(mm==2)
 {
  if(yy%4==0)
  {
   nod =29-dd;
  }
  else
  {
   nod=28-dd;
  }
 }
 xx =nod+dd1;
 
 }
 if(mm1-mm >1)
 {
 xx =(mm1-mm)*30 +(dd1);
 }
 if(mm1-mm==0)
 {
 xx+=(dd1-dd)+1;
 }
}

%>
<%
  if(status==0)
  {
try{
    int sts=0;
    if(ltype.equals("CL"))
        sts=1;
    if(ltype.equals("SL"))
        sts=2;
    if(ltype.equals("EL"))
        sts=3;
    
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("insert into LeaveDet(Empid,Fromdate,Todate,Particulars,TypesofLeave,NoOfDays,St) values(?,?,?,?,?,?,?)");

ps.setString(1,eid);
ps.setString(2,ss);
ps.setString(3,ss1);
ps.setString(4,part);
ps.setString(5,ltype);
ps.setInt(6,xx);
ps.setInt(7,sts);
int x = ps.executeUpdate();
if (x >0)
{
 
 
%>
<h3><b>You are applied leave successfully...
<%
}

}catch(Exception e){}
}

%>
<br>
<center>
<a href="rollLeave.html">Back</a>


 </body>
 </html>
