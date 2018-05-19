<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/JDBC/jdbc.jsp" %>
<%
		request.setCharacterEncoding("UTF-8");
		String userid = request.getParameter("id");
		String userpassword =request.getParameter("password");
		String username =request.getParameter("name");
		String userno =request.getParameter("no");
		String usersex = request.getParameter("sex");
		//String userlevel =request.getParameter("level");
		String useremail=request.getParameter("email");
		int count=-1;
			String sql="insert into user_if(user_no,user_name,user_sex,user_id,user_password,user_email,user_level)"
						+"values(?,?,?,?,?,?,?)";
			pstmt =conn.prepareStatement(sql); //实例化preparedStatement 
		    pstmt.setString(1,userno);  
		    pstmt.setString(2,username);
		    pstmt.setString(3,usersex);
		    pstmt.setString(4,userid);
		    pstmt.setString(5,userpassword);
		    pstmt.setString(6,useremail);
		    pstmt.setString(7,"c");
		   	count =pstmt.executeUpdate();//数据库更新操作
			pstmt.close();  //关闭执行语句
			conn.close();  //关闭一次连接 
			if(count>0){
				
				out.print("<script language='javaScript'> alert('恭喜您，注册成功');</script>");
				response.setHeader("refresh","0;url=login.jsp");
			}
			else{
				out.print("<script language='javaScript'> alert('注册失败!');</script>");
				response.setHeader("refresh","0;url=register.jsp");
			}			
%>