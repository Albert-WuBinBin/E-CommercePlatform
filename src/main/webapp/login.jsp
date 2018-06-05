
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<script src="jslib/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="http://www.imooc.com/data/jquery.validate.js"></script>
		<script type="text/javascript" src="http://www.imooc.com/data/jquery.validate.messages_cn.js"></script>
		<script src="js/login.js" type="text/javascript"></script>
    </head>
    <style>
    label.error {
  color: #EA5200;
}
    </style>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="single-slide">
                    <div class="slide-bg slide-one"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <form action="login" id="loginForm"  method="post" class="form-horizontal" >  
                                                <h3>Login Form</h3>
                                                <table style="height: 400px;">
                                                	<tr>
                                                		<td style="color:red;" colspan="2">
                                                		<%	
                                                		if(session.getAttribute("loginError")!=null)
                                                			out.print(session.getAttribute("loginError"));
                                                			session.removeAttribute("loginError");
                                                		%>
                                                		
                                                		</td>
                                                	</tr>
                                                    <tr>
                                                        <td>ID:</td>
                                                        <td style="color:black;"><input type="text" id="id" name="id" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Password:</td>
                                                        <td style="color:black;"> <input type="password" id="password" name="password"  /></td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td><input type="radio" name="radio"  value="User" checked />User</td>
                                                        <td><input type="radio" name="radio" value="Manager"/>Manager</td>
                                                    </tr>
                                                    <tr style="color:black;">
                                                        <td><input type="submit" class="btn btn-primary btn-lg" value="login"/></td>
                                                        <td><input type="reset" class="btn btn-primary btn-lg"  value="reset"/></td>
                                                        <td><a href="RetrievePassword.jsp">If you forget your password, you can click here to go back</a></td>
                                                    </tr>
                                                </table>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="promo-area">
            
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo">
                            <i class="fa fa-refresh"></i>
                            <p>30 Days return</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo">
                            <i class="fa fa-truck"></i>
                            <p>Free shipping</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo">
                            <i class="fa fa-lock"></i>
                            <p>Secure payments</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="single-promo">
                            <i class="fa fa-gift"></i>
                            <p>New products</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>
