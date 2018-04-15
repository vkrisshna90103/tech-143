<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body bgcolor =99CCFF>
<form method=post action="EmpMessageView.jsp">
<%
  String str = request.getParameter("Message");
  String eid = request.getParameter("frm");
  String sub = request.getParameter("sub");
   %>
<table>
 <tr>
  <td>From</td>
  <td><input type =text name =t1 value=<%=eid%> readonly></td>
  </tr>
 <tr>
  <td>Subject</td>
  <td><input type =text name =t2 value=<%=sub%> readonly></td>
  </tr>
 <tr>
  <td>Message</td>
 </tr>
 </table>
 <table>
 <tr><td>
  <h3><b>
  <textarea name =ta rows =7 cols =45>
  
  <%=str%>
  </textarea></td>
  </tr>
 </table>
 <table>
 <tr><td><input type =Submit name=b1 value=Back ></td></tr>
 </table>
 </form>
 </body>
  </html>