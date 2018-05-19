<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找图书</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userNo = request.getParameter("userno");
	
	out.println("用户编号:"+userNo+"<br>");
	//session.setAttribute("userno", userNo);

%>

<h1 style="background-color:red;text-align:center;">图书搜索</h1>
<form name="search1" method="post" action="searchList.jsp?userno=<%=userNo%>">
<div style="width:90px;margin: 10px auto;">
<input type="text" name="search2"  style="length:60px;">

</div>
<input type="submit" value="搜索" >
</form>
<br>
<a href="javascript:history.back()">返回</a>

</body>
</html>
<script type="text/javascript">
function seacrchbu()
{
	alert("123");
	//window.locationg.href="searchList.jsp?userno=";
	}

</script>