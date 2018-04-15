<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">

<script language ="Javascript">
function giveFocus()
{
document.msgform.chatmessage.focus()
}
function submitForm(n)
{
document.msgform.chatmessage.value=document.msgform.inputmsg.value
document.msgform.submittype.value=n
document.msgform.inputmsg.value=" "
document.msgform.submit()
}
</script>
</head>
<body bgcolor=blue>
<u><b><font color= brown >Enter msg in box and click on send or refresh
<form name="msgform" method=post target ="top" action="PostMessage.jsp">

<input type=hidden name="chatmessage">
<input type=hidden name="submittype">
<input type=text name="inputmsg">

<input type=button value=Send onclick=submitForm("S")>
<input type=button value=Refresh onclick=submitForm("R")>
<br>
<center><a href ="ExitChat.jsp" target="EMPLIBMAIN"><font color=red>Exit</font></a></center>

</form>
</body>
</html>