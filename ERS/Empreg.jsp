<%@ page import ="java.io.*"%>
<%@ page import ="java.sql.*"%>
<html><body>
<%
  try
    {
	int ph;
  String eid=request.getParameter("t0");
  String name=request.getParameter("t1");
  String gen=request.getParameter("s1");
  String dd=request.getParameter("dd");
    String mm=request.getParameter("mm");
    String yy=request.getParameter("yy");
    String dob=dd+"-"+mm+"-"+yy;

  String fathername=request.getParameter("t3");
  String add=request.getParameter("t4");
  String phone=request.getParameter("t5");
  String email=request.getParameter("t6");
  String department=request.getParameter("t7");
  String designation=request.getParameter("t8");
  String username=request.getParameter("t9");
  String password=request.getParameter("t10");
  String dd1=request.getParameter("dd1");
  String mm1=request.getParameter("mm1");
  String yy1=request.getParameter("yy1");
  String doj=dd1+"-"+mm1+"-"+yy1;
  String hintq=request.getParameter("t12");
  String ans=request.getParameter("t13");
  String sal =request.getParameter("t14");
  double sal1;

%>
  <jsp:useBean id ="register" class="Session.EmpReg" scope="session" />
  <%
      register.setUser(name);
      register.setPassword(password);
      register.setEmpid(eid);
      register.setEmail(email);
      register.setDept(department);
      register.setDesign(designation);
      register.setUnm(username);
      register.setDD(dd);
      register.setDD1(dd1);
      register.setMM(mm);
      register.setMM1(mm1);
      register.setYY(yy);
      register.setYY1(yy1);
      register.setPhno(phone);
      register.setHintq(hintq);
      register.setAns(ans);
      register.setSal(Double.parseDouble(sal));
      register.setFather(fathername);
      register.setGen(gen);
      register.setAdd(add);
      
      
    %>
    
  <form name=ff>
  
  <%

  if(name.equals("") || gen.equals("")|| fathername.equals("")|| add.equals("") ||phone.equals("")||email.equals("")||department.equals("") || designation.equals("") || username.equals("") || password.equals("") || hintq.equals("")|| ans.equals(""))
  {
   
   String str="Please fill All the Details which are Missing";
  %>
 <jsp:forward page="ValidEmpreg.jsp?str=<%=str%>" />
   <%
  }
  
  ph=Integer.parseInt(phone);
  sal1=Double.parseDouble(sal);
  email+="@dmiss.com";
%> 
 </form></html>

<%
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection cn = DriverManager.getConnection("jdbc:odbc:Intranet","","");
     PreparedStatement ps=cn.prepareStatement(" insert into Employee(Empid,Name,Gender,DOB,Fathername,Address,Phone,Email,Department,Designation,Username,Password,DOJ,HintQuestion,Answer,Salary) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
     ps.setString(1,eid);
     ps.setString(2,name);
     ps.setString(3,gen);
     ps.setString(4,dob);
     ps.setString(5,fathername);
     ps.setString(6,add);
     ps.setInt(7,ph);
     ps.setString(8,email);
     ps.setString(9,department);
     ps.setString(10,designation);
     ps.setString(11,username);
     ps.setString(12,password);
     ps.setString(13,doj);
     ps.setString(14,hintq);
     ps.setString(15,ans);
     ps.setDouble(16,sal1);


     int xx= ps.executeUpdate();
     if(xx>0)
     {
       %>
       The Employee Details are Registered Successfully...

      <%
     PreparedStatement ps1=cn.prepareStatement(" insert into Leave(Empid,CL,SL,EL) values(?,?,?,?)");
	 ps1.setString(1,eid);
	 ps1.setInt(2,0);
	 ps1.setInt(3,0);
	 ps1.setInt(4,0);
     ps1.executeUpdate();
     %><a href ="roll2.html" >Back</a>
     }
     else
     {
       %>Please check the details
      <%}
    }catch(Exception e){}

 %>