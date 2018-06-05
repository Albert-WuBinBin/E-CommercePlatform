
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="border: 1px #000000 solid;">
            <a href="myOrder1.jsp">所有订单</a>|
            <a href="myOrder2.jsp">待发货</a>|
            <a href="myOrder3.jsp">待收货</a>|
            <a href="myOrder4.jsp">待评价</a>|
           
        </h1>
        <table style="width: 100%; border: 1px black solid; " >
	<tr>
		<th width="45%;">宝贝</th>
		<th>单价</th>
		<th>数量</th>
		<th>实付款</th>
		<th>商品操作</th>
		<th>交易状况</th>
		<th>交易操作</th>
	</tr>	
	</table>
        <jsp:include page="myOrder22.jsp"></jsp:include>
        <jsp:include page="myOrder33.jsp"></jsp:include>
        <jsp:include page="myOrder44.jsp"></jsp:include>
        <jsp:include page="myOrder55.jsp"></jsp:include>
    </body>
</html>
