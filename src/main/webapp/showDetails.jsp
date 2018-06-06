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
<title>淘宝</title>
<link rel="stylesheet" type="text/css" href="css/fangdajing.css">
<script type="text/javascript"  src="jslib/jquery.min.js"></script>
<script type="text/javascript"  src="jslib/jquery.colorbox-min.js"></script>
<script type="text/javascript"  src="jslib/fangdajing.js"></script>
</head>
<script>
	function login() {
		var flag = confirm("加入购物车前，需要先登录，是否登录");
		if (flag) {
			var href = this.href;
			window.location.href = href;
			return true;
		}
		return false;
	}
	function minus() {
		var val=$("#quentity").val();
		//var val = window.document.getElementById("quentity").value;
		if (val > 1) {
			val--;
		}
		$("#quentity").val(val);
		//window.document.getElementById("quentity").value = val;
	}
	function add() {
		var val=$("#quentity").val();
		//var val = window.document.getElementById("quentity").value;
		val++;
		$("#quentity").val(val);
		//window.document.getElementById("quentity").value = val;
	}
</script>
<body>

	<jsp:include page="header.jsp" />
	<c:forEach items="${product}" var="p">
		<div style="position: relative; left: 150px; top: 100px">
				<img src="${p.image}" height="300" width="300"/>
		</div>

		<div id=""
			style="position: absolute; width: 418px; height: 418px; left: 700px; top: 230px">
			<font size="4" color="black">商品名字: ${p.name} </font><br />	<br /> <br /> 
			<font size="4" color="black"> 商品描述:${p.describe} </font><br /><br/>
			<font size="4" color="black"> 规格型号:${p.model} </font><br /> 
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

				<input type="text" name="quentity" id="quentity" value="1"
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
				<a href="addToCart?p_id=${p.id}"><button type="submit"
					style="background: #ff3333; color: #ffffff; width: 120px; height: 50px;">
					加入购物车
				</button></a>
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
