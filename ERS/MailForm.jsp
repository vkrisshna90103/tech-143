<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">


<style type="text/css">

.textanimlink,a {
text-decoration : none;
}
P.main {
	font-family : Arial;
	font-size : 15pt;
	font-weight : bold;
}

</style>


<Script Language="Javascript">


bname=navigator.appName;
bversion=parseInt(navigator.appVersion)
if ((bname=="Netscape" && bversion>=4) || (bname=="Microsoft Internet Explorer" && bversion>=4))
window.onload=start
else
stop();
window.onunload=stop
if (bname=="Netscape"){
brows=true
dt=2
}
else{
brows=false
dt=20
}
var z=0;
var msg=0;
var rgb=0;
var link=false;
var status=true;
var updwn=false;
var message= new Array();
var value=0;
var h=window.innerHeight;
var w=window.innerWidth;
var timer1;
var timer2;
var timer3;
var convert = new Array()
var hexbase= new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F");

// Put here your own messages. Add as many as you wan't (Do not edit anything else in the Script except the lines below)

var bgcolor="#FFFFFF"; //Color of background
var color="#00008D";  //Color of the Letters

message[0]='Mail to Anothers'
message[1]='Exchange Ideas '
message[2]='Exchange Information'
message[3]='Exchange Minds'


// View  Available Books, search for any book by giving book name or author name, view the availability of the book, reserve for a book

for (x=0; x<16; x++){
for (y=0; y<16; y++){
convert[value]= hexbase[x] + hexbase[y];
value++;
}
}

redx=color.substring(1,3);
greenx=color.substring(3,5);
bluex=color.substring(5,7);
hred=eval(parseInt(redx,16));
hgreen=eval(parseInt(greenx,16));
hblue=eval(parseInt(bluex,16));
eredx=bgcolor.substring(1,3);
egreenx=bgcolor.substring(3,5);
ebluex=bgcolor.substring(5,7);
ered=eval(parseInt(eredx,16));
egreen=eval(parseInt(egreenx,16));
eblue=eval(parseInt(ebluex,16));
red=ered;
green=egreen;
blue=eblue;

function start(){
if ((bname=="Netscape" && bversion>=4) || (bname=="Microsoft Internet Explorer" && bversion>=4)){
link=false;
updwn=true;
if (brows)
res=document.layers['textanim'].top
else{
textanim.style.width=document.body.offsetWidth-20;
textanim.innerHTML='<Pre><P Class="main" Align="Center">'+message[msg]+'</P></Pre>'
res=textanim.style.top
for (x=0; x<document.all.length; x++)
if(document.all[x].id=="textanimlink")
link=true;
}
up()
}
}

function stop(){
clearTimeout(timer1);
clearTimeout(timer2);
clearTimeout(timer3);
}

function resz(){
h=window.innerHeight;
w=window.innerWidth;
if (updwn)
timer1=setTimeout('up()',1000)
else
timer2=setTimeout('down()',1000)
}

function breakf(){
if (status){
clearTimeout(timer1);
clearTimeout(timer2);
status=false
return;
}
else{
status=true;
if (updwn)
timer1=setTimeout('up()',dt)
else
timer2=setTimeout('down()',dt)
}
}


function up(){
if (red<hred){
if ((red+7)<hred)
red+=7;
else
red=hred
redx = convert[red]
}
else{
if ((red-7)>hred)
red-=7;
else
red=hred
redx = convert[red]
}

if (green<hgreen){
if ((green+7)<hgreen)
green+=7;
else
green=hgreen
greenx = convert[green]
}
else{
if ((green-7)>hgreen)
green-=7;
else
green=hgreen
greenx = convert[green]
}

if (blue<hblue){
if ((blue+7)<hblue)
blue+=7;
else
blue=hblue
bluex = convert[blue]
}
else{
if ((blue-7)>hblue)
blue-=7;
else
blue=hblue
bluex = convert[blue]
}

rgb = "#"+redx+greenx+bluex;
if (brows){
document.layers['textanim'].document.linkColor=rgb;
document.layers['textanim'].document.vlinkColor=rgb;
if (window.innerHeight!=h || window.innerWidth!=w){
clearTimeout(timer1);
resz()
return;
}
else{
document.layers['textanim'].document.write('<Pre><P Class="main" Align="Center"><font color="'+rgb+'">'+message[msg]+'</font></P></Pre>')
document.layers['textanim'].document.close();
}
}
else{
textanim.style.color=rgb;
if(link)
textanimlink.style.color=rgb;
}
if (z<38){
if (brows)
document.layers['textanim'].top--
else
textanim.style.posTop--
z++
timer1=setTimeout('up()',dt)
}
else
{
updwn=false;
down()
}
}


function down(){
if (red<ered){
if ((red+7)<ered)
red+=7;
else
red=ered
redx = convert[red]
}
else{
if ((red-7)>ered)
red-=7;
else
red=ered
redx = convert[red]
}

if (green<egreen){
if ((green+7)<egreen)
green+=7;
else
green=egreen
greenx = convert[green]
}
else{
if ((green-7)>egreen)
green-=7;
else
green=egreen
greenx = convert[green]
}

if (blue<eblue){
if ((blue+7)<eblue)
blue+=7;
else
blue=eblue
bluex = convert[blue]
}
else{
if ((blue-7)>eblue)
blue-=7;
else
blue=eblue
bluex = convert[blue]
}

rgb = "#"+redx+greenx+bluex;
if (brows){
document.layers['textanim'].document.linkColor=rgb;
document.layers['textanim'].document.vlinkColor=rgb;
if (window.innerHeight!=h || window.innerWidth!=w){
clearTimeout(timer2);
resz()
return;
}
else{
document.layers['textanim'].document.write('<Pre><P Class="main" Align="Center"><font color="'+rgb+'">'+message[msg]+'</font></P></Pre>')
document.layers['textanim'].document.close();
}
}
else{
textanim.style.color=rgb;
if(link)
textanimlink.style.color=rgb;
}

if (z<76){
if (brows)
document.layers['textanim'].top--
else
textanim.style.posTop--
z++
timer2=setTimeout('down()',dt)
}
else
{
if (brows){
document.layers['textanim'].document.write('')
document.layers['textanim'].document.close();
}
else
textanim.innerHTML='';
window.clearInterval(timer2);
if(msg<message.length-1){
msg++;
z=0;
if (brows){
document.layers['textanim'].top=res;
}
else
textanim.style.top=res;
timer3=setTimeout('start()',100);
}
else
{
msg=0;
z=0;
if (brows)
document.layers['textanim'].top=res;
else
textanim.style.top=res;
timer3=setTimeout('start()',2000);
}
}
}

</Script>
</head>

<body bgcolor="99CCFF">

<Div id="textanim" style="position: absolute; left: 0; top: 180" onclick="breakf()">
</Div>
<Layer name="textanim" left=0 top=180>
</Layer>

<%! String eid1,bid1;%>
<form method =post>
<%! int count;%>
<jsp:useBean id ="userdet" class ="Session.UserDetails" scope ="session" />

<%
java.util.Date d =new java.util.Date();
String email="";

try
{

   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
   PreparedStatement ps=con.prepareStatement("select Email from Employee where Username=? and Password=?");
   ps.setString(1,userdet.getUser());
   ps.setString(2,userdet.getPassword());
   
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
    email =rs.getString(1);
    
    
   
   }
   
}catch(Exception e){}
try
{
   Connection cn=DriverManager.getConnection("jdbc:odbc:Intranet","","");
   PreparedStatement ps=cn.prepareStatement("select count(Email) from Mail where Email=? and Status =0");
   ps.setString(1,email);
   
   
   ResultSet rs = ps.executeQuery();

 if(rs.next())
    {
    
 %> <font color=blue>
    <h2>You have <b>(<%=rs.getString(1) %>)</b> Unread Messages</h3></font>
    <br>
    <br>
 <%
    }
 }catch(Exception e){}   
%>
  
 
</form>

 </body>
 </html>
