 $(function () {
   
	   var cList=getCList();
	   for(var i=0;i<cList.length;i++){
			var option = '<option value="'+cList[i].id+'">'+cList[i].name+'</option>';
				$("#searchform #category").append(option);
				
		};
		
		$("#searchform #category option[value="+$("#ca_id").val()+"]").attr("selected", "selected");
		if($("#searchform #max").val()!="null"){
			$("#searchform #maxprice").val($("#searchform #max").val());
		}
		if($("#searchform #min").val()!="null"){
			$("#searchform #minprice").val($("#searchform #min").val());
		}
		if($("#searchform #t").val()!="null"){
			$("#searchform #searchtext").val($("#searchform #t").val());
		}
		$("#searchform #category").change(function(){
			var val=$("#searchform #category").val();
			if(val!=0){
				var href = "ShowAllGoods?ca_id="+ val;
				 window.location.href = href;
			}
			if(val==0){
				var href = "ShowAllGoods";
				 window.location.href = href;
			}
		});
	 	$(".btn-search").click(function(){
	 		var max=$("#searchform #maxprice").val();
	 		var min=$("#searchform #minprice").val();
	 		if(max==""){
	 			max=0;
	 		}
	 		if(min==""){
	 			min=0;
	 		}
	 	
	 		var searchtext=$("#searchform #searchtext").val();
	 		var ca_id=$("#searchform #category").val();
	 		var flag = false;
	        var reg = /^\d+$/g; 
	        if (reg.test(max)||reg.test(min)) {
	        	 flag = true;
	        	max=parseInt(max);
	        	min=parseInt(min);
	        	var href = "ShowAllGoods?ca_id="+ ca_id+"&max="+max+"&min="+min+"&searchtext="+searchtext;
				window.location.href = href;
	         }
	        if (!flag) {
	            alert("价格必需为整数");
	            $(this).val("");
	            return;
	         }
	 	});
	 	 $("#pageNo").change(function () {
 	        var val = $(this).val();
 	        val = $.trim(val);
 	        var flag = false;
 	        var reg = /^\d+$/g;
 	        var pageNo = 0;

 	        if (reg.test(val)) {
 	           pageNo = parseInt(val);
 	           if (pageNo >= 1 && pageNo <= parseInt("${productPage.totalPageNumber }")) {
 	                 flag = true;
 	            }
 	        }
 	        if (!flag) {
 	           alert("The input is not a valid number.");
 	           $(this).val("");
 	           return;
 	        }
 	       	var href = "ShowAllGoods?pageNo=" + pageNo;
 	        window.location.href = href;
 	     });
 	 $(".addToCart").click(function(){
 		 $("#p_id").text(this.id);
 	 })
 	 $(".btn-add").click(function(){
 		 var parent = $("#addModal");
 		 var p_id =  parent.find("#p_id").text();
 		 var quantity = parent.find("#quantity").val();
 		 var reg = /^\d+$/g;
 		 if(!reg.test(quantity)){
 			 alert("请输入正确的数字");
 			 return false;
 		 }
 		 var submitData={
					p_id:p_id,
					quantity:quantity
			 }
 		 $.ajax({
 				type:"post",
 				url:"addToCart",
 				dataType:"json",
 				data:submitData,
 				success:function(result){
 					if(result.msg=="success"){
 						alert("添加成功");
 						$("#addModal").modal("hide");
 					}
 				},
 				error: function(XMLHttpRequest, textStatus, errorThrown) {
 				alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
 			}
 			});	    	
 		 });
});
function getCList(){
	 	var cList=new Array;
		$.ajax({
				type:"get",
				async:false,
				url:"getAllCategory",
				dataType:"json",
				success:function(result){
					for(var i=0;i<result.length;i++){
						cList.push({id:result[i].id,name:result[i].name});
					}
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
				alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
			}
			});	
		return cList;
	}
function login() {
	var flag = confirm("加入购物车前，需要先登录，是否登录");
	if (flag) {
		var href = this.href;
		window.location.href = href;
		return true;
	}
	return false;
}