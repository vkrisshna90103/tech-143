

<html>

<head> 

<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
<script language="Javascript">
function cancel()
{
 document.f1.action="CheckMail.jsp";
}
</script>
<title> Reply the Mail </title>
</head>
<body bgcolor="#99CCFF">


<% 
  String email =request.getParameter("em1");
  String sub =request.getParameter("sub");
  
%>

<h3><font color="blue"  size=4><center> Reply</center>  </font></h3>
       
<form method = "post" action = "SendMail.jsp" name =f1>

<table>
<tr>
<td><font size=2 face="">To </td>
<td><input type="text" name=t1 size=40 value=<%=email%>></td>
</tr>
<tr>
<td><font size=2 face=""><u>Subject</td>
<td><input type="text" name=t2 size=40 value="Re :<%=sub%>"></td>
</tr>
<tr>
<td><font size=2 >Message </td>
<td><textarea  rows=10 cols=45 name=ta1 >  </textarea></td>
</tr>
<tr><td cellspacing=2><input type="Submit" value=Send> </td>
<td cellspacing=2><input type="Submit" value=Cancel onClick=cancel()> </td>
</tr>
</table>
</body>
</html>