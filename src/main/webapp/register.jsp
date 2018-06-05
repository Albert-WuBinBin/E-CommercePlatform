<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        
        <style type="text/css">
            #frm label.error {
                color: Red;
            }
        </style>
         <script type="text/javascript" src="jslib/jquery.min.js"></script>
         <script type="text/javascript" src="jslib/jquery.validate.js"></script>
        <script type="text/javascript" src="jslib/jquery.metadata.js"></script>
        <script type="text/javascript" src="jslib/messages_zh.js"></script>
        <script >

            $(document).ready(function () {
                $(":input[name='id']").change(function () {
                    var id = $.trim(this.value);
                    var url = "checkID";
                    var args = {"id": id, "time": new Date()};

                    $.post(url, args, function (data) {
                        var checkID = data.checkID;
                        $("#checkID").text(checkID);
                    }, "JSON");
                });

                jQuery.validator.addMethod("byteMaxLength", function (value,
                        element, param) {
                    var length = value.length;
                    for (var i = 0; i < value.length; i++) {
                        if (value.charCodeAt(i) > 127) {
                            length++;
                        }
                    }
                    return this.optional(element) || (length <= param);
                }, $.validator.format("不能超过{0}个字节(一个中文字算2个字节)"));
                jQuery.validator.addMethod("numFormat", function (value, element, param) {
                    return this.optional(element) || /^\d*$/.test(value);
                }, $.validator.format("请输入数字{0}位以内")
                        );
                //验证id
                jQuery.validator.addMethod("idVal", function (value, element, param) {
                    return this.optional(element) || /^u\d{5}(?!\d)$/.test(value);
                }, $.validator.format("请输入以u开头的，后面跟5个数字")
                        );
                //验证name
                jQuery.validator.addMethod("valiEnglish", function (value, element) {
                    return this.optional(element) || /^[a-zA-Z ]*$/.test(value);
                }, $.validator.format("请输入字母或者空格")
                        );
                //验证age
                 jQuery.validator.addMethod("ageVal", function (value, element) {
                    return this.optional(element) || /^([1-9][0-9])$/.test(value);
                }, $.validator.format("请输入正确的年龄,范围为（10,99）")
                        );
                //验证phone
                jQuery.validator.addMethod("phoneVal", function (value, element) {
                    return this.optional(element) || /^1\d{10}$/.test(value);
                }, $.validator.format("请输入正确的电话号码")
                        );
                //验证email
                jQuery.validator.addMethod("emailVal", function (value, element) {
                    return this.optional(element) || /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/.test(value);
                }, $.validator.format("请输入正确的邮箱")
                        );
                //验证idCard
                jQuery.validator.addMethod("sfzhValidate", function (value, element) {
                    return this.optional(element) || /^(\d{14}|\d{17})(\d|[xX])$/.test(value);
                }, $.validator.format("请输入合法身份证号")
                        );
                $("#frm").validate();
                check_infor();
            });
            function check_infor() {
                $("#id").attr("class", "{byteMaxLength:6,idVal:true}");
                $("#username").attr("class", "{byteMaxLength:22,valiEnglish:true}");
                $("#age").attr("class", "{byteMaxLength:3,ageVal:true}");
                $("#phone").attr("class", "{byteMaxLength:11,phoneVal:true}");
                $("#email").attr("class", "{byteMaxLength:20,emailVal:true}");
                $("#address").attr("class", "{byteMaxLength:22,valiEnglish:true}");
                $("#idcart").attr("class", "{sfzhValidate:true}");
            }
            function checkForm() {
                if (document.frm.password.value != document.frm.password1.value) {
                    alert("The two passwords are not the same");
                    return false;
                }
                else {
                    return true;
                }
            }


        </script>
       
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="single-product-area">
            
            <div class="container">
                <div class="row">
                    <form id="frm" class="form-horizontal"  name="frm"  method="post" action="register" onsubmit="return checkForm()" style="position: relative;
                          left:20%; font-size: 22px;"> 
                        <h2>Register Form</h2>
                         <div class="form-group">
               			 	<label class="col-sm-2">ID:*</label>
							<div class="col-sm-7">
								<input type="text" name="id" id="id" required/><span id="checkID"></span>                                                                                               	      
							</div>
						</div>
						  <div class="form-group">
               			 	<label class="col-sm-2">Name:*</label>
							<div class="col-sm-7">
								<input type="text" name="name" id="username" required/>                                                                                          	      
							</div>
						</div>
						<div class="form-group">
               			 	<label class="col-sm-2">Password:*</label>
							<div class="col-sm-7">
								<input type="password" name="password" id="password" required/>                                                                                    	      
							</div>
						</div>
                         <div class="form-group">
               			 	<label class="col-sm-2">Password Again:*</label>
							<div class="col-sm-7">
								<input type="password" name="password1" id="password1" required/>                                                                               	      
							</div>
						</div>
                        <div class="form-group">
               			 	<label class="col-sm-2">Sex:</label>
							<label class="radio-inline">
 								<input type="radio" name="sex"  value="Male" checked />Male
							</label>
							<label class="radio-inline">
							 	<input type="radio" name="sex" value="Female"/>Female
							</label>
						</div>     
                        <div class="form-group">
               			 	<label class="col-sm-2">Age :</label>
							<div class="col-sm-7">
								<input type="text" name="age" id="age" required/>                                                                          	      
							</div>
						</div>
                        <div class="form-group">
               			 	<label class="col-sm-2">Phone:*</label>
							<div class="col-sm-7">
								<input type="text" name="phone" id="phone" required/>
							</div>
						</div>  
                          <div class="form-group">
               			 	<label class="col-sm-2">email:*</label>
							<div class="col-sm-7">
								<input type="email" name="email" id="email" required/>
							</div>
						</div>         
                         <div class="form-group">
               			 	<label class="col-sm-2">Address:*</label>
							<div class="col-sm-7">
								<input type="text" name="address" id="address" required/>
							</div>
						</div>     
                        <div class="form-group">
               			 	<label class="col-sm-2">IdCart:*</label>
							<div class="col-sm-7">
								<input type="text" name="idcart" id="idcart" required/>
							</div>
						</div>     
 						<div class="form-group">
               			 	<input class="btn btn-primary" type="submit" value="register"/>
                             <input type="reset" class="btn btn-primary"  value="reset"/>
                             <input type="hidden" name="money" value="0"/>
                           	 <input type="hidden" name="position" value="User"/>
						</div>    
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
