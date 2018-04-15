<%@ page import ="java.io.*"%>
<%@ page import ="java.sql.*"%>
<%! int eid;%>

<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">

<script language="Javascript">
function validate()
{
			
if(f.t0.value.length==0)
 {
   f.t0.focus();
   alert("Please Fill this field");
   
 }
else
{
var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ0123456789";
   var i;
   for(i=0;i<f.t0.value.length;i++)
   {
      var cv=f.t0.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t0.value="";
        f.t0.focus();
         alert("This field must contains alphabet & numbers");
	
        break;
        }
   }
}
}
function validate1()
{
			
if(f.t1.value.length==0)
 {
   f.t1.focus();
   alert("Please Fill this field");
 }
else
{

var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ.";
   var i;
   for(i=0;i<f.t1.value.length;i++)
   {
      var cv=f.t1.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t1.value="";
	f.t1.focus();
         alert("This field must contains  only alphabets");

        break;
        }
   }
}
}

function validate2()
{
			
if(f.t3.value.length==0)
 {
   f.t3.focus();
   alert("Please Fill this field");
 }
else
{

f.t3.focus();
var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ.";
   var i;
   for(i=0;i<f.t3.value.length;i++)
   {
      var cv=f.t3.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t3.value="";
	f.t3.focus();
         alert("This field contains only alphabets ");

        break;
        }
   }

 }
}


function validate3()
{
			
if(f.t4.value.length==0)
 {
   f.t4.focus();
   alert("Please Fill this field");
 }
else
{
 f.t4.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ0123456789.,/-";
   var i;
   for(i=0;i<f.t4.value.length;i++)
   {
      var cv=f.t4.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t4.value="";
	f.t4.focus();
         alert("This field must contains alphabet & numbers");

        break;
        }
   }

 }
}

function validate4()
{
 			
 if(f.t5.value.length==0)
  {
    f.t5.focus();
    alert("Please Fill this field");
  }
 else
 {

 f.t5.focus();
 var  bag="0123456789-";
   var i;
   for(i=0;i<f.t5.value.length;i++)
   {
      var cv=f.t5.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t5.value="";
	f.t5.focus();
         alert("This field must contain only numbers");

        break;
        }
   }

}
}

function validate5()
{

			
if(f.t6.value.length==0)
 {
   f.t6.focus();
   alert("Please Fill this field");
 }
else
{

 f.t6.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ0123456789.@";
   var i;
   for(i=0;i<f.t6.value.length;i++)
   {
      var cv=f.t6.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t6.value="";
	f.t6.focus();
        alert("This field must contains alphabet & numbers");
        break;
        }
    }
  }
}

function validate6()
{

if(f.t7.value.length==0)
 {
   f.t7.focus();
   alert("Please Fill this field");
 }
else
{
 f.t7.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ";
   var i;
   for(i=0;i<f.t7.value.length;i++)
   {
      var cv=f.t7.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t7.value="";
        f.t7.focus();
        alert("This field must contains only alphabets");
        break;
        }
   }
}
}

function validate7()
{
			
if(f.t8.value.length==0)
 {
   f.t8.focus();
   alert("Please Fill this field");
 }
else
{

 f.t8.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ";
   var i;
   for(i=0;i<f.t8.value.length;i++)
   {
      var cv=f.t8.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t8.value="";
        f.t8.focus();
        alert("This field must contains only alphabets");
	break;
      }
    }
  }
}


function validate8()
{
			
if(f.t9.value.length==0)
 {
   f.t9.focus();
   alert("Please Fill this field");
 }
else
{

 f.t9.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ0123456789.,/";
   var i;
   for(i=0;i<f.t9.value.length;i++)
   {
      var cv=f.t9.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t9.value="";
        f.t9.focus();
        alert("This field must contains alphabet & numbers");
	break;
        }
   }
}
}


function validate9()
{
			
if(f.t10.value.length==0)
 {
   f.t10.focus();
   alert("Please Fill this field");
 }
else
{

 f.t10.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ0123456789.,/";
   var i;
   for(i=0;i<f.t10.value.length;i++)
   {
      var cv=f.t10.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t10.value="";
        f.t10.focus();
        alert("This field must contains alphabet & numbers");
	break;
      }
   }
}
}


function validate10()
{
			
if(f.t12.value.length==0)
 {
   f.t12.focus();
   alert("Please Fill this field");
 }
else
{

 f.t12.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ0123456789.,/?";
   var i;
   for(i=0;i<f.t12.value.length;i++)
   {
      var cv=f.t12.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t12.value="";
        f.t12.focus();
        alert("This field must contains alphabet & numbers");
	break;
     }
   }
}

}

function validate11()
{
			
if(f.t13.value.length==0)
 {
   f.t13.focus();
   alert("Please Fill this field");
 }
else
{

 f.t13.focus();
 var  bag="abcdefghijkmnopqrstuvwxyzABCDEFGHIJKMNOPQRSTUVWXYZ.,-/!";
   var i;
   for(i=0;i<f.t13.value.length;i++)
   {
      var cv=f.t13.value.charAt(i);
      if(bag.indexOf(cv)==-1)
        {
        f.t13.value="";
        f.t13.focus();
        alert("This field must contains only alphabets");
	break;
        }
   }
}
}

</script>

</head>

<body bgcolor="#99CCFF">
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
PreparedStatement ps=con.prepareStatement("select count(Empid) from Employee");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
 eid=Integer.parseInt(rs.getString(1));
 PreparedStatement ps1=con.prepareStatement("select Empid from Employee ");
 ResultSet rs1=ps1.executeQuery();
 while(rs1.next())
 {
  eid=Integer.parseInt(rs1.getString(1));
 }
 eid++;
}
else
{
eid=100;
}
}catch(Exception e){}
%>

<form method = post action="http://localhost:8080/ERS/Empreg.jsp" name=f>


<table bgcolor="#6699CC" width=620>
  
<tr bgcolor="#333366" width=620 height=300> 
<font face="Arial" size=3 color="#FFFFF"> <b> Registering Employee </font>


<tr>
 <td><b><font face="Arial" size=2 color="333333"> Employee ID </font></b></td>
 <td><input type=text size=10 name=t0 value=""> </font></td>

 <td><b><font face="Arial" size=2 color="333333">Name</font><b></td>
 <td width=180><input type=text size=20 name=t1 value=""></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Gender</font></b></td>
<td><select name = s1>
            <option>Male</option>
            <option>FeMale</option>
</select></td>
<td><b><font face="Arial" size=2 color="333333">Date of Birth</font></b></td>
<td><select name=dd>

<%
  for(int i=1;i<=31;i++)
  {
  %>
<option><%=i%></option>
<%
   }
   
   %>

   </select>
    
   <select name =mm>
   <option>JAN</option>
   <option>FEB</option>
   <option>MAR</option>
   <option>APR</option>
   <option>MAY</option>
   <option>JUN</option>
   <option>JUL</option>
   <option>AUG</option>
   <option>SEP</option>
   <option>OCT</option>
   <option>NOV</option>
   <option>DEC</option>
   </select>
         
<select name=yy>
<%
	java.util.Date	d	=new	java.util.Date();
	
  for(int i=d.getYear()+1900;i>=1970;i--)
  {
  %>
<option><%=i%></option>
<%
   }
   
   %>
   </select>
</td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Father's Name</font></b></td>
<td><input type=text name=t3 value=""></td>
<td><b><font face="Arial" size=2 color="333333">Address</font></b></td>
<td><input type=text name=t4 value=""></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Phone</font></b></td>
<td><input type=text name=t5 value=""></td>
<td><b><font face="Arial" size=2 color="333333">E-Mail</font></b></td>
<td><input type=text name=t6 value=""></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Department</font></b></td>
<td><input type=text name=t7 value=""></td>
<td><b><font face="Arial" size=2 color="333333">Designation</font></b></td>
<td><input type=text name=t8 value=""></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">User Name</font></b></td>
<td><input type=text name=t9 value=""></td>
<td><b><font face="Arial" size=2 color="333333">Password</font></b></td>
<td><input type=password name=t10 value=""></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Date of Joining</font></b></td>
<td width=200><select name=dd1>
<%
  for(int i=1;i<=31;i++)
  {
  %>
<option><%=i%></option>
<%
   }
   
   %>
   </select>
  
   <select name =mm1>
   <option>JAN</option>
   <option>FEB</option>
   <option>MAR</option>
   <option>APR</option>
   <option>MAY</option>
   <option>JUN</option>
   <option>JUL</option>
   <option>AUG</option>
   <option>SEP</option>
   <option>OCT</option>
   <option>NOV</option>
   <option>DEC</option>
   </select>
  
<select name=yy1>
<%

  for(int i=d.getYear()+1900;i>=1970;i--)
  {
  %>
<option><%=i%></option>
<%
   }
   
   %>
   </select>
   </td>
<td><b><font face="Arial" size=2 color="333333">Hint Question</font></b></td>
<td><input type=text name=t12 value=""></td>
</tr>

<tr>
<td><b><font face="Arial" size=2 color="333333">Answer</font></b></td>
<td><input type=text name=t13 value=""></td>
<td><b><font face="Arial" size=2 color="333333">Salary</font></b></td>
<td><input type=text name=t14 value=0.0></td>
</tr>
</table>

<br>

<center>

<input type =submit value="Submit" STYLE="background-color:ORANGE">
</center>


</form>
</body>
</html>