<jsp:useBean id="chatBean" class="Session.ChatBean" scope="session"/>
<%
chatBean.addMessage(">>NOW IN ROOM <<<");
String[][] newmsg=chatBean.getUnread();%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body>
<table>
<%
for(int i=0; i<newmsg.length; i++)
{
%>
<tr>
<td>
<b>
<%=newmsg[i][0]+":"%>
</b>
</td>
<td>
<b>
<%=newmsg[i][1] %>
</td>
</tr>
<%
}
%>
</table>
</body>
</html>