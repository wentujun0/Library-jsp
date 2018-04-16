<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/JDBC/jdbc.jsp"   %>
<body>
<%
		request.setCharacterEncoding("UTF-8");

		String userid = request.getParameter("id");
		String userpassword =request.getParameter("password");
		String username =request.getParameter("name");
		String userno =request.getParameter("no");
		String usersex = request.getParameter("sex");
		//String userlevel =request.getParameter("level");
		String useremail=request.getParameter("email");
		int count=0;
		
		if(conn != null)
		{			
			
		try{
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
			 
		}
		catch(Exception e){
			out.println("错误是"+e);
			out.println();
		}
		
			if(count>0){
				//response.sendRedirect("home.jsp");
				out.println("注册成功");
			}
			else{
				out.print("注册失败");
				%>
				<a href="javascript:history.back()">返回</a>
				<% 
			}			
			// 输出连接信息
			//out.println("数据库连接成功！");
			// 关闭数据库连接
			conn.close();
		}
		else
		{
			// 输出连接信息
			out.println("数据库连接失败！");						
		}
	
%>
</body>