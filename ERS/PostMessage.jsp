<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
</head>

<body bgcolor="gray">
<table>

<jsp:useBean id="chatBean" class="Session.ChatBean" scope="session"/>
<%String msg=request.getParameter("chatmessage");
if((request.getParameter("submittype").equals("S"))&& msg.length()>0)
{

chatBean.addMessage(msg);
}
String[][] newmsg=chatBean.getUnread();%>
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