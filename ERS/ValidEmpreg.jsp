<%@ page import ="java.io.*"%>
<%@ page import ="java.sql.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>
<body bgcolor="#99CCFF">
<jsp:useBean id="register" class="Session.EmpReg" scope="session" />
<font color=red><b>The Fields which are Entered by you are incorrect.Verify the fields</font>
<%
 String eid,name,fathername,add,phone;
 String email="",department="",design="",username="",password="",hintq="";
 String ans="";
 double sal=0.0;
 eid=register.getEmpid();
 name=register.getUser();
 String gen=register.getGen();
 fathername=register.getFather();
 add=register.getAdd();
  phone=register.getPhno();
  String dd =register.getDD();
  String mm =register.getMM();
  String yy =register.getYY();
  String dd1 =register.getDD1();
  String mm1 =register.getMM1();
  String yy1 =register.getYY1();
  String dob=dd+"-"+mm+"-"+yy;
  
  email=register.getEmail();
  department=register.getDept();
  design=register.getDesign();
  username=register.getUnm();
  password=register.getPassword();
  String doj=dd1+"-"+mm1+"-"+yy1;
  hintq=register.getHintq();
  ans=register.getAns();
  sal =register.getSal();
  %>
 

<form method = post action="Empreg.jsp" name=f>

<input type =hidden name=dd value =<%=dd%> >
<input type =hidden name=mm value =<%=mm%> >
<input type =hidden name=yy value =<%=yy%> >


<input type =hidden name=dd1 value =<%=dd1%> >
<input type =hidden name=mm1 value =<%=mm1%> >
<input type =hidden name=yy1 value =<%=yy1%> >

<table bgcolor="#6699CC" width=620>
  
<tr bgcolor="#333366" width=620 height=300> 
<font face="Arial" size=3 color="#FFFFF"> <b> Registering Employee </font>


<tr>
 <td><b><font face="Arial" size=2 color="333333"> Employee ID </font></b></td>
 <td><input type=text size=10 name=t0 value="<%=eid%>" readonly> </font></td>

 <td><b><font face="Arial" size=2 color="333333">Name</font><b></td>
 <td width=180><input type=text name=t1 value="<%=name%>"></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Gender</font></b></td>
<td width=180><input type=text name=s1 value="<%=gen%>"></td>
<td><b><font face="Arial" size=2 color="333333">Date of Birth</font></b></td>
<td width=180><input type=text name=dob value="<%=dob%>"></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Father's Name</font></b></td>
<td><input type=text name=t3 value=<%=fathername%>></td>
<td><b><font face="Arial" size=2 color="333333">Address</font></b></td>
<td><input type=text name=t4 value=<%=add%>></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Phone</font></b></td>
<td><input type=text name=t5 value=<%=phone%>></td>
<td><b><font face="Arial" size=2 color="333333">E-Mail</font></b></td>
<td><input type=text name=t6 value=<%=email%>></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Department</font></b></td>
<td><input type=text name=t7 value=<%=department%>></td>
<td><b><font face="Arial" size=2 color="333333">Designation</font></b></td>
<td><input type=text name=t8 value=<%=design%>></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">User Name</font></b></td>
<td><input type=text name=t9 value=<%=username%>></td>
<td><b><font face="Arial" size=2 color="333333">Password</font></b></td>
<td><input type=password name=t10 value=<%=password%>></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Date of Joining</font></b></td>
<td ><input type=text name=doj value=<%=doj%>></td>
<td><b><font face="Arial" size=2 color="333333">Hint Question</font></b></td>
<td><input type=text name=t12 value=<%=hintq%>></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Answer</font></b></td>
<td><input type=text name=t13 value=<%=ans%>></td>
<td><b><font face="Arial" size=2 color="333333">Salary</font></b></td>
<td><input type=text name=t14 value=<%=sal%>></td>
</tr>
</table>

<br>

<center>

<input type =submit value="Submit">

</center>


</form>
</body>
</html>