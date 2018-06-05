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
				<a type="button" class="btn btn-primary" href="exportExcel">下载模版</a>
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
		<div class="tab-pane fade" id="ordermanage">
			<table style="width: 100%; border: 1px black solid;">
				<tr>
					<th width="45%;">宝贝</th>
					<th>单价</th>
					<th>数量</th>
					<th>实付款</th>
					<th>收件人</th>
					<th>交易状况</th>
					<th>交易操作</th>
				</tr>
			</table>
			<sql:setDataSource var="buydetails" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3307/ECommercePlatform" user="root"
				password="123456" />
			<sql:query dataSource="${buydetails}" var="bd">
           		SELECT * FROM buydetails b join product p on b.p_id=p.p_id join shop s on p.s_id=s.s_id where p.s_id='<%=session.getAttribute("s_id")%>' and bd_state='true' 
            </sql:query>
			<c:forEach items="${bd.rows}" var="b">
				<table class="bordered">
					<thead>
						<tr>
							<th width="19%">${b.bd_date}</th>
							<th width="31%">订单号: 2382058165247436</th>
							<th colspan="5"><a href="">${b.s_name}</a></th>
							<th colspan="2"></th>
						</tr>
					</thead>
					<tr>
						<td height="92"><img width="100" height="100"
							src="${b.p_image}" /></td>
						<td width="5%">${b.p_name}</td>
						<td>￥${b.p_price}</td>
						<td width="5%">${b.bd_quantity}</td>
						<td width="10%">￥${b.bd_cost}</td>
						<td width="10%"><input type="button" data-toggle="modal"
								data-target="#checkRA" value="${b.bd_name}"></td>
						<c:if test="${b.bd_delivery eq false && b.bd_state eq true}">
							<td width="15%">未发货<br />
							<td width="15%"><a href="delivery?id=${b.bd_id}"
								onclick="return delivery()">发货</a></td>
						</c:if>
						<c:choose>
							<c:when test="${b.bd_confirm eq true}">
								<td width="15%">买家已收货</td>
								<td width="15%">交易完成</td>
							</c:when>
							<c:when test="${b.bd_delivery eq true && b.bd_state eq true}">
								<td width="15%">已发货</td>
								<td width="15%">已发货</td>
							</c:when>
						</c:choose>

					</tr>
				</table>
				<div class="modal fade" id="checkRA" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">查看收货人</h4>
				</div>

				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">姓名:</label>
							<label class="col-sm-6 control-label">${b.bd_name}</label>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">电话:</label>
							<label class="col-sm-6 control-label">${b.bd_phone}</label>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">地址:</label>
							<label class="col-sm-6 control-label">${b.bd_address}</label>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
			</c:forEach>
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
								class="glyphicon glyphicon-list-alt"></span> 编码<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="code" name="code"
									placeholder="请填写商品编码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 描述<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="describe" name="describe"
									placeholder="请填写商品描述">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 规格型号<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="model" name="model"
									placeholder="请填写商品规格型号">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 单位<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="unit" name="unit"
									placeholder="请填写商品单位">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 未税价格<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="untaxPrice" name="untaxPrice"
									placeholder="请填写商品未税价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 含税价格<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="taxPrice" name="taxPrice"
									placeholder="请填写含税价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 市场价格<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
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
					<h4 class="modal-title" id="myModalLabel">修改商品</h4>
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
								class="glyphicon glyphicon-list-alt"></span> 价格<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="price" name="price"
									placeholder="请填写商品价格">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 库存<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="stock" name="stock"
									placeholder="请填写商品库存">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 品牌<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="brand" name="brand"
									placeholder="请填写商品库存">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 类别<span
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

					<button type="button" class="btn btn-primary btn-add1">保存</button>
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