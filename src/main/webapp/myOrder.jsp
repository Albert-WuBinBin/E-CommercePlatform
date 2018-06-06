<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="jslib/bootstrap-table-master/dist/bootstrap-table.min.css">
		<script type="text/javascript" src="jslib/jquery.min.js"></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
		<script src="jslib/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
		<script src="jslib/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
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
        <ul class="nav nav-tabs" role="tablist" id="myTab">
			<li role="presentation" class="active"><a href="#unfinishedOrders"
				role="tab" data-toggle="tab">未完成订单</a></li>
			<li role="presentation"><a href="#finishedOrders" role="tab"
				data-toggle="tab">已完成订单</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="unfinishedOrders">
				<!-- <div class="container-fluid">
					<h2>未完成订单</h2>
					<div class="fixed-table-toolbar">
						<div class="bs-bars pull-left">
							<div id="toolbar">
								<button type="button" class="btn btn-primary" data-toggle="modal"
									data-target="#addModal">
									<span class="glyphicon glyphicon-plus"></span> 创 建
								</button>
								<button type="button" class="btn btn-success  btn-search">
									<span class="glyphicon glyphicon-search"></span> 查 询
								</button>
							</div>
						</div>
					</div>		
				</div>	 -->	
				<div class="container-fluid">
					<table class="bordered">
						<tr>
							<td width="25%">图片</td>
							<td width="20%">名字</td>
							<td width="15%">单位</td>
							<td width="20%">价格</td>
							<td width="20%">日期</td>
						</tr>
					</table>	
					<c:forEach items="${sessionScope.buyDetails}" var="b">
					<table class="bordered">
						<thead>
							<tr>
								<th width="25%">订单号&nbsp;&nbsp; ${b.orderId}</th>	
								<th width="20%">项目名字:${b.projectName}</th>
								<td style="position: relative;left:40%;"><a type="button" class="btn btn-primary" href="exportOrderToExcel?orderId=${b.orderId}">导出</a></td>	
							</tr>
						</thead>
						<c:forEach items="${b.buyDetails}" var="bd">
						<tr>
							<td width="25%"><img width="100" height="100" src="${bd.product.image}"/></td>
							<td width="20%">${bd.product.name}</td>
							<td width="15%">${bd.quantity}</td>
							<td width="20%">${bd.cost}</td>
							<td width="20%"><fmt:formatDate value="${bd.date}" type="both"/> </td>
							<!--  <td width="10%">￥${b.bd_cost}</td>
							<td width="10%"><a href="">退款/退货</a></td>
							<td width="15%">提醒发货<br /> 
							</td>
							<td width="10%"><input onclick="click1()" type="button" value="导出" /></td>-->
							
						</tr>
						</c:forEach>
					</table>
				</c:forEach>
				</div>
			</div>
		</div>
    </body>
    <script type="text/javascript">
    $(function () {

    	$(".btn-search").click(function(){
			$.ajax({
				type:"get",
				url:"unfinishedOrders",
				dataType:"json",
				data:{},
				success:function(result){
					console.log(result.msg);
					alert(result.msg)
					if(result.msg=="success"){
						alert("查询成功");
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
				}
			});
    	});
    	   
    })
    </script>
</html>
