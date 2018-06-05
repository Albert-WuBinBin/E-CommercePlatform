<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="jslib/jquery.min.js"></script>  
         <!-- Bootstrap -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
		<script type="text/javascript" src="http://www.imooc.com/data/jquery.validate.js"></script>
		<script type="text/javascript" src="http://www.imooc.com/data/jquery.validate.messages_cn.js"></script>
		<script type="text/javascript" src	="js/receiptaddress.js"></script>
        <script>
            function deleteAddress(){
                var flag = confirm("确定要删除该地址吗吗?");
                if (flag) {
                	 alert("删除成功");
                    return true;
                   
                }
                return false;
            } 
        </script>


    </head>

    <body>
        <sql:setDataSource var="receiptaddress" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3307/ECommercePlatform?serverTimezone=UTC" user="root"
		password="123456" />
		<sql:query dataSource="${receiptaddress}" var="rp">
           		select * from receiptaddress where u_id='<%=session.getAttribute("id") %>' 
     	</sql:query>
    
            <div style="position: relative;  width: 100%; height:auto;" >

                <div>
                    <br/><br/><br/><h1>收货地址</h1><br/>
                    <table>            
                        <c:forEach items="${rp.rows}" var="r"> 
                            <tr>
                                <td>
                                    ${r.ra_address} &nbsp;(${r.ra_name})&nbsp;${r.ra_phone} 
                                </td>
                                <td><a class="btn btn-primary" href="deleteAddress?ra_id=${r.ra_id}" onclick="return deleteAddress()">delete</a></td>
                                <td><a class="btn btn-primary btn-edit" href="getAddressById?ra_id=${r.ra_id}">modify</a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td><button id="btn_add" type="button" class="btn btn-default"
								data-toggle="modal" data-target="#AddReceiptAddress">添加新的收货地址</button></td>
                        </tr>
                    </table>
                    <hr>
                </div>
            </div>
           
       <div class="modal fade" id="AddReceiptAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h1>添加新地址</h1>
				</div>
				<form class="form-horizontal"  method="post" id="form1">
				<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-md-2">
							<span class="glyphicon glyphicon-star" style="color:red;"></span>
							Name:</label>
							<div class="col-md-6">
								<input type="text" id="name" name="name" class="form-control"  />
							</div>
							<div class="col-md-3">
								<span id="error1"></span>
							</div>
						</div>
						<div class="form-group">
							
							<label class="control-label col-md-2">
							<span class="glyphicon glyphicon-star" style="color:red;"></span>
							Phone:</label>
							<div class="col-md-6">
								 <input type="text" class="form-control" name="phone" id="phone" />
							</div>
							<div class="col-md-3">
								<span id="error2"></span>
							</div>
						</div>
						<div class="form-group">
							
							<label class="control-label col-md-2">
							<span class="glyphicon glyphicon-star" style="color:red;"></span>
							Address:</label>
							<div class="col-md-6">
								<input type="text" id="address" name="address"  class="form-control"  />
								
							</div>
							  <div class="col-md-3">
								<span id="error3"></span>
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					
					<input type="button"  class="btn btn-primary btn-save"  value="保存">
  
				</div>
				</form>
			</div>
			
		</div>
	</div>
	<div class="modal fade" id="editReceiptAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h1>修改地址</h1>
				</div>
				<form class="form-horizontal"  method="post" id="form2">
				<div class="modal-body">
						<div class="form-group">
							<label class="control-label col-md-2">
							<span class="glyphicon glyphicon-star" style="color:red;"></span>
							Name:</label>
							<div class="col-md-6">
								<input type="text" id="name" name="name" class="form-control"  />
							</div>
							<div class="col-md-3">
								<span id="error1"></span>
							</div>
						</div>
						<div class="form-group">
							
							<label class="control-label col-md-2">
							<span class="glyphicon glyphicon-star" style="color:red;"></span>
							Phone:</label>
							<div class="col-md-6">
								 <input type="text" class="form-control" name="phone" id="phone" />
							</div>
							<div class="col-md-3">
								<span id="error2"></span>
							</div>
						</div>
						<div class="form-group">
							
							<label class="control-label col-md-2">
							<span class="glyphicon glyphicon-star" style="color:red;"></span>
							Address:</label>
							<div class="col-md-6">
								<input type="text" id="address" name="address"  class="form-control"  />
								
							</div>
							  <div class="col-md-3">
								<span id="error3"></span>
							</div>
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					
					<input type="button"  class="btn btn-primary btn-save1"  value="保存">
  
				</div>
				</form>
			</div>
			
		</div>
	</div>
     
    </body>
</html>
