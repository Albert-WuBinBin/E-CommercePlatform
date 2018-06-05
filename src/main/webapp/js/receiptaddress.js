   $(function(){
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
		   $("#editReceiptAddress #name").change(function(){
			var name=$("#editReceiptAddress #name").val();
			if(name.length==0){
				$("#editReceiptAddress #error1").text("必需字段").css("color","red");
			}
			else{
				$("#editReceiptAddress #error1").text("");
			}
		})
		 $("#editReceiptAddress #phone").change(function(){
			var name=$("#editReceiptAddress #phone").val();
			if(name.length!=11){
				$("#editReceiptAddress #error2").text("请输入正确的手机号码").css("color","red");
			}
			else{
				$("#editReceiptAddress #error2").text("");
			}
		})
		 $("#editReceiptAddress #address").change(function(){
			var name=$("#editReceiptAddress #address").val();
			if(name.length==0){
				$("#editReceiptAddress #error3").text("必需字段").css("color","red");
			}
			else{
				$("#editReceiptAddress #error3").text("");
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
			   
		   })
	   })
	    $(".btn-edit").click(function(){
	       var url=this.href;
	       var name;
	       var phone;
	       var address;
		   $.ajax({
			   type:"get",
			   async:false,
			   url:url,
			   success:function(result){
				   name=result.row[0].name;
				   phone=result.row[0].phone;
				   address=result.row[0].address;
				 
			   },
			   error:function(XMLHttpRequest, textStatus, errorThrown){ 
				   alert(XMLHttpRequest.states);
			   }
			   
		   });
		   var parent=$("#editReceiptAddress");
		   parent.find("#name").val(name);
		   parent.find("#phone").val(phone);
		   parent.find("#address").val(address);
		   parent.modal("show");
		   return false;
	   });
	   $(".btn-save1").click(function(){
		   var parent=$("#editReceiptAddress");
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
		   };
		   $.ajax({
			   type:"post",
			   url:"http://localhost:8080/E-CommercePlatform/editAddress",
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