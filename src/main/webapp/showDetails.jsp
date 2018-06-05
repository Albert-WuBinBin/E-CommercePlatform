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
	<c:forEach items="${details}" var="d">
		<div style="position: relative; left: 150px; top: 100px">
				<img src="${d.image}" height="450" width="450"/>
		</div>

		<div id=""
			style="position: absolute; width: 418px; height: 418px; left: 700px; top: 230px">
			<font size="4" color="black"> ${d.name} </font>

			<div id=""
				style="position: relative; background-color: #ffcccc; top: 50px;">
				<br /> <font size="4" color="red"> 促销价:￥${d.price} </font>
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
				(库存 ${d.stock})
			</div>
			<div style="position: relative; top: 200px;">
				<a href=""><button type="submit"
					style="background: #ffcccc; color: #ff3300; width: 120px; height: 50px;">
					立即购买
				</button></a>
				<%
					if (session.getAttribute("username") != null) {
				%>
				<a href="addToCart?p_id=${d.id}"><button type="submit"
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
