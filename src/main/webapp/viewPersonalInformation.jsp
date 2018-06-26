<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="showbody">
		<h1 align="center">个人信息</h1>
		<table
			style="font-size: 28px; position: relative; left: 200px; top: 30px;">
				<tr>
					<td>ID:</td>
					<td><center>
							${sessionScope.user.id}
						</center></td>
				</tr>
				<tr>
					<td>名字:</td>
					<td><center>
							${sessionScope.user.name}
						</center></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><center>
							${sessionScope.user.phone}
						</center></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><center>
							${sessionScope.user.email}
						</center></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><center>
							${sessionScope.user.age}
						</center></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td><center>
							${sessionScope.user.sex}
						</center></td>
				</tr>
				<tr>
					<td>地址:</td>
					<td><center>
							${sessionScope.user.address}
						</center></td>
				</tr>
				<tr>
					<td>身份证:</td>
					<td><center>
							${sessionScope.user.idcart}
						</center></td>
				</tr>
				<tr>
					<td>余额</td>
					<td align="center">￥${sessionScope.user.money}
				</tr>
				<tr>
					<td colspan="2"><a href="modifyPersonalInformation.jsp">修改个人信息</a></td>
				</tr>

		</table>
	</div>
</body>
</html>