<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<style>
body {
	margin: 20px auto;
	font-family: 'trebuchet MS', 'Lucida sans', Arial;
	color: #444;
}

table {
	*border-collapse: collapse; /* IE7 and lower */
	border-spacing: 0;
	width: 100%;
}

.bordered {
	border: solid #ccc 1px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	border-radius: 6px;
	-webkit-box-shadow: 0 1px 1px #ccc;
	-moz-box-shadow: 0 1px 1px #ccc;
	box-shadow: 0 1px 1px #ccc;
}

.bordered tr:hover {
	background: #fbf8e9;
	-o-transition: all 0.1s ease-in-out;
	-webkit-transition: all 0.1s ease-in-out;
	-moz-transition: all 0.1s ease-in-out;
	-ms-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

.bordered th {
	background-color: #dce9f9;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc),
		to(#dce9f9));
	background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -moz-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -ms-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: -o-linear-gradient(top, #ebf3fc, #dce9f9);
	background-image: linear-gradient(top, #ebf3fc, #dce9f9);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .8) inset;
	border-top: none;
	text-shadow: 0 1px 0 rgba(255, 255, 255, .5);
}

.bordered td:first-child, .bordered th:first-child {
	border-left: none;
}

.bordered th:first-child {
	-moz-border-radius: 6px 0 0 0;
	-webkit-border-radius: 6px 0 0 0;
	border-radius: 6px 0 0 0;
}

.bordered th:last-child {
	-moz-border-radius: 0 6px 0 0;
	-webkit-border-radius: 0 6px 0 0;
	border-radius: 0 6px 0 0;
}

.bordered th:only-child {
	-moz-border-radius: 6px 6px 0 0;
	-webkit-border-radius: 6px 6px 0 0;
	border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
	-moz-border-radius: 0 0 0 6px;
	-webkit-border-radius: 0 0 0 6px;
	border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
	-moz-border-radius: 0 0 6px 0;
	-webkit-border-radius: 0 0 6px 0;
	border-radius: 0 0 6px 0;
}

.bordered td, .bordered th {
	border-left: 0px solid #ccc;
	border-top: 0px solid #ccc;
	padding: 10px;
	text-align: left;
}
</style>

<body>
	<sql:setDataSource var="buydetails" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql:///ECommercePlatform?serverTimezone=UTC" user="root"
		password="123456" />
	<sql:query dataSource="${buydetails}" var="bd">
           		SELECT * FROM buydetails b join product p on b.p_id=p.p_id join shop s on p.s_id=s.s_id  where u_id='<%=session.getAttribute("id")%>' and bd_state='true' and bd_confirm="true" and bd_delivery='true' and bd_comment="true"
            </sql:query>

	<c:forEach items="${bd.rows}" var="b">
		<table class="bordered">
			<thead>
				<tr>
					<th width="19%">${b.bd_date}</th>
					<th width="31%">订单号: 2382058165247436</th>
					<th colspan="5"><a href="">${b.s_name}</a></th>
					<th colspan="2"><a href=""><img src="images/logo2.png" /></a></th>
				</tr>
			</thead>
			<tr>
				<td height="92"><img width="100" height="100"
					src="${b.p_image}" /></td>
				<td>${b.p_name}</td>
				<td>￥${b.p_price}</td>
				<td>${b.bd_quantity}</td>
				<td width="10%">￥${b.bd_cost}</td>
				<td width="10%"><a href="">退款/退货</a></td>
				<td width="15%">交易成功
				</td>
				<td width="16%"><input type="button" value="追加评价" /></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>
