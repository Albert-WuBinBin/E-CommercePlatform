
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify Personal Information</title>
        <script src="jslib/jquery.min.js" type="text/javascript"></script>
         <script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container" style="position:relative;top:30px;">
                <form class="form-horizontal" action="modifyUser" method="post">
                		
               			 <div class="form-group">
               			 	<label class="col-sm-2">姓名:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name" value="${sessionScope.user.name}" />                                                                                                  	      
							</div>
						</div>
						<div class="form-group">
               			 	<label class="col-sm-2">电话:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="phone" value="${sessionScope.user.phone}" />                                                                                                  	     
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">邮箱:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="email" value="${sessionScope.user.email}" />                                                                                              	      
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">年龄:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control"  name="age" value="${sessionScope.user.age}" />                                                                                          	    
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">性别:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="sex" value="${sessionScope.user.sex}"/>                                                                                     	     
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">地址:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="address" value="${sessionScope.user.address}"/>                                                                                	     
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">身份证:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="idcart" value="${sessionScope.user.idcart}"/>                                                                          	      
							</div>
						</div>
						
						<div class="form-group" >
               			 	<input type="submit" class="btn btn-primary" value="提交"  />
               			 	<input type="reset" class="btn btn-primary" value="重置"/>
						</div>
                 	  </form>
                  <%
                if (session.getAttribute("modifyMessage") != null) {
                    out.println("<h1 style='color:red;'><center>" + session.getAttribute("modifyMessage") + "</center></h1>");
                    session.removeAttribute("modifyMessage");
                } else;
            %>
            
        </div>
    </body>
</html>