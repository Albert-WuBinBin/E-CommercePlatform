<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

<script type="text/javascript" src="jslib/jquery.min.js"></script>
<script type="text/javascript" src="http://www.imooc.com/data/jquery.validate.js"></script>
<script type="text/javascript" src="http://www.imooc.com/data/jquery.validate.messages_cn.js"></script>
<script type="text/javascript" src	="js/checkout.js"></script>
</head>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<form action="submitOrder" method="post">
		<h1 style="position:relative;left: 50px;">确认订单消息</h1>
		<span><input type="hidden" name="length"
			value="${fn:length(sessionScope.ShoppingCart.items)}" /></span>
		<div>
			<table cellspacing="0" class="shop_table cart">
				<thead>
					<tr>
						<th class="product-thumbnail">Image</th>
						<th class="product-name">Product</th>
						<th class="product-price">Price</th>
						<th class="product-quantity">Quantity</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 0;
					%>
					<c:forEach items="${sessionScope.ShoppingCart.items}" var="item">
						<%
							i++;
						%>
						<tr class="cart_item">
							<td class="product-thumbnail"><a href="single-product.html"><img
									width="145" height="145" alt="poster_1_up"
									class="shop_thumbnail" src="${item.product.image}"></a> <span><input
									name="p<%=i%>" type="hidden" value="${item.product.id}" /></span></td>

							<td class="product-name"><a href="single-product.html"
								id="name">${item.product.name}</a> <span><input
									name="name<%=i%>" type="hidden" value="${item.product.name}" /></span>
							</td>

							<td class="product-price"><span class="amount">${item.product.price}</span>
								<span><input name="price<%=i%>" type="hidden"
									value="${item.product.price}" /></span></td>

							<td class="product-quantity"><span class="${item.quantity}"
								size="1" name="${item.product.id }">${item.quantity}</span> <span><input
									name="quantity<%=i%>" type="hidden" value="${item.quantity}" /></span>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div
			style="position: relative; width: 400px; left: 80%;">
			<h1><span id="totalMoney">总金额: ￥ ${ sessionScope.ShoppingCart.totalMoney}</span></h1>
			<h1 style="position: relative; left: 130px;">
				<input type="submit" value="提交订单">
			</h1>
		</div>
	</form>
</body>
</html>
