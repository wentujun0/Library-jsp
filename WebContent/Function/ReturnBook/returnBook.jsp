<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/JDBC/jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>归还图书</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userNo = request.getParameter("userno");
	out.println("当前用户编号:"+userNo);
%>

<h1 style="background-color:red;text-align:center;">用户借阅信息搜索</h1>
<form name="search1" method="post" action="returnBook_list.jsp?userno=<%=userNo%>">

<div style="margin: 30px auto;position:fixed;left:570px">
<table>
<tr>
<td>用户编号:</td>
<td><input type="text" name="search2"  style="length:60px;"></td>
<td><input type="submit" name="fmsubmit" value="搜索" ></td>
</tr>

</table>
</div>


</form>


<span><br><br><br><a href="javascript:history.back()">返回</a></span>








</body>
</html>