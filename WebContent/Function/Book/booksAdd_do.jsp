<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/JDBC/jdbc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1233412</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String bookNo = request.getParameter("book_no");
String bookName =request.getParameter("book_name");
String bookAuthor =request.getParameter("book_author");
String bookEdition =request.getParameter("book_edition");
String bookCat = request.getParameter("book_cat");
float bookPrice = Float.parseFloat(request.getParameter("book_price"));
int bookNumber=Integer.parseInt(request.getParameter("book_number"));
int count=-1;

String sql="insert into book_if(book_no,book_name,book_author,book_edition,book_cat,book_price,book_number,book_lend)"
		+"values(?,?,?,?,?,?,?,?)";
pstmt =conn.prepareStatement(sql); //实例化preparedStatement 
pstmt.setString(1,bookNo);  
pstmt.setString(2,bookName);
pstmt.setString(3,bookAuthor);
pstmt.setString(4,bookEdition);
pstmt.setString(5,bookCat);
pstmt.setFloat(6,bookPrice);
pstmt.setInt(7,bookNumber);
pstmt.setInt(8,bookNumber);

count =pstmt.executeUpdate();//数据库更新操作



pstmt.close();  //关闭执行语句
conn.close();  //关闭一次连接  

if(count>0){
	
	out.println("<script language='javaScript'> alert('添加成功!');</script>");
	response.setHeader("refresh","0;url=booksList.jsp");
}
else{
	out.print("<script language='javaScript'> alert('添加失败!');</script>");
	response.setHeader("refresh","0;url=booksAdd.jsp");
}			




%>




</body>
</html>