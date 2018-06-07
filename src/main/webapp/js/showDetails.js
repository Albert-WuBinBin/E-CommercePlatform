$(function(){
	$("#addToCart").click(function(){
		var quantity=$("#quantity").val();
		var p_id = $("#p_id").text();
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
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
		}
		});	
	})
})
function login() {
		var flag = confirm("加入购物车前，需要先登录，是否登录");
		if (flag) {
			var href = this.href;
			window.location.href = href;
			return true;
		}
		return false;
	}
	function minus() {
		var val=$("#quantity").val();
		if (val > 1) {
			val--;
		}
		$("#quantity").val(val);
	}
	function add() {
		var val=$("#quantity").val();
		val++;
		$("#quantity").val(val);
	}