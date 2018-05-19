<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书</title>
<script>
var flag=flase;
function subCheck()
{
	var bookno=document.getElementById("book_no").value;
	var bookname=document.getElementById("book_name").value;
	var booknumber=document.getElementById("book_number").value;
	
	if(bookno==""||bookname=="")
		{alert("图书编号或者图书名称不能为空!");
		return flag;
		}
	else if(booknumber=="")
		{alert("请输入入库的数量");
		return flag;
		}
	else
		{
		flag=true;
		return flag;
		}
	
	
}



</script>
</head>
<body>
<h1>入库编辑</h1>
<div id="addbook">
<form  method="post" name="fm" onsubmit="return subCheck(fm)" action="booksAdd_do.jsp" >
<table>
 <tr>
 	<td>图书编号:</td>
 	<td><input type="text" name="book_no" id="book_no" placeholder="请输入图书编号" maxlength="10"onfocus = "if(this.value == '输入10个字符以内') this.value =''"><span style="color:red">*</span></td>
 </tr>
 <tr>
 	<td>图书名称：</td>
 	<td><input type="text" name="book_name" id="book_name" placeholder="请输入图书名称"><span style="color:red">*</span> </td>
 </tr>
 <tr>
 	<td>图书作者：</td>
 	<td><input type="text" name="book_author" id="book_author" placeholder="请输入图书作者"><span style="color:red">*</span></td>
 </tr>
 <tr>
	<td>图书出版社：</td>
 	<td><input type="text" name="book_edition" id="book_edition" placeholder="请输入图书出版社"><span style="color:red">*</span></td>
 
 </tr>
 <tr>
 	<td>图书种类：</td>
 	<td> <select name="book_cat" id="book_cat">
 			<option value="A" selected="selected">数学</option>
 			<option value="B">科技</option>
 			<option value="C">计算机</option>
 			<option value="D">艺术</option>
 			<option value="E">小说</option>
 		</select>
 	</td>
 	
 </tr>
 
 <tr>
 	<td>图书价格：</td>
 	<td><input type="text" name="book_price" id="book_price" ></td>
 </tr>
 <tr>
 	<td>入库数量：</td>
 	<td><input type="text" name="book_number" id="book_number" placeholder="请输入入库数量"><span style="color:red">*</span></td>
 </tr>
 
</table>
 <div id="re_button">
<input type="submit" name="submit" value="提交" >
<input type="reset"  name="reset1" value="重置">

</div>
</form>
</div>

</body>
</html>
