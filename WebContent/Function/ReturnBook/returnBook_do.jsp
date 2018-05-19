<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="/JDBC/jdbc.jsp" %>
     <%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>还书操作 </title>
<script language=javascript>
function go()
{
window.history.go(-1);
}
setTimeout("go()",1);
</script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String operator=request.getParameter("operator");
	int lrifno=Integer.parseInt(request.getParameter("lrifno"));
	String userno=request.getParameter("userno");
	out.println("operator:"+operator+"<br>");	
	out.println("lrifno:"+lrifno+"<br>");	
	out.println("userno:"+userno+"<br>");	
	
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(  
		     "yyyy-MM-dd");  
	java.util.Date currentTime = new java.util.Date();  
	String  time = simpleDateFormat.format(currentTime).toString();  //放到页面的head中} 
	//借书时间设定为当前时间，并转化为sql.date格式
	java.util.Date temp=new SimpleDateFormat("yyyy-MM-dd").parse(time);
	java.sql.Date returnTime=new java.sql.Date(temp.getTime());
	
	int count=-1;
	int count1=-1;
	String sql="update book_lrif set return_time=?,operator=? , book_statue='1' where lrif_no=?";
	pstmt =conn.prepareStatement(sql); //实例化preparedStatement 
	pstmt.setDate(1,returnTime); 
	pstmt.setString(2,operator); 
	pstmt.setInt(3,lrifno); 
	try{
	count =pstmt.executeUpdate();//数据库更新操作
	}
	catch(SQLException e){
		out.println("错误是:"+e+"<br>");
	}
	String sql1="update user_if set lend_number=lend_number-1 where user_no="+" '"+userno+"' ";
	stmt = conn.createStatement();
	count1=stmt.executeUpdate(sql1);
	if(count>0&&count1>0){
		pstmt.close();  //关闭执行语句
		stmt.close();  //关闭执行语句
		conn.close();  //关闭一次连接
		out.println("<script language='javaScript'> alert('还书成功!');</script>");
	}
%>
<br> <a href="javascript :history.back(-1)">返回</a>
</body>
</html>