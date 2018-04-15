<%@ page  import=" java.io.*"%>
<%@ page   import=" java.sql.*"%>

<html>
<head>

<meta http-equiv="Page-Enter"
content="revealTrans(Duration=3.0,Transition=23)">
<meta http-equiv="Page-Exit"
content="revealTrans(Duration=3.0,Transition=23)">

<center><h2><font color=brown>Searching Particular Books

<title></title>
</head>
<body bgcolor="#99CCFF">


<form method = post action="http://localhost:8080/ERS/BookSearchDet.jsp" name=form>
<h3><br><br><br>
     
 <b><font color =green>Type the Book Name & Author Name to be Searched
<br>
<center>
<table>
  
<tr> 
 <td><b>Book Name</td>
   <td><input type =text name=bnm  ></td>
  
</tr>

<tr>
 <td><b>Author</td>
 <td><input type =text name=auth></td>
</tr>

<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
<tr><td></td><td><input type =submit value="Search">
</td>
</tr>

</table>
</center>
</form>
 
</body>
</html>