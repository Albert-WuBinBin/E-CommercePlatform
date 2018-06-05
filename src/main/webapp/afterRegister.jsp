
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            .div{ width:1500px; height:400px;}
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="div" style=" width:100%; height:400px" >
            <br/><br/><h1 style="text-align: center">Register successful！</h1><br/><br/>
       
          
            <h1 style="text-align: center"><a href="login.jsp">click it to login</a></h1>
   
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
