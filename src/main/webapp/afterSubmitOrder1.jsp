
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <%
        session.removeAttribute("ShoppingCart");
        %>
        <div style="position: relative; height:300px; top:30px;" >
            <h1 align="center">你已成功付款</h1>
            <h1 align="center">货物寄送至:<%=session.getAttribute("address")%></h1> 
			 <h1 align="center"><a href="ShowAllGoods">点击这里继续购物</a></h1>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
