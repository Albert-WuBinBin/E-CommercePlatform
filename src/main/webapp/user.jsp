<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		 <script type="text/javascript" src="jslib/jquery.min.js"></script>  
    </head>  
    <body style="background-color:beige;">

        <jsp:include page="header.jsp"/>
        <div class="container-fluid">
            <IFRAME  src="nav.jsp" name="NavigationFrame" width="10%" height="800" style="background-color: white;" ></IFRAME>        
            <iframe name="ContentFrame" width="88%" height="800" style="background-color: white;"></iframe>
        </div>
    </body>
</html>
