<%-- 
    Document   : changePassword
    Created on : 2016-6-24, 15:17:27
    Author     : AlbertPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="jslib/jquery.min.js" type="text/javascript"></script>
        <script src="js/changePssword.js" type="text/javascript"></script>
         <script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <script>
            
        </script>
    </head>
    <body>
    	<div class="container">
        <form class="form-horizontal" id="changePassword">
            <h1><center>Change Password</center></h1>
           	<div class="form-group">
            	<label class="col-sm-3">Password:*</label>
				<div class="col-sm-6">
					<input type="password" id="p1" class="form-control" />                                                                                            	      
				</div>
			</div>
             <div class="form-group">
            	<label class="col-sm-3">New Password:*</label>
				<div class="col-sm-6">
					<input type="password" id="p2" class="form-control" />                                                                                            	      
				</div>
			</div>          
            <div class="form-group">
            	<label class="col-sm-3">Confirm the new password:</label>
				<div class="col-sm-6">
					<input type="password" id="p3" class="form-control"/>                                                                                            	      
				</div>
			</div>               
            <div class="form-group">
            	<div class="col-sm-3"></div>
            	<div class="col-sm-3">
            		<input type="button" class="btn btn-primary change" value="submit" />
            	</div>
            	<div class="col-sm-3">
                	<input type="reset"  class="btn btn-primary"  value="reset"/>
                </div>
            </div>      
                    
        </form>
          <%
                if (session.getAttribute("ChangeMessage") != null) {
                    out.println("<h1 style='color:red;'><center >" + session.getAttribute("ChangeMessage") + "</center></h1>");
                    session.removeAttribute("ChangeMessage");
                } else;
            %>
            </div>
    </body>
</html>
