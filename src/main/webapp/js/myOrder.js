
MyOrder = function(){
	this.viewInfo = $(".viewInfo");
 	this.table = $("table#table");	
 	this.initBtnSearch = function(){
		var self = this;
		self.viewInfo.click(function(event) {
			var orderId = this.id;
			$("table#table").bootstrapTable('refreshOptions', {url:"getBuyDetailsByOrderId?orderId="+orderId,pageNumber:1});
		});
	}
	this.initGrid = function(){
	 	var self = this;
	 	self.table.bootstrapTable({
	 		pageNumber:1,
	 		pageSize:6,
	 		pageList: [20, 30, 50, 100],
	 		columns: [
	 		[
	 		{title: '照片',field: 'product.image',valign: 'middle',formatter:function(value,row,index){
	 			return '<img width="50" height="50" src='+value+'>'
	 		}
	 		},
	 		{title: '名称',field: 'product.name',valign: 'middle',formatter:function(value,row,index){
	 			if(value.length>20){
	 				var val=value.substring(0,20);
		 			var val1=value.substring(21,value.length-1); 
		 			return val+"<br/>"+val1;
	 			}
	 			else{
	 				return value;
	 			}
	 		}},
	 		{title: '单位',field: 'quantity',valign: 'middle'},
	 		{title: '单价',field: 'product.price',valign: 'middle'},
	 		{title: '购买金额',field: 'cost',valign: 'middle'},
	 		{title: '购买日期',field: 'date',valign: 'middle' ,formatter: function (value, row, index) {
	 			 var date = new Date(value);

	 		    var year = date.getFullYear(),
	 		        month = date.getMonth() + 1,//月份是从0开始的
	 		        day = date.getDate(),
	 		        hour = date.getHours(),
	 		        min = date.getMinutes(),
	 		        sec = date.getSeconds();
	 		    var newTime = year + '-' +
	 		                month + '-' +
	 		                day + ' ' +
	 		                hour + ':' +
	 		                min + ':' +
	 		                sec;
	 		    return newTime;         
	 			}
	 		}
	 		]]
	 	});
	 };
	 this.initDocumentEvent = function() {
		 	var self=this;
			$(".btn-add").click(function(){
				var parent=$("#addModal");
				var name=parent.find("#name").val();
				var code=parent.find("#code").val();
				var describe=parent.find("#describe").val();
				var model=parent.find("#model").val();
				var unit=parent.find("#unit").val();
				var untaxPrice=parent.find("#untaxPrice").val();
				var taxPrice=parent.find("#taxPrice").val();
				var price=parent.find("#price").val();
				var ca_id=parent.find("#category").val();
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
						ca_name:ca_name
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
	 }
		
	this.init = function(){
		this.initBtnSearch();
		this.initGrid();
		this.initDocumentEvent();	
	};
	this.init();
}
$(function(){
	new MyOrder();
});