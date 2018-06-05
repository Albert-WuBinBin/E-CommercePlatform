
var recharge = function(){
	this.btnSearch = $(".btn-search");
	
	
 	this.table = $("table#table");
 	
 	this.initBtnSearch = function(){
		var self = this;
		self.btnSearch.click(function(event) {
	
		self.table.bootstrapTable('refreshOptions', {url:"recharge",pageNumber:1});
		});
	}
 	this.shopList=new Array;
 	this.getShopList=function(){
 		var self=this;
 		$.ajax({
				type:"get",
				async:false,
				url:"getShops",
				dataType:"json",
				success:function(result){
					for(var i=0;i<result.length;i++){
						self.shopList.push({id:result[i].id,name:result[i].name});
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
			}
			});	
 		return self.shopList;
 	}
	this.queryParams = function(params){
	 		
			var param={
				offset:params.pageNumber-1,
				limit:params.pageSize,
				id:$("#id").val()
			};
			
			
			return param;
		};
	this.initGrid = function(){
	 	var self = this;
	 	self.table.bootstrapTable('destroy').bootstrapTable({
	 		type:"post",
	 		queryParamsType : "undefined",
			queryParams: self.queryParams,
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
	 		 	if(pageNumber==1){
	 		 		return pageSize*(pageNumber-1)+index+1;
	 		 	}
	 		 	else{
	 		 		return index+1;
	 		 	}
	 			}
	 		},
	 		{title: 'ID',field: 'id',align:'center'},
	 		{title: '姓名',field: 'name',align:'center'},
	 		{title: '电话号码',field: 'phone',align:'center'},
	 		{title: '店铺',field: 'shopname',align:'center',formatter: function (value,row,index){
	 		 	var shop = row.shop;
	 		 	if(shop!=null){
	 		 		return shop.name;
	 		 	}
	 		 	else {
	 		 		return "";
	 		 	}
	 		  }
	 		},
	 		{title: '操作',field: 'operate',align: 'center',valign: 'middle',formatter:function(value,row,index){

				return [
				'<button id="edit" type="button" class="btn btn-primary" style="margin-right:5px">',
				'<span class="glyphicon glyphicon-edit"></span> 分配店铺',
				'</button>',
				'<button id="deleteUserShop" type="button" class="btn btn-danger" style="margin-right:5px">',
				'<span class="glyphicon glyphicon-remove"></span> 删除店铺',
				'</button>',
				'<button id="deleteUser" type="button" class="btn btn-danger" style="margin-right:5px">',
				'<span class="glyphicon glyphicon-remove"></span> 删除用户',
				'</button>',
				].join('');
	 			
	 		},events:{
	 			'click #edit' :function(event, value, row, index){
	 				var parent=$("#editModal");
	 				parent.modal("show");
	 				$(".btn-edit").click(function(){
	 					var s_id=parent.find("#shop").val();
	 					var s_name = parent.find("#shop").find("option:selected").text();
	 					if(s_id == 0){
	 						alert("请选择一个店铺");
	 						return false;
	 					}
	 					$.ajax({
	 						type:"post",
	 						url:"allotShop",
	 						dataType:"json",
	 						data:{u_id:row.id,s_id:s_id},
	 						success:function(result){
	 							if(result.msg=="success"){
	 								alert("分配成功");
	 								parent.modal("hide");
	 								var shop = {
	 									name:s_name
	 								}
	 								data=[{id:row.id,name:row.name,phone:row.phone,phone:row.phone,shop:shop}];
	 								self.table.bootstrapTable('updateRow', {index: index,row:data[0]});
	 							}
	 						},
	 						error: function(XMLHttpRequest, textStatus, errorThrown) {
	 							alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
	 						}
	 					});
	 				});
	 		
	 			},
	 			'click #deleteUserShop' :function(event, value, row, index){
	 				if (confirm("确定移除该用户绑定的店铺：" + row.shop.name + "?") === true) {
		 				$.ajax({
							type:"post",
							url:"deleteUserShop",
							dataType:"json",
							data:{id:row.id},
							success:function(result){
								if(result.msg=="success"){
									alert("删除成功");
									var shop = {
		 									name:""
		 								}
									data=[{id:row.id,name:row.name,phone:row.phone,phone:row.phone,shop:shop}];
	 								self.table.bootstrapTable('updateRow', {index: index,row:data[0]});
								}
								
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
							}
						});}
	 			},
	 			'click #deleteUser' :function(event, value, row, index){
	 				if (confirm("确定移除该用户：" + row.id + "?") === true) {
		 				$.ajax({
							type:"post",
							url:"deleteUser",
							dataType:"json",
							data:{id:row.id},
							success:function(result){
								if(result.msg=="success"){
									alert("删除成功");
									var codes = [];
									codes.push(row.id);
									self.table.bootstrapTable('remove', {field: 'id',values: codes});
								}
								
							},
							error: function(XMLHttpRequest, textStatus, errorThrown) {
								alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
							}
						});}
	 			}
	 		}}
	 		]], detailView: true,
	 		detailFormatter:function(index, row){
	 			return ["<p>Email:"+row.email+"&nbsp;&nbsp;&nbsp;&nbsp;Address:"+row.address+"<p>",
	 			       "<p>Age:"+row.age+"&nbsp;&nbsp;&nbsp;&nbsp;Sex:"+row.sex+"<p>",
	 			      "<p>Idcart:"+row.idcart+"&nbsp;&nbsp;&nbsp;&nbsp;Position:"+row.position+"<p>",
	 			        
	 			        ].join('');
	 		}
	 		
	 	});
	 };
	 this.initDocumentEvent = function() {
		 	var self=this;
		 	for(var i=0;i<self.shopList.length;i++){
				var option = '<option value="'+self.shopList[i].id+'">'+self.shopList[i].name+'</option>';
					$("#editModal #shop").append(option);
			}
		 	$(":input[name='id']").change(function () {
                var id = $.trim(this.value);
                var url = "checkID";
                var args = {"id": id, "time": new Date()};
                if(id ==""){
                	$("#checkID").text("请输入账号");
                	return false;
                }  
                $.post(url, args, function (data) {
                    var checkID = data.checkID;
                    $("#checkID").text(checkID);
                }, "JSON");
            });
		 	$(".btn-addUser").click(function(){
				var parent=$("#addUserModal");
				var id=parent.find("#id").val();
				var name=parent.find("#name").val();
				var password=parent.find("#password").val();
				var password1=parent.find("#password1").val();
				var sex=parent.find("#sex").val();
				var age=parent.find("#age").val();
				var phone=parent.find("#phone").val();
				var email=parent.find("#email").val();
				var address=parent.find("#address").val();
				var idcart=parent.find("#idcart").val();
				
				var submitData={
						id:id,
						name:name,
						password:password,
						sex:sex,
						age:age,
						phone:phone,
						email:email,
						address:address,
						idcart:idcart
				};
				$.ajax({
					type:"post",
					url:"addUser",
					dataType:"json",
					data:submitData,
					success:function(result){
						if(result.msg=="success"){
							alert("添加成功");
							parent.modal("hide");
							self.table.bootstrapTable('insertRow', {index: 0,row: submitData});
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
		this.getShopList();
		this.initGrid();
		this.initDocumentEvent();
		
	};
	this.init();
}


$(function(){
	new recharge();
	
});