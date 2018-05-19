<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLDecoder"%> 
    <%@page import="java.text.SimpleDateFormat"%> 
    <%@ include file="../../JDBC/jdbc.jsp" %>
<html>
<head>
<title>借阅图书结果 </title>
<script type="text/javascript">
function go()
{
window.history.go(-1);
}
setTimeout("go()",1);
</script>
</head>
<body>
<% 	
	request.setCharacterEncoding("UTF-8");//设置格式
	String userNo=request.getParameter("userno");
	String bookNo=request.getParameter("bookno"); 
	String bookName=(String)session.getAttribute("bookName");
	out.println("图书编号:"+bookNo+"<br>");
	out.println("图书名称:"+bookName+"<br>");
	java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(  
		     "yyyy-MM-dd");  
	java.util.Date currentTime = new java.util.Date();  
	String  time = simpleDateFormat.format(currentTime).toString();  //放到页面的head中} 
	//借书时间设定为当前时间，并转化为sql.date格式
	java.util.Date temp=new SimpleDateFormat("yyyy-MM-dd").parse(time);
	java.sql.Date nowTime=new java.sql.Date(temp.getTime());
	/*
	String Rtime="0000-00-00";
	java.util.Date temp1=new SimpleDateFormat("yyyy-MM-dd").parse(Rtime);
	java.sql.Date returnTime=new java.sql.Date(temp1.getTime());
	*/
	//out.println("参数名"+cookie_no.getName());
	out.println("用户编号:"+userNo+"<br>");
	int count=-1;
	int count1=-1;
	
	String sql="insert into book_lrif(user_no,book_no,book_name,lend_time)"
			+"values(?,?,?,?)";
	pstmt =conn.prepareStatement(sql); //实例化preparedStatement 
	pstmt.setString(1,userNo);  
	pstmt.setString(2,bookNo);
	pstmt.setString(3,bookName);
	pstmt.setDate(4,nowTime);
	//pstmt.setDate(5,returnTime);
	count =pstmt.executeUpdate();//数据库更新操作
	String sql1="update user_if set lend_number=lend_number+1 where user_no="+" '"+userNo+"' ";
	stmt = conn.createStatement();
	count1=stmt.executeUpdate(sql1);
	
		if(count>0&&count1>0){
			pstmt.close();  //关闭执行语句
			stmt.close();  //关闭执行语句
			conn.close();  //关闭一次连接
			out.println("<script language='javaScript'> alert('借阅成功!');</script>");
			%>
			<a href="javascript:history.back()">返回</a>
			<% 
		}
		else{
			out.println("<script language='javaScript'> alert('没有找到该图书');</script>");
			%>
			<a href="javascript:history.back()">返回</a>
			<% 
		}			
%>
</body>
</html>