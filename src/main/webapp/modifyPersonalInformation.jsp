
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
            <sql:setDataSource var="user" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3307/ECommercePlatform?serverTimezone=UTC" user="root"
			password="123456" />
		<sql:query dataSource="${user}" var="us">
           		SELECT * FROM user  where u_id='<%=session.getAttribute("id")%>' 
        </sql:query>
        	 <c:forEach  items="${us.rows}" var="u">
        	
                <form class="form-horizontal" action="modifyUser" method="post">
                		
               			 <div class="form-group">
               			 	<label class="col-sm-2">Name:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="name" value="${u.u_name}" />                                                                                                  	      
							</div>
						</div>
						<div class="form-group">
               			 	<label class="col-sm-2">Phone:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="phone" value="${u.u_phone}" />                                                                                                  	     
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">Email:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="email" value="${u.u_email}" />                                                                                              	      
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">Age:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control"  name="age" value="${u.u_age}" />                                                                                          	    
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">Sex:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="sex" value="${u.u_sex}"/>                                                                                     	     
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">Address:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="address" value="${u.u_address}"/>                                                                                	     
							</div>
						</div>
						<div class="form-group" >
               			 	<label class="col-sm-2">IDCart:</label>
							<div class="col-sm-7">
								<input type="text" class="form-control" name="idcart" value="${u.u_idcart}"/>                                                                          	      
							</div>
						</div>
						
						<div class="form-group" >
               			 	<input type="submit" class="btn btn-primary" value="submit"  />
               			 	<input type="reset" class="btn btn-primary" value="reset"/>
						</div>
              
                    
 
                   
                 	  </form>
                    </c:forEach>
              
                  <%
                if (session.getAttribute("modifyMessage") != null) {
                    out.println("<h1 style='color:red;'><center>" + session.getAttribute("modifyMessage") + "</center></h1>");
                    session.removeAttribute("modifyMessage");
                } else;
            %>
            
        </div>
    </body>
</html>