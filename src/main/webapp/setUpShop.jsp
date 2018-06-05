<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script type="text/javascript" src="jslib/jquery.min.js"></script>
    </head>
    <body>
    	
    	 <div class="container">
    	<c:if test="${sessionScope.shop==null}">
	      
    	
    	  <div style="position: relative;left:50px; top:50px;">
	           <h2>无店铺信息,需要开店的话,请联系。。。</h2>
	       </div>
	       </c:if>
        <c:if test="${sessionScope.shop.flag==false}">
	      
	        <div style="position: relative;left:50px; top:50px;">
	           <form class="form-horizontal" >
							<div class="form-group">
								<label class="col-sm-3 control-label"> 请输入商店名字:<span
									class="glyphicon glyphicon-star" style="color: red;"></span>
								</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="shopname" name="shopname"
									 value="${sessionScope.shop.name}" disabled >
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-5 control-label"><p>注：审核需要1-3个工作日，请耐心等待</p></label>
							</div>
							
							
	        	</form>
	       </div>
        </c:if>
        <c:if test="${sessionScope.shop.flag==true}">
             	 <h1>你已经拥有自己的店铺了，<a href="ManageShop.jsp">点击这个去自己的店铺</a></h1>
        </c:if>
      
        </div>
       
    </body>
</html>
