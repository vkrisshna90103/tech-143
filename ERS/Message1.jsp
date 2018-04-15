<%@ page import ="java.sql.*"%>
<html>
<head>
<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">
<script language=JavaScript>
function compose()
{
 document.msgform.action="ComposeMail.jsp";
}
function reply()
{
 document.msgform.action="ReplyMail.jsp";
}
function checkmail()
{
 document.msgform.action="CheckMail.jsp";
}
function remove()
{
 document.msgform.action="RemoveMail.jsp";
}

</script>
</head>

<body bgcolor =99CCFF>

<jsp:useBean id="userdet" class="Session.UserDetails" scope ="session" />

<form name=msgform >
<%
  String str = request.getParameter("Message");
  String sub = request.getParameter("sub");
  String email = request.getParameter("email");
  String send = request.getParameter("send");
  String fid="";
 try
 {
    String ddx="1";
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection con=DriverManager.getConnection("jdbc:odbc:Intranet","","");
    PreparedStatement ps=con.prepareStatement("update Mail set Status =? where Email=? and Subject=?");
    ps.setString(1,ddx);
    ps.setString(2,email);
    ps.setString(3,sub);
    int x=ps.executeUpdate();
   PreparedStatement ps1=con.prepareStatement("select Email from Employee where Username=?");
   ps1.setString(1,send);
   ResultSet rs1 =ps1.executeQuery();
   if(rs1.next())
   {
    fid=rs1.getString(1);
   }
   
}catch(Exception e){}
%>
<input type =hidden name=sub value=<%=sub%>>
<input type =hidden name=send value=<%=send%>>
<input type =hidden name=msg value=<%=str%>>
<table>
 <font color =blue >
 <tr>
 <td> From :</td>
  <td><input type =text name=em1 value=<%=fid%> size=45><br></td>
  <td><font color =green><b><a href ="AddressBook.jsp?add=<%=fid%>" >Add To Address</b></a></td>
</tr><tr>
 <td>To   :</td>
 <td><input type =text name=em value=<%=email%> size=45></font></td></tr>
</table>
  <h3><b>
 <table  cellpadding=2 cellspacing=2>
 <tr>
 <td align=left><input type =submit name =submit value=Remove onClick=remove()></td>
 <td align=left><input type =submit name =submit value=Compose onClick=compose()></td>
 <td align=left><input type =submit name =submit value=Reply onClick=reply()></td>
 <td align=left><input type =submit name =submit value=CheckMail onClick=checkmail()></td>
 </tr>
 
 </table>
   
  <textarea name =ta rows =10 cols =55>
  
  <%=str%>
  </textarea>
  
  
 <table  cellpadding=2 cellspacing=2>
 <tr>
 <td align=left><input type =submit name =submit value=Remove onClick=remove()></td>
 <td align=left><input type =submit name =submit value=Compose onClick=compose()></td>
 <td align=left><input type =submit name =submit value=Reply onClick=reply()></td>
 <td align=left><input type =submit name =submit value=CheckMail onClick=checkmail()></td>
 </tr>
 
 </table>
 </form>
 </body>
  </html>