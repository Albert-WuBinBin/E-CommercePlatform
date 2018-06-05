
var dealApply = function(){
	this.btnSearch = $(".btn-search");
	
	
 	this.table = $("table#table");
 	
 	this.initBtnSearch = function(){
		var self = this;
		self.btnSearch.click(function(event) {
	
		self.table.bootstrapTable('refreshOptions', {url:"getShops",pageNumber:1});
		});
	}
	this.initGrid = function(){
	 	var self = this;
	 	self.table.bootstrapTable('destroy').bootstrapTable({
	 		type:"get",
	 		search: true,
	 		strictSearch:false,
	 		searchOnEnterKey:true,
	 		showRefresh:true,
	 		pageNumber:1,
	 		pageSize: 6,
	 		pageList: [20, 30, 50, 100],
	 		columns: [
	 		[
	 		{title: '序号',field: 'rowno',valign: 'middle'
	 		,formatter: function (value,row,index){
	 		 	var options = self.table.bootstrapTable('getOptions');
	 		 	var pageNumber = options.pageNumber;
	 		 	var pageSize = options.pageSize;
	 		 	return index+1;
	 			}
	 		},
	 		{title: 'id',field: 'id',visible:false},
	 		{title: '商店名',field: 'name',valign: 'middle'},
	 		{title: '是否批准',field: 'flag',valign: 'middle',formatter:function(value,index,row){
	 			if(value=="true"){
	 				return "已批准";
	 			}
	 			else if(value=="false"){
	 				return "未批准"
	 			}
	 		}},
	 		{title: '操作',field: 'operate',align: 'center',valign: 'middle',formatter:function(value,row,index){
	 			
	 			var elemClass = "",elemText = "批准";
				if(row.flag=="true"){
					elemClass = "approval";
					elemText = "注销";
				}
				return [
				'<button id="edit" type="button" class="btn btn-primary" style="margin-right:5px">',
				'<span class="glyphicon glyphicon-edit"></span> 修改',
				'</button>',
				'<button id="approval" type="button" class="btn btn-primary '+elemClass+'" style="margin-right:5px">',
				 elemText,
				'</button>',
				'<button id="remove" type="button" class="btn btn-danger">',
				'<span class="glyphicon glyphicon-remove"></span> 删除',
				'</button>'
				].join('');
	 		},events:{
	 			'click #approval' :function(event, value, row, index){
	 				var btnelem = this;
					if ($(btnelem).hasClass('approval')) {
						$.ajax({
							type:"post",
							url:"approval",
							dataType:"json",
							data:{s_id:row.id,flag:"false"},
							success:function(result){
								if(result.msg=="approval"){
									alert("注销成功");
									if ($(btnelem).hasClass("approval")) {
										$(btnelem).removeClass("approval");
										var data=[{id:row.id,name:row.name,flag:"false"}];
										self.table.bootstrapTable('updateRow', {index: index,row: data[0]});
										$(btnelem).text("批准");
									}else{
											
									}
								
								}
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
							}
						});
						
					}
					else{
						$.ajax({
							type:"post",
							url:"approval",
							dataType:"json",
							data:{s_id:row.id,flag:"true"},
							success:function(result){
								if(result.msg=="approval"){
									alert("批准成功");
									if ($(btnelem).hasClass("approval")) {
										
									}else{
										$(btnelem).addClass("approval");
										
										var data=[{id:row.id,name:row.name,flag:"true"}];
										self.table.bootstrapTable('updateRow', {index: index,row: data[0]});
										$(btnelem).text("注销");
									}
								
									
								}
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
							}
						});
						
					}
	 				
					
	 			},
	 			'click #remove' :function(event, value, row, index){	
	 				if (confirm("谨慎操作，删除店铺后，将同时删除商铺内所以的商品。  确定删除该店铺：" + row.name + "吗?") === true) {
	 				$.ajax({
						type:"post",
						url:"deleteShop",
						dataType:"json",
						data:{s_id:row.id},
						success:function(result){
							if(result.msg=="删除成功"){
								alert(result.msg);
								var ids = [];
								ids.push(row.name);
								self.table.bootstrapTable('remove', {field: 'name',values: ids});
							}
							
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
						}
					});}
	 			},
	 			'click #edit' :function(event, value, row, index){
	 				var parent=$("#editModal");
	 				parent.modal("show");
	 				$(".btn-edit").click(function(){
	 					var name=parent.find("#name").val();
	 					var submitData={
	 							id:row.id,
	 							name:name,
	 					};
	 					$.ajax({
	 						type:"post",
	 						url:"editShop",
	 						dataType:"json",
	 						data:submitData,
	 						success:function(result){
	 							if(result.msg=="success"){
	 								alert("修改成功");
	 								parent.modal("hide");
	 								data=[{id:row.id,name:name}];
	 								self.table.bootstrapTable('updateRow', {index: index,row:data[0]});
	 							}
	 							else if(result.msg=="exist"){
	 								alert("该店铺名已存在");
	 							}
	 						},
	 						error: function(XMLHttpRequest, textStatus, errorThrown) {
	 							alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
	 						}
	 					});
	 				});
	 			}
	 			
	 		}}
	 		]]
	 	});
	 };
	 this.initDocumentEvent = function() {
		 	var self=this;
		 	$(".btn-add").click(function(){
				var parent=$("#addModal");
				var name=parent.find("#name").val();
				var submitData={
						name:name,
						flag:"false"
				};
				$.ajax({
					type:"post",
					url:"addShop",
					dataType:"json",
					data:submitData,
					success:function(result){
						if(result.msg=="success"){
							alert("添加成功");
							parent.modal("hide");
							self.table.bootstrapTable('insertRow', {index: 0,row: submitData});
						}
						else if(result.msg=="exist"){
							alert("该店铺名已存在");
						}
					},
					error: function(XMLHttpRequest, textStatus, errorThrown) {
						alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
					}
				});
			});	
	 }
		
	this.init = function(){
		
		this.initBtnSearch();
		this.initGrid();
		this.initDocumentEvent();
		
	};
	this.init();
}


$(function(){
	new dealApply();
	
});