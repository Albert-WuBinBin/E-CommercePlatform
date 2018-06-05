<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header Page</title>
        <!--  <script src="jslib/jquery.min.js"></script>-->
		 <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

          <!-- Bootstrap -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		
        <!--jQuery sticky menu -->
        <script src="jslib/owl.carousel.min.js"></script>
        <script src="jslib/jquery.sticky.js"></script>

        <!--jQuery easing -->
        <script src="jslib/jquery.easing.1.3.min.js"></script>


        <script src="jslib/main.js"></script>
        
        
        <script>
            $(function () {
                $("#login").click(function () {
                    var flag = confirm("查看购物车前，需要先登录，是否登录");
                    if (flag) {
                        var href = this.href;
                        window.location.href = href;

                        return true;
                    }
                    return false;
                });
            });
        </script>
    </head>
    <body>
        <div class="header-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="user-menu">
                            <ul>
                                <%
                                    if (session.getAttribute("username") != null) {
                                %>
                                <li style="color: red;"><a href="user.jsp"><span class="glyphicon glyphicon-user">Hello !!!<%=session.getAttribute("username")%></span></a></li>
                            
                                <li><a href="logout"><span class="glyphicon glyphicon-log-out" >Logout</span></a></li>
                                    <%
                                    } else {
                                    %>
                                <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in" >Login</span></a></li>
                                    <%
                                        }
                                    %>
                               
                            </ul>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="header-right">
                            <ul class="list-unstyled list-inline">
                                <li><a href="homePage.jsp"><span class="glyphicon glyphicon-home">HomePage</span></a></li>
                                    <%
                                        if (session.getAttribute("username") != null) {
                                    %>
                                <li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart">My Cart</span></a></li>
                                    <%
                                    } else {
                                    %>
                                <li><a id="login" href="login.jsp"><span class="glyphicon glyphicon-shopping-cart">My Cart</span></a></li>
                                    <%
                                        }
                                    %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End header area -->

        <!--  <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6" >
                        <div class="logo">
                            <h1><a href="homePage.jsp"><span>E-Commerce Platform</span></a></h1>
                        </div>
                    </div>


                </div>
            </div>
        </div>  End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div> 
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="homePage.jsp">Home</a></li>
                            <li><a href="ShowAllGoods">Shop page</a></li>
                            <li><a href="cart.jsp">Cart</a></li>
                        </ul>
                    </div>  
                </div>
            </div>
        </div>
    </body>
</html>
