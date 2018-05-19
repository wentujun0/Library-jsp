<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息管理界面</title>
<% 
	//out.println("欢迎用户"+session.getAttribute("List[0]")); 
	String userLevel=(String)session.getAttribute("userlevel");
	String userId=(String)session.getAttribute("userid");
	String userName=(String)session.getAttribute("username");
	String userNo=(String)session.getAttribute("userno");
	out.println("欢迎用户:"+userName+"<br>");
	out.println("用户类别:"+userLevel+"<br>");
	out.println("用户编号:"+userNo);
	
	//session.setAttribute("userid", userId);
%>
<script>


window.onload=function()
{
	//alert("aaa");
	var userLevel="<%=userLevel%>";
	//alert(userLevel);
	if(userLevel=="a")
	{

	document.getElementById("superadmin").style.display="";
	}
else if(userLevel=="b")
	{
	document.getElementById("admin").style.display="";
	}
else if(userLevel=="c")
	{
	document.getElementById("user").style.display="";
	}


}


var user_no="<%=userNo%>";

function ifbutton()
{
	alert("确认跳转");
	window.location.href="userif.jsp";
}
function searchbutton()
{
	alert("确认跳转");
	window.location.href="../Function/LendBook/search.jsp?userno=<%=userNo%>";
}
function returnbutton()
{	
	alert("确认跳转");
	window.location.href="../Function/ReturnBook/returnBook.jsp?userno=<%=userNo%>";
	
}
function lrifbutton()
{
	alert("确认跳转");
	window.location.href="../Function/ReturnBook/lrifList.jsp";
	
}
function bookifbutton()
{
	alert("确认跳转");
	window.location.href="../Function/Book/booksList.jsp";
	
}
function userifbutton(){
	
	alert("确认跳转");
	window.location.href="../Function/User/usersList.jsp";
}
function setAdmintbtton(){
	alert("确认跳转");
	window.location.href="../Function/User/setAdmin.jsp";
}
function adminifbutton(){
	alert("确认跳转");
	window.location.href="../Function/User/adminif.jsp";
}
function lendlistbutton(){
	alert("确认跳转");
	window.location.href="../Function/Book/lendlist.jsp?userno=<%=userNo%>";
}

</script>
</head>
<body>

<br>
<span  id="user" style="display:none">
<input type="button" value="个人信息" onClick="ifbutton()">
<input type="button" value="搜索图书" onClick="searchbutton()">
<input type="button" value="借阅信息" onclick="lendlistbutton()">
</span>
<br>
<span id="admin" style="display:none">
<input type="button" value="查看用户信息" onclick="userifbutton()">
<input type="button" value="归还图书" onClick="returnbutton()">
<input type="button" value="查看所有图书" onclick="bookifbutton()">
<input type="button" value="查看借阅表" onClick="lrifbutton()">
</span>
<br>
<span id="superadmin" style="display:none">
<input type="button" value="设置管理员" onclick="setAdmintbtton()">
<input type="button" value="管理员信息" onclick="adminifbutton()">
</span>

</body>
</html>
