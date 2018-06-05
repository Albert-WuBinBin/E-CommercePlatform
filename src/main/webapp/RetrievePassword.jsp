<%-- 
    Document   : RetrievePassword
    Created on : 2016-6-26, 21:44:25
    Author     : AlbertPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="jslib/jquery.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
          <div class="container">
            <%
                if (session.getAttribute("RetrieveMessage") != null) {
                    out.println("<h1 style='color:red;'><center>" + session.getAttribute("RetrieveMessage") + "</center></h1>");
                    session.removeAttribute("RetrieveMessage");
                } else;
            %>
            <form class="form-horizontal" action="retrievePassword" method="post">
                <h1 align="center">Retrieve Password</h1>
                 <div class="form-group">
            		<label class="col-sm-2">Enter your id:</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="id"/>
					</div>  
				</div>           
                <div class="form-group">
            		<label class="col-sm-2">Question1:</label>
					<div class="col-sm-4">
						<select name="question1" class="form-control">
	                            <option>What's your mother's name ?</option>
	                            <option>What's your father's name ?</option>
	                            <option>What's your name ?</option>
	                            <option>where are you from?</option>
	                            <option>when is your birthday?</option>
	                            <option>when is your mother's birthday?</option>
	                            <option>when is your father's birthday?</option>
	                            <option>What'your identity card number?</option>  
	                        </select>                                                                                        	      
					</div>
					<div class="col-sm-4">
						<input type='text' name="answer1" class="form-control" required="required"  />
					</div>
				</div>
            	<div class="form-group">
            		<label class="col-sm-2">Question2:</label>
					<div class="col-sm-4">
						<select name="question2" class="form-control">
	                           <option>What's your father's name ?</option>
	                            <option>What's your mother's name ?</option>
	                            <option>What's your name ?</option>
	                            <option>where are you from?</option>
	                            <option>when is your birthday?</option>
	                            <option>when is your mother's birthday?</option>
	                            <option>when is your father's birthday?</option>
	                            <option>What'your identity card number?</option>  
	                        </select>                                                                                        	      
					</div>
					<div class="col-sm-4">
						<input type='text' name="answer2" class="form-control" required="required" />
					</div>
				</div>       
	              <div class="form-group">
	            	<label class="col-sm-2">Question3:</label>
					<div class="col-sm-4">
						<select name="question3" class="form-control">
	                            <option>What's your name ?</option>
	                            <option>What's your mother's name ?</option>
	                            <option>What's your father's name ?</option>
	                            <option>where are you from?</option>
	                            <option>when is your birthday?</option>
	                            <option>when is your mother's birthday?</option>
	                            <option>when is your father's birthday?</option>
	                            <option>What'your identity card number?</option>  
	                        </select>                                                                                        	      
					</div>
					<div class="col-sm-4">
						<input type='text' name="answer3" class="form-control" required="required"  />
					</div>
				</div>       
	             <div class="form-group">
	            	<div class="col-sm-3"></div>
	            	<div class="col-sm-3">
	            		<input type="submit" value="submit" class="btn btn-primary"/>
	            	</div>
	            	<div class="col-sm-3">
	                 	<input type="reset" value="reset" class="btn btn-primary"/>
	                 </div>
	            </div>    	
            </form>  
        </div>
     
    </body>
    
</html>
