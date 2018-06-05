
$(function(){
	$(".change").click(function(){
		var p1=$("#p1").val().trim();
		var p2=$("#p2").val().trim();
		var p3=$("#p3").val().trim();
		if(p1.length<=0){
			 alert("Old Password can not be empty!!!");
			 $("#p1").focus();
             return false;
		}
		if(p2.length<=0){
			alert("New Password can not be empty!!!");
			$("#p2").focus();
            return false;
		}
		if(p3.length<=0){
			alert("Confirm Password can not be empty!!!");
			 $("#p3").focus();
            return false;
		}
		if(p2!=p3){
			 alert("The two passwords are not the same");
			 $("#p2").focus();
			 $("#p3").focus();
             return false;
		}
		$.ajax({
			type:"get",
			url:"changePassword",
			dataType:"json",
			data:{p1:p1,p2:p2},
			success:function(result){
				if(result.count==1){
					alert(result.msg);
					parent.location.href="login.jsp";
				}
				else{
					alert(result.msg);
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
			alert("请求错误：" + XMLHttpRequest.status + "\nurl:" + this.url);
		}
		});	
	});
});
