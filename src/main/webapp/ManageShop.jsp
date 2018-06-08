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
<script src="js/manageShop.js" type="text/javascript"></script>
</head>
<script>
	$(function() {
		$("#excelfile").fileinput({
			language : 'zh',
			showPreview : false,
			allowedFileExtensions : [ 'xls', 'xlsx' ],

		});
		$("#imagefile").fileinput({
			language : 'zh',
			allowedFileTypes : [ 'image' ],
			allowedFileExtensions : [ 'jpg', 'jpeg', "png" ],

		});
		$("#pdffile").fileinput({
			language : 'zh'
		});
		$(".btn-submit1").click(function() {
			var file = $("#excelfile").val();
			if (file.length == 0) {
				alert("请选择一个上传文件")
				$("#excelfile").focus();
				return false;
			}
		})
		$(".btn-upload").click(function() {
			var file = $("#imagefile").val();
			if (file.length == 0) {
				alert("请选择一个上传文件")
				$("#imagefile").focus();
				return false;
			}
		})
		$(".btn-pdf-upload").click(function() {
			var file = $("#pdffile").val();
			if (file.length == 0) {
				alert("请选择一个上传文件")
				$("#pdffile").focus();
				return false;
			}
		})
	});
    function delivery(){
             var flag = confirm("确定要发货吗?");
             if (flag) {
             	 alert("发货成功");
                 return true;
                
             }
             return false;
         }
	
</script>
<body>
	<ul class="nav nav-tabs" role="tablist" id="myTab">
		<li role="presentation" class="active"><a href="#shopmanage"
			role="tab" data-toggle="tab">商品管理</a></li>
		<li role="presentation"><a href="#ordermanage" role="tab"
			data-toggle="tab">订单管理</a></li>

	</ul>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="shopmanage">
			<div class="container-fluid">
				<h2>商品批量上传</h2>
				<a type="button" class="btn btn-primary" id="downloadModel" download="product">下载模版</a>
				<form action="importExcel" method="post"
					enctype="multipart/form-data">
					<input type="file" name="file" id="excelfile" class="file-loading" />
					<p style="color: red;">***:只允许上传xls，xlsx两种格式的Excel文件</p>
					<input type="submit" value="上传" class="btn btn-primary btn-submit1" />

				</form>
			</div>
			<div class="container-fluid">
				<h2>商品管理</h2>
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
				<table id="table" data-striped=true data-pagination=true
					data-locale="zh-CN">
				</table>

			</div>
		</div>
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
					<h4 class="modal-title" id="myModalLabel">添加商品</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="addProduct" method="post">

						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 名称<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请填写商品名称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 编码
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="code" name="code"
									placeholder="请填写商品编码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 描述
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="describe" name="describe"
									placeholder="请填写商品描述">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 规格型号
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="model" name="model"
									placeholder="请填写商品规格型号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 单位
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="unit" name="unit"
									placeholder="请填写商品单位">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 未税价格
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="untaxPrice" name="untaxPrice"
									placeholder="请填写商品未税价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 含税价格
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="taxPrice" name="taxPrice"
									placeholder="请填写含税价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 市场价格
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price"
									placeholder="请填写商品市场价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 供应商<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<select id="category" name="category" class="form-control">
									<option value="0">-请选择-</option>
								</select>
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
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加商品</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="addProduct" method="post">

						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 名称<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="请填写商品名称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 编码
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="code" name="code"
									placeholder="请填写商品编码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 描述
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="describe" name="describe"
									placeholder="请填写商品描述">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 规格型号
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="model" name="model"
									placeholder="请填写商品规格型号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 单位
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="unit" name="unit"
									placeholder="请填写商品单位">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 未税价格
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="untaxPrice" name="untaxPrice"
									placeholder="请填写商品未税价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 含税价格
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="taxPrice" name="taxPrice"
									placeholder="请填写含税价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 市场价格
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price"
									placeholder="请填写商品市场价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 供应商<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<select id="category" name="category" class="form-control">
									<option value="0">-请选择-</option>
								</select>
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

	<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传图片</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal" action="uploadfile" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 图片<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">

								<input type="text" name="p_id" style="display: none;" id="p_id" />
								<input type="hidden" name="type" value="1"/>
								<input type="file" id="imagefile" name="file"
									class="file-loading" />
								<p style="color: red;">***:只允许上传jpg,jpeg，png图片
								<p>
									<input type="submit" class="btn btn-primary btn-upload" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="pdfUploadModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">上传文档</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal" action="uploadfile" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 图片<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">

								<input type="text" name="p_id" style="display: none;" id="p_id" />
								<input type="hidden" name="type" value="2"/>
								<input type="file" id="pdffile" name="file"
									class="file-loading" />
								<p style="color: red;">
								<p>
									<input type="submit" class="btn btn-primary btn-pdf-upload" />
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">图片显示</h4>
				</div>

				<div class="modal-body">

					<div class="form-group">
						<img src="" alt="没有图片" id="image">
					</div>

				</div>
			</div>
		</div>
	</div>
	
</body>
</html>