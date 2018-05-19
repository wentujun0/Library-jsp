<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/JDBC/jdbc.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
String  bookNo[] = request.getParameterValues("book_no"); 
String  sql=null;
int count=0;
if  (bookNo!=null) 
{ 
	stmt = conn.createStatement();
     for(int i=0;i<bookNo.length;i++) 
    { 
    	 try{
    	  sql = "delete  from book_if  where  book_no="+" '"+bookNo[i]+"'"; 
    	  count=stmt.executeUpdate(sql); 
    	 }
    	 catch(SQLException e)
    	 {
    		 out.println("错误"+e);
    	 }		
    } 
     stmt.close();  //关闭执行语句
	conn.close();  //关闭一次连接
} 

   response.sendRedirect("booksList.jsp");

%>