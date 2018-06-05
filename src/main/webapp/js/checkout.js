   $(function(){
//	   $("#form1").validate({
//		    rules: {
//		      name: "required",
//		      address: "required",
//		      phone: {
//		        required: true,
//		        minlength: 11,
//		        maxlength: 11
//		      }
//		    }
//	   });
//	  
//	   $.extend($.validator.messages, {
//		    required: "必选字段",
//		    maxlength: $.validator.format("请输入正确的手机号码"),
//		    minlength: $.validator.format("请输入正确的手机号码"),
//	   });
	  
	    $("#AddReceiptAddress #name").change(function(){
			var name=$("#AddReceiptAddress #name").val();
			if(name.length==0){
				$("#AddReceiptAddress #error1").text("必需字段").css("color","red");
			}
			else{
				$("#AddReceiptAddress #error1").text("");
			}
		})
		 $("#AddReceiptAddress #phone").change(function(){
			var name=$("#AddReceiptAddress #phone").val();
			if(name.length!=11){
				$("#AddReceiptAddress #error2").text("请输入正确的手机号码").css("color","red");
			}
			else{
				$("#AddReceiptAddress #error2").text("");
			}
		})
		 $("#AddReceiptAddress #address").change(function(){
			var name=$("#AddReceiptAddress #address").val();
			if(name.length==0){
				$("#AddReceiptAddress #error3").text("必需字段").css("color","red");
			}
			else{
				$("#AddReceiptAddress #error3").text("");
			}
		})
	   $(".btn-save").click(function(){
		   var parent=$("#AddReceiptAddress");
		  
		   var name=parent.find("#name").val();
		   var phone=parent.find("#phone").val();
		   var address=parent.find("#address").val();
		   if(name.length==0){
			   parent.find("#error1").text("必需字段").css("color","red");
			   parent.find("#name").focus();
			   return false;
		   }
		   if(phone.length!=11){
			   parent.find("#error2").text("请输入正确的手机号码").css("color","red");
			   parent.find("#phone").focus();
			   return false;
		   }
		   if(address.length==0){
			   parent.find("#error3").text("必需字段").css("color","red");
			   parent.find("#address").focus();
			   return false;
		   }
		   var submitData={
				   name:name,
				   phone:phone,
				   address:address
		   }
		   $.ajax({
			   type:"get",
			   url:"http://localhost:8080/E-CommercePlatform/newAddress",
			   dataType:"json",
			   data:submitData,
			   success:function(result){
				   alert(result.msg);
				   parent.modal("hide");
				   window.location.reload();
			   },
			   error:function(XMLHttpRequest, textStatus, errorThrown){ 
				   alert(XMLHttpRequest.states);
			   }
			   
		   });
	   });
	    
	   
   });