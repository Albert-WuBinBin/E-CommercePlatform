<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 <script src="jslib/jquery.min.js"></script>
    </head>  
<jsp:include page="header.jsp"></jsp:include>
   <div class="container" style="height:500px;">
   	<div style="height:20px;"></div>	
     <ul id="myTab" class="nav nav-tabs">
    	<li class="active"><a href="#home" data-toggle="tab">View Personal Information</a></li>
    	<li><a href="#ios" data-toggle="tab">Modify  Personal Information</a></li>
    	<li><a href="#ios" data-toggle="tab">Change Password</a></li>
    	<li><a href="#ios" data-toggle="tab">Set Secret Security</a></li>
    	<li><a href="#ios" data-toggle="tab">Receipt Address</a></li>
    	<li><a href="#ios" data-toggle="tab">My Order</a></li>
    	<li><a href="setUpShop.jsp" target="ContentFrame">Set up shop</a></li>
    	<li class="dropdown">
       	 	<a href="#" id="myTabDrop1" class="dropdown-toggle"
           		data-toggle="dropdown">Java <b class="caret"></b>
        	</a>
        	<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
            	<li><a href="#jmeter" tabindex="-1" data-toggle="tab">
                    jmeter</a>
            	</li>
            	<li><a href="#ejb" tabindex="-1" data-toggle="tab">
                    ejb</a>
            </li>
        	</ul>
   	 	</li>
	</ul>
	<div id="myTabContent" class="tab-content">
    <div class="tab-pane fade in active" id="home">
        <p>菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
    </div>
    <div class="tab-pane fade" id="ios">
        <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
            TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
    </div>
    <div class="tab-pane fade" id="jmeter">
        <p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
    </div>
    <div class="tab-pane fade" id="ejb">
        <p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
        </p>
    </div>
</div>
  </div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
