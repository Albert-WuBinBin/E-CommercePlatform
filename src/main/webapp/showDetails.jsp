<%@page import="com.lgeek.app.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<link rel="stylesheet" type="text/css" href="css/fangdajing.css">
<script type="text/javascript"  src="jslib/jquery.min.js"></script>
<script type="text/javascript"  src="jslib/jquery.colorbox-min.js"></script>
<script type="text/javascript"  src="jslib/fangdajing.js"></script>
<script type="text/javascript"  src="js/showDetails.js"></script>
</head>

<body>

	<jsp:include page="header.jsp" />
	<c:forEach items="${product}" var="p">
		<div style="position: relative; left: 150px; top: 100px">
				<img src="${p.image}" height="300" width="300"/>
		</div>

		<div id=""
			style="position: absolute; width: 418px; height: 418px; left: 700px; top: 230px">
			<span id="p_id" style="display: none">${p.id}</span>
			<font size="4" color="black">商品名字: ${p.name} </font><br />	<br /> <br /> 
			<font size="4" color="black"> 商品描述:${p.describe} </font><br /><br/>
			<font size="4" color="black"> 规格型号:${p.model} </font><br /> <br />
			<font size="4" color="black"> 供应商:${p.brand} </font><br /> <br />
			<div id=""
				style="position: relative; top: 30px;">
				<font size="4" color="black"> 未税价:￥${p.untaxPrice} </font><br /> 
				<font size="4" color="black"> 含税价:￥${p.taxPrice} </font><br /> 
				<font size="4" color="black"> 市场价:￥${p.price} </font><br /> 
			</div>
			<div style="position: relative; top: 100px;">
				数量:
				<button type="button" value="Submit" class="btn btn-default"
					style="width: 40px; height: 40px; font-size: 20px;"
					onclick="minus()">-</button>

				<input type="text" name="quantity" id="quantity" value="1"
					style="width: 60px; height: 40px; font-size: 20px; top: 20px;" />
				<button type="button" class="btn btn-default"
					style="width: 40px; height: 40px; font-size: 20px;" onclick="add()">+</button>
			</div>
			<div style="position: relative; top: 200px;">
				<a href=""><button type="submit"
					style="background: #ffcccc; color: #ff3300; width: 120px; height: 50px;">
					立即购买
				</button></a>
				<%
					if (session.getAttribute("username") != null) {
				%>
				<button type="button" id="addToCart"
					style="background: #ff3333; color: #ffffff; width: 120px; height: 50px;">
					加入购物车
				</button>
				<%
					} else {
				%>
				<a href="login.jsp"><button type="submit" onclick="return login()"
					style="background: #ff3333; color: #ffffff; width: 120px; height: 50px;">
					加入购物车
				</button></a>
				<%
					}
				%>
			</div>
		</div>
	</c:forEach>
</body>
</html>
