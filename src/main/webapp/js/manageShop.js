
ManageShop = function(){
	this.btnSearch = $(".btn-search");
	
	
 	this.table = $("table#table");
 	
 	this.initBtnSearch = function(){
		var self = this;
		self.btnSearch.click(function(event) {
	
		self.table.bootstrapTable('refreshOptions', {url:"getAllProduct",pageNumber:1});
		});
	}
 	this.cList=new Array;
 	this.getCList=function(){
 		var self=this;
 		$.ajax({
				type:"get",
				async:false,
				url:"getAllCategory",
				dataType:"json",
				success:function(result){
					for(var i=0;i<result.length;i++){
						self.cList.push({id:result[i].id,name:result[i].name});
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
			}
			});	
 		return self.cList;
 	}
	this.initGrid = function(){
	 	var self = this;
	 	self.table.bootstrapTable('destroy').bootstrapTable({
	 		search: true,
	 		strictSearch:false,
	 		searchOnEnterKey:true,
	 		showRefresh:true,
	 		pageNumber:1,
	 		pageSize:6,
	 		pageList: [20, 30, 50, 100],
	 		columns: [
	 		[
//	 		{title: '序号',field: 'rowno',valign: 'middle'
//	 		,formatter: function (value,row,index){
//	 		 	var options = self.table.bootstrapTable('getOptions');
//	 		 	var pageNumber = options.pageNumber;
//	 		 	var pageSize = options.pageSize;
//	 		 	return index+1;
//	 			}
//	 		},
	 		{title: '编码',field: 'code',valign: 'middle'},
	 		{title: '名称',field: 'name',valign: 'middle',formatter:function(value,row,index){
	 			if(value.length>20){
	 				var val=value.substring(0,20);
		 			var val1=value.substring(21,value.length-1); 
		 			return val+"<br/>"+val1;
	 			}
	 			else{
	 				return value;
	 			}
	 		}},
	 		{title: '描述',field: 'describe',valign: 'middle',formatter:function(value,row,index){
	 			var start=0,end=30;
	 			var length=30;
	 			if(value.length>30){
		 			var returnVal="" ;
		 			while(true){
		 				var val=value.substring(start,end);
		 				returnVal = returnVal +val+"<br/>";
		 				if(value.length-1-end<length){
		 					returnVal = returnVal +value.substring(end+1,value.length)+"<br/>" ;
		 					break;
		 				}
		 				start = start + length ;
		 				end = end +length;
		 			}
		 			return returnVal;
	 			}
	 			else{
	 				return value;
	 			}
	 		}},
	 		{title: '规格型号',field: 'model',valign: 'middle'},
	 		{title: '单位',field: 'unit',valign: 'middle'},
	 		{title: '未税价格',field: 'untaxPrice',valign: 'middle'},
	 		{title: '含税价格',field: 'taxPrice',valign: 'middle'},
	 		{title: '市场价格',field: 'price',valign: 'middle'},
//	 		{title: '供应商',field: 'category',valign: 'middle',formatter:function(value,row,index){	
//	 				for(var i=0;i<self.cList.length;i++){
//	 					if(self.cList[i].id==value.id){
//	 						return self.cList[i].name;
//	 						break;
//	 					}
//	 				}
//	 		}},
	 		{title: '供应商',field: 'brand',valign: 'middle'},
	 		{title: '图片',field: 'image',valign: 'middle',formatter:function(value,row,index){
	 					return '<a id="check">'+value+'</a>';
	 		},events:{
	 				'click #check' :function(event, value, row, index){
	 					$("#imageModal").find("#image").attr("src",value);
	 					$("#imageModal").modal("show");
					
	 				}
	 		}},
	 		{title: '操作',field: 'operate',align: 'center',valign: 'middle',formatter:function(value,row,index){
	 			return [
	 			'<button id="upload" type="button" class="btn btn-success" style="margin-right:5px">',
		 		'<span class="glyphicon glyphicon-upload"></span> 上传图片',
		 		'</button>',
		 		'<button id="uploadPDF" type="button" class="btn btn-success" style="margin-right:5px">',
		 		'<span class="glyphicon glyphicon-upload"></span> 上传文档',
		 		'</button>',
	 			'<button id="edit" type="button" class="btn btn-success" style="margin-right:5px">',
	 			'<span class="glyphicon glyphicon-edit"></span> 编辑',
	 			'</button>',
	 			'<button id="remove" type="button" class="btn btn-danger">',
	 			'<span class="glyphicon glyphicon-remove"></span> 删除',
	 			'</button>',
	 			'<div class="btn-group"><button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">',
	 			'下载 &nbsp;<span class="caret"></span>',
	 			'</button>',
	 			'<ul class="dropdown-menu" role="menu">',
	 			'<li><a id="downloadPdf" download="file" href="" type="button">下载</a></li>',
	 			'<li><a id="viewPdf" target="_blank"  href="" type="button">预览</li>',
	 			'</ul></div>'
	 			].join('');
	 		},events:{
	 			'click #upload' :function(event, value, row, index){
	 				$("#p_id").val(row.id);
					$("#uploadModal").modal("show");
					
	 			},
	 			'click #uploadPDF' :function(event, value, row, index){
	 				$("#p_id").val(row.id);
					$("#pdfUploadModal").modal("show");
					
	 			},
	 			'click #downloadPdf' :function(event, value, row, index){
	 				$('#downloadPdf').attr('href','file/'+row.code+".pdf"); 
	 			},
	 			'click #viewPdf' :function(event, value, row, index){
	 				alert(row.code)
	 				$('#viewPdf').attr('href','file/'+row.code+".pdf");
	 			},
	 			'click #edit' :function(event, value, row, index){	 			
					var parent=$("#editModal");
					parent.find("#name").val(row.name);
					parent.find("#code").val(row.code);
					parent.find("#describe").val(row.describe);
					parent.find("#model").val(row.model);
					parent.find("#unit").val(row.unit);				
					parent.find("#untaxPrice").val(row.untaxPrice);
					parent.find("#taxPrice").val(row.taxPrice);
					parent.find("#price").val(row.price);
					parent.find("#category option[value="+row.category.id+"]").attr("selected", "selected");
					parent.modal("show");
					parent.find(".btn-add").click(function(){
						var name= $.trim(parent.find("#name").val());
						if(name==""){
							alert("请输入名字");
							return false;
						}
						var describe= $.trim(parent.find("#describe").val());
						var model= $.trim(parent.find("#model").val());
						var unit= $.trim(parent.find("#unit").val());
						var untaxPrice=$.trim(parent.find("#untaxPrice").val());
						var taxPrice=$.trim(parent.find("#taxPrice").val());
						var price=$.trim(parent.find("#price").val());
						var ca_id=parent.find("#category").val();
						if(ca_id==0){
							alert("请选择一个供应商");
							return false;
						}
						var ca_name = parent.find("#category").find("option:selected").text();
						var submitData={
								id:row.id,
								name:name,
								code:code,
								describe:describe,
								model:model,
								unit:unit,
								untaxPrice:untaxPrice,
								taxPrice:taxPrice,
								price:price,
								ca_id:ca_id,
								ca_name:ca_name,
								brand:ca_name
						};
						$.ajax({
							type:"post",
							url:"editProduct",
							dataType:"json",
							data:submitData,
							success:function(result){
								if(result.msg=="修改成功"){
									alert(result.msg);
									parent.modal("hide");
								
									self.table.bootstrapTable('updateRow', {index: index,row: submitData});
								}
								
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
							}
						});
					});
	 			},
	 			'click #remove' :function(event, value, row, index){	
	 				if (confirm("确定删除该名称：" + row.name + "?") === true) {
	 				$.ajax({
						type:"post",
						url:"deleteProduct",
						dataType:"json",
						data:{id:row.id},
						success:function(result){
							if(result.msg=="删除成功"){
								alert(result.msg);
								var codes = [];
								codes.push(row.code);
								self.table.bootstrapTable('remove', {field: 'code',values: codes});
							}
							
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
						}
					});}
	 			}
	 		}}
	 		]]
	 	});
	 };
	 this.initDocumentEvent = function() {
		 	var self=this;
			$("#addModal").find(".btn-add").click(function(){
				var parent=$("#addModal");
				var name= $.trim(parent.find("#name").val());
				if(name==""){
					alert("请输入名字");
					return false;
				}
				var describe= $.trim(parent.find("#describe").val());
				var model= $.trim(parent.find("#model").val());
				var unit= $.trim(parent.find("#unit").val());
				var untaxPrice=$.trim(parent.find("#untaxPrice").val());
				var taxPrice=$.trim(parent.find("#taxPrice").val());
				var price=$.trim(parent.find("#price").val());
				var ca_id=parent.find("#category").val();
				if(ca_id==0){
					alert("请选择一个供应商");
					return false;
				}
				var ca_name = parent.find("#category").find("option:selected").text();
				var submitData={
						name:name,
						code:code,
						describe:describe,
						model:model,
						unit:unit,
						untaxPrice:untaxPrice,
						taxPrice:taxPrice,
						price:price,
						ca_id:ca_id,
						ca_name:ca_name,
						brand:ca_name
				};
				$.ajax({
					type:"post",
					url:"addProduct",
					dataType:"json",
					data:submitData,
					success:function(result){
						if(result.msg=="添加成功"){
							alert(result.msg);
							parent.modal("hide");
							self.table.bootstrapTable('insertRow', {index: 0,row: submitData});
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
					}
				});
			});
			for(var i=0;i<self.cList.length;i++){
				var option = '<option value="'+self.cList[i].id+'">'+self.cList[i].name+'</option>';
					$("#addModal #category").append(option);
					$("#editModal #category").append(option);
			}
	 }
		
	this.init = function(){
		this.getCList();
		this.initBtnSearch();
		this.initGrid();
		this.initDocumentEvent();	
	};
	this.init();
}
$(function(){
	new ManageShop();
});