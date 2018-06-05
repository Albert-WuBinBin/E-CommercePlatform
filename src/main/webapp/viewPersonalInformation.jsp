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
		<h1 align="center">Personal Information</h1>
		<sql:setDataSource var="user" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3307/ECommercePlatform?serverTimezone=UTC" user="root"
			password="123456" />
		<sql:query dataSource="${user}" var="us">
           		SELECT * FROM user  where u_id='<%=session.getAttribute("id")%>' 
        </sql:query>

		<table
			style="font-size: 28px; position: relative; left: 200px; top: 30px;">
			<c:forEach items="${us.rows}" var="u">
				<tr>
					<td>ID:</td>
					<td><center>
							<c:out value="${u.u_id}" />
						</center></td>
				</tr>
				<tr>
					<td>Name:</td>
					<td><center>
							<c:out value="${u.u_name}" />
						</center></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><center>
							<c:out value="${u.u_phone}" />
						</center></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><center>
							<c:out value="${u.u_email}" />
						</center></td>
				</tr>
				<tr>
					<td>Age:</td>
					<td><center>
							<c:out value="${u.u_age}" />
						</center></td>
				</tr>
				<tr>
					<td>Sex:</td>
					<td><center>
							<c:out value="${u.u_sex}" />
						</center></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><center>
							<c:out value="${u.u_address}" />
						</center></td>
				</tr>
				<tr>
					<td>IDCart:</td>
					<td><center>
							<c:out value="${u.u_idcart}" />
						</center></td>
				</tr>
				<tr>
					<td>Account Balance</td>
					<td align="center">￥${u.u_money}</td>
				</tr>
				<tr>
					<td colspan="2"><a href="modifyPersonalInformation.jsp">Modify
							Personal Information</a></td>
				</tr>
			</c:forEach>

		</table>
	</div>
</body>
</html>