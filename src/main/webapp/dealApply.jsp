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
<link rel="stylesheet" href="jslib/bootstrap-table-master/dist/bootstrap-table.min.css">
<script type="text/javascript" src="jslib/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="jslib/bootstrap-table-master/dist/bootstrap-table.min.js"></script>
<script src="jslib/bootstrap-table-master/dist/locale/bootstrap-table-zh-CN.min.js"></script>
<link href="jslib/fileinput.min.css" rel="stylesheet" />
<script src="jslib/fileinput.min.js" type="text/javascript"></script>
<script src="jslib/zh.js" type="text/javascript"></script>
<script src="js/dealApply.js" type="text/javascript"></script>
</head>

<body>

			<div class="container-fluid">
				<h2>店铺管理</h2>
					<div class="fixed-table-toolbar">
					<div class="bs-bars pull-left">
						<div id="toolbar">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#addModal">
								<span class="glyphicon glyphicon-plus"></span> 创 建
							</button>
							<button type="button" class="btn btn-success  btn-search">
								<span class="glyphicon glyphicon-search"></span> 查 询
							</button>
						</div>
					</div>
				</div>
							
						
				
				<table id="table" 
					data-striped=true 
					data-pagination=true
					data-locale="zh-CN">
				</table>

			</div>
		
		
				
	<!-- 添加模态框 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加店铺</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="addShop" method="post">

						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 店铺名称<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请填写店铺名称">
							</div>
						</div>
						
					</form>
				</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary btn-add">保存</button>
				</div>
			</div>
		</div>
	</div>
		<!-- 添加模态框 -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改店铺</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="addShop" method="post">

						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 店铺名称<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请填写店铺名称">
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
	
</body>
</html>