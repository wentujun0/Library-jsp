<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.sql.*,java.util.*" %>
  <%@ include file="/JDBC/jdbc.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看图书信息</title>
</head>
<body>
	<form name="fm">
		<table width="70%" border="1" cellspacing="0" cellpadding="3">
			<tr>
				<th width="8%">图书编号</th>
				<th width="15%">图书名称</th>
				<th width="10%">图书作者</th>
				<th width="20%">图书出版社</th>
				<th width="10%">图书种类</th>
				<th width="10%">图书价格（人民币）</th>
				<th width="10%">馆藏数量（本）</th>
				<th width="10%">剩余数量（本）</th>
				<th width="7%">操作</th>
			</tr>
			<%
				String bookno = ""; //1、图书编号
				String bookname = ""; //2、图书名称
				String bookauthor = ""; //3、图书作者
				String bookedition = ""; //4、图书出版社
				String bookcat="";//5、图书种类
				int booknumber=-1;//6、馆藏数量
				float bookprice=0;//7、图书价格
				int booklend=-1;//8、剩余数量
				
				
				
				String sql = "select * from book_if group by book_no";
				int i = 0;
				
				stmt = conn.createStatement();
				rs=stmt.executeQuery(sql);
				
				while (rs.next()) {
					i = i + 1;
					bookno = rs.getString("book_no");
					bookname = rs.getString("book_name");
					bookauthor = rs.getString("book_author");
					bookedition = rs.getString("book_edition");
					bookcat=rs.getString("book_cat");
					booknumber=rs.getInt("book_number");
					booklend=rs.getInt("book_lend");
					bookprice=rs.getFloat("book_price");
			%>

			<tr>
				<td><input type="checkbox" name="book_no"
					value="<%=bookno%>"><%=bookno%></td>
				<td><%=bookname%></td>
				<td><%=bookauthor%></td>
				<td><%=bookedition%></td>
				<td><%=bookcat%></td>
				<td><%=bookprice %></td>
				<td><%=booknumber%></td>
				<td><%=booklend %></td>
				
				
				
				<td><a href="bookifEdit.jsp?bookNo=<%=bookno%>">修改</a>&nbsp;&nbsp;
					</td>
			</tr>
			<%
				}
			%>
		</table>
		<br> <a href="booksAdd.jsp">添加</a><br> 
		<input type="button" name="button" value="批量删除" onClick="deleteMore()">
	</form>
	<br><a href="../../Manage/aduser.jsp">返回</a>
</body>
</html>

<script >


function deleteMore(){
	//此处应有验证
	if(!confirm("提示，您是否真的删除此数据？")){
		return;
	}
	document.fm.method = "post";
	document.fm.action = "deleteBook_do.jsp";
	document.fm.submit();
	
}
</script>

