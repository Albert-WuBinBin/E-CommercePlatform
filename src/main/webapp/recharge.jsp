<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/manageshop.css">
<link rel="stylesheet"
	href="jslib/bootstrap-table-master/dist/bootstrap-table.min.css">
<script type="text/javascript" src="jslib/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="jslib/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script
	src="jslib/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<link href="jslib/fileinput.min.css" rel="stylesheet" />
<script src="jslib/fileinput.min.js" type="text/javascript"></script>
<script src="jslib/zh.js" type="text/javascript"></script>
<script src="js/recharge.js" type="text/javascript"></script>
</head>

<body>

	<div class="container-fluid">
		<h2>人员管理</h2>

		<form class="form-inline" id="searchform" action="ShowAllGoods1">
			<button type="button" class="btn btn-primary  btn-add"
				data-target="#addUserModal" data-toggle="modal">
				<span class="glyphicon glyphicon-plus"></span> 添加用户
			</button>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<label class="control-label">ID</label>
					</div>
					<input type="text" id="id" class="form-control" />
				</div>
			</div>
			<div class="form-group">
				<button type="button" class="btn btn-success  btn-search">
					<span class="glyphicon glyphicon-search"></span> 查 询
				</button>
			</div>
		</form>
		<table id="table" data-striped=true data-pagination=true
			data-locale="zh-CN">
		</table>
	</div>
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">分配店铺</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="" method="post">

						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 店铺<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<select id="shop" name="shop" class="form-control">
									<option value="0">-请选择-</option>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary btn-edit">保存</button>
				</div>

			</div>
		</div>
	</div>
	<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加用户</h4>
				</div>
				<div class="modal-body">
					<form   id="frm" class="form-horizontal" action="register" method="post">
                         <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> ID:*<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text"class="form-control" name="id" id="id" required/>
								<span style="color: red;"  id="checkID"></span>                                                                                               	      
							</div>
						</div>
						  <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 姓名:*<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="name" id="name" required/>                                                                                          	      
							</div>
						</div>
						<div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 密码:*<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="password" id="password" required/>                                                                                    	      
							</div>
						</div>
                         <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 确认密码:*<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="password" class="form-control" name="password1" id="password1" required/>                                                                               	      
							</div>
						</div>
                        <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 性别:
							</label>
							<label class="col-sm-1"></label>
							<label class="radio-inline">
 								<input type="radio"  name="sex"  value="Male" />男
							</label>
							<label class="radio-inline">
							 	<input type="radio"  name="sex" value="Female"/>女
							</label>
						</div>     
                        <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 年龄:
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="age" id="age"/>                                                                          	      
							</div>
						</div>
                        <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 电话:
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="phone" id="phone"/>                                                                          	      
							</div>
						</div>  
                          <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 邮箱:
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="email" id="email"/>                                                                          	      
							</div>
						</div>         
                         <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 地址:
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="address" id="address"/>                                                                          	      
							</div>
						</div>     
                        <div class="form-group">
               			 	<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 身份证:
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" name="idcart" id="idcart"/>                                                                          	      
							</div>
						</div>     
 						<!--  <div class="form-group">
 							<label class="col-sm-2"></label>
               			 	 <input class="btn btn-primary" type="submit" value="register"/>
                             <input type="reset" class="btn btn-primary"  value="reset"/>
                             <input type="hidden" name="money" value="0"/>
                           	 <input type="hidden" name="position" value="User"/>
						</div>   --> 
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary btn-addUser">保存</button>
						</div>
					</form>
				</div>
				<!--  <div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary btn-edit">保存</button>
				</div>
				-->
			</div>
		</div>
	</div>


</body>
</html>