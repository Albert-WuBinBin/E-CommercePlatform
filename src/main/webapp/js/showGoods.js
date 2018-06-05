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