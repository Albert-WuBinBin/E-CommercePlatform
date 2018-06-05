
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
        		var money=$(".money").text();
        		var password=$(".password").val();
        	
        		var url="confirmPayment?money="+money+"&password="+password;
        		 var args={ "time": new Date()};
        		 $.post(url, args, function (data) {
                     var message = data.message;
                     alert(message);
                     if(message=="支付成功"){
                    	 window.location.href="afterSubmitOrder1.jsp" ;
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
                
                <h1>请输入支付密码：<input type="password" class="password" /> <input class="pay" type="button" value="确认付款"/> </h1>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
