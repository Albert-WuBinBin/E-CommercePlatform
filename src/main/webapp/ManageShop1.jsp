<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="jslib/jquery.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
        <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
        <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
        <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>     
        <title>JSP Page</title>
        
        <script >
       
            function showAddress(){
                $('#dlg').dialog('open').dialog('center').dialog('setTitle', '收件人详情');
                $('#fm').form('clear');

            }
       
           function delivery(){
                    var flag = confirm("确定要发货吗?");
                    if (flag) {
                    	 alert("发货成功");
                        return true;
                       
                    }
                    return false;
                }
                
            
        
        </script>
</head>
<style>
body {
	width:100%;
	margin: 20px auto;
	font-family: 'trebuchet MS', 'Lucida sans', Arial;
	font-size: 12px;
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
        <table style="width: 100%; border: 1px black solid; " >
	<tr>
		<th width="45%;">宝贝</th>
		<th>单价</th>
		<th>数量</th>
		<th>实付款</th>
		<th>收件人</th>
		<th>交易状况</th>
		<th>交易操作</th>
	</tr>
	</table>
   <sql:setDataSource var="buydetails" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql:///ECommercePlatform?serverTimezone=UTC" user="root"
		password="123456" />
	<sql:query dataSource="${buydetails}" var="bd">
           		SELECT * FROM buydetails b join product p on b.p_id=p.p_id join shop s on p.s_id=s.s_id where p.s_id='<%=session.getAttribute("s_id")%>' and bd_state='true' 
            </sql:query>
	<c:forEach items="${bd.rows}" var="b">
		<table class="bordered">
			<thead>
				<tr>
					<th width="19%">${b.bd_date}</th>
					<th width="31%">订单号: 2382058165247436</th>
					<th colspan="5"><a href="">${b.s_name}</a></th>
					<th colspan="2"></th>
				</tr>
			</thead>
			<tr>
				<td height="92"><img width="100" height="100"
					src="${b.p_image}" /></td>
				<td width="5%">${b.p_name}</td>
				<td>￥${b.p_price}</td>
				<td width="5%">${b.bd_quantity}</td>
				<td width="10%">￥${b.bd_cost}</td>
				<td width="10%"><input type="button" onclick="showAddress()"  value="${b.bd_name}"></td>
				<c:if test="${b.bd_delivery eq false && b.bd_state eq true}">
				<td width="15%">未发货<br /> 
				<td width="15%"><a href="delivery?id=${b.bd_id}" onclick="return delivery()">发货</a></td>
				</c:if>
				<c:choose>
					<c:when test="${b.bd_confirm eq true}">
					<td width="15%">买家已收货</td>
					<td width="15%">交易完成</td>
					</c:when>
					<c:when test="${b.bd_delivery eq true && b.bd_state eq true}">
						<td width="15%">已发货</td>
						<td width="15%">已发货</td>
					</c:when>
				</c:choose>

			</tr>
		</table>
		    <div id="dlg" class="easyui-dialog" style="width:400px"
             closed="true" buttons="#dlg-buttons">
            <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
                <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">收件人信息</div>
                <div style="margin-bottom:10px">
                    Name:${b.bd_name}
                </div>
                <div style="margin-bottom:10px">
                    Address:${b.bd_address}
                </div>
                <div style="margin-bottom:10px">
                Phone:${b.bd_phone}  
                </div>
            </form>
        </div>
	</c:forEach>

       
</body>
</html>


