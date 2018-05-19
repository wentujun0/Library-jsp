<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/JDBC/jdbc.jsp" %>
<html>
<body>
<%out.println("删除图书后台管理"); %>>
<%
request.setCharacterEncoding("UTF-8");
String  userNo[] = request.getParameterValues("user_no"); 


 String  sql=null;
 int count=0;
if  (userNo!=null) 
{ 
	stmt = conn.createStatement();
     for(int i=0;i<userNo.length;i++) 
    { 
    	 try{
    	  sql = "delete  from user_if  where user_no="+" '"+userNo[i]+"'"; 
    	  count=stmt.executeUpdate(sql); 
    	 }
    	 catch(SQLException e)
    	 {
    		 out.println("错误"+e);
    	 }
		
    } 
      
     stmt.close();  //关闭执行语句
	conn.close();  //关闭一次连接
	//out.print("<script language='javaScript'> alert('删除成功!');</script>");
} 

   response.sendRedirect("usersList.jsp");

%>
</body>
</html>