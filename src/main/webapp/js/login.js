   $(function(){
	   $(":input[name='id']").change(function () {
           var id = $.trim(this.value);
           var url = "checkID";
           var args = {"id": id, "time": new Date()};

           $.post(url, args, function (data) {
               var checkID = data.checkID;
               $("#checkID").text(checkID);
           }, "JSON");
       });
	   $("#loginForm").validate({
		    rules: {
		      id: "required",
		      password: "required",
		    }
	   });

   });