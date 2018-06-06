
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="jslib/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        $(function(){
        	$(".pay").click(function(){
        		var orderId=$("#orderId").text();
        		var name=$("#name").val();
        		var password=$("#password").val();
        		
        		var url="confirmPayment";
        		 var args={
        				 "orderId":orderId,
        				 "password":password, 
        				 "name":name,
        				 "time": new Date()
        		 };
        		 $.post(url, args, function (data) {
                     var message = data.message;
                     alert(message);
                     if(message=="支付成功"){
                    	 window.location.href="homePage.jsp" ;
                     }
                 }, "JSON");
        	});
        });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div style="position: relative; left: 100px;height:400px;" >
            <h1>总金额:￥<span class="money"> ${ sessionScope.ShoppingCart.totalMoney}</span></h1>
                <h1>请输入项目名：<input type="text" id="name" /></h1>
                <h1>请输入支付密码：<input type="password" id="password" /> 
                <span id="orderId" style="display: none;">${requestScope.orderId}</span>
                <input class="pay" type="button" value="确认付款"/> </h1>
        </div>
    </body>
</html>
