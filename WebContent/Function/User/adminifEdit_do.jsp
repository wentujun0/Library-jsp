<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/JDBC/jdbc.jsp" %>
<html>

<body>
<%
request.setCharacterEncoding("UTF-8");

String userNo=request.getParameter("userno");
String userName=request.getParameter("username");
String userId=request.getParameter("userid");
String userSex=request.getParameter("usersex");
String userEmail=request.getParameter("useremail");
String userPassword=request.getParameter("userpassword");

out.println(userName+"<br>");
out.println(userId+"<br>");
String sql=null;

int count=0;
if(userPassword==null||userPassword=="")
{
	//out.println("密码1:"+userPassword+"<br>");
	sql="update user_if set user_name=?,user_id=?,user_sex=?,user_email=? where user_no="+" '"+userNo+"'";
	//out.println("SQL"+sql+"<br>");
	pstmt =conn.prepareStatement(sql);
	pstmt.setString(1,userName);
	pstmt.setString(2,userId);
	pstmt.setString(3,userSex);
	pstmt.setString(4,userEmail);
	count=pstmt.executeUpdate();//数据库更新操作
}
else{
	//out.println("密码<br>");
	sql="update user_if set user_name=?,user_id=?,user_password=?,user_sex=?,user_email=? where user_no= "+" '"+userNo+"'";
	pstmt =conn.prepareStatement(sql);
	pstmt.setString(1,userName);
	pstmt.setString(2,userId);
	pstmt.setString(3,userPassword);
	pstmt.setString(4,userSex);
	pstmt.setString(5,userEmail);
	count =pstmt.executeUpdate();//数据库更新操作
}


pstmt.close();  //关闭执行语句
conn.close();  //关闭一次连接  

if(count>0){
	
	out.println("<script language='javaScript'> alert('修改成功！');</script>");
	response.setHeader("refresh", "2;url=adminif.jsp");
}
else{
	out.print("<script language='javaScript'> alert('修改失败！');</script>");
	response.setHeader("refresh", "2;url=adminif.jsp");
}			


%>

</body>
</html>