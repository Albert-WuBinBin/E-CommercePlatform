
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="jslib/jquery.min.js"></script>
        <script type="text/javascript" src="js/showGoods.js"></script>
    </head>
    <script>
    $(function(){
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
    })
    </script>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="single-product-area">
			 <div class="container">
			 	<div class="row" style="position:absolute; top:30px; left:200px; height:50px;">
			 		<form class="form-inline" id="searchform" action="ShowAllGoods1">
			 		
			 			<div class="form-group">
			 				<div class="input-group">
				 				<div class="input-group-addon">
				 					<label class="control-label">category</label>
				 				</div>
				 				<input type="hidden" value='<%=request.getAttribute("ca_id")%>' id="ca_id"/> 
				 				<input type="hidden" value='<%=request.getAttribute("min")%>' id="min"/> 
				 				<input type="hidden" value='<%=request.getAttribute("max")%>' id="max"/> 
				 				<input type="hidden" value='<%=request.getAttribute("searchtext")%>' id="t"/> 
				 				<select id="category" name="category" class="form-control" >
					 				<option value="0">-请选择-</option>
					 				
				 				</select>
			 				</div>
			 			</div>
			 			<div class="form-group">
			 			&nbsp;&nbsp;&nbsp;&nbsp;
			 			</div>
			 			<div class="form-group">
			 				<input type="text" class="form-control" id="minprice" placeholder="￥"/>	
			 				<label  class="control-label">——</label>
							<input type="text" class="form-control" id="maxprice" placeholder="￥"/>
			 			</div>
			 			<div class="form-group">
			 			&nbsp;&nbsp;&nbsp;&nbsp;
			 			</div>
			 			<div class="form-group">
			 				<div class="input-group">
				 				<div class="input-group-addon">
									<select id="searchType">
										<option value="宝贝">宝贝</option>
										<option value="店铺">店铺</option>
									</select>
								</div>
	      						<input type="text" class="form-control"  id="searchtext" placeholder="search">
			 				</div>
				 			 <button type="button" class="btn btn-primary btn-search">Search</button>
			 			</div>
			 			
			 		</form>
			 	</div>
                <div class="row">
                    <c:forEach items="${productPage.list}" var="product">  
                        <div class="col-md-3 col-sm-6" style="height: 480px;">
                            <div class="single-shop-product">
                                <div class="product-upper">
                                    <a href="showDetails?p_id=${product.id}"><img src="${product.image}"  alt=""></a>
                                </div>
                                <h2><a href="showDetails?p_id=${product.id}">${product.name}</a></h2>
                                <div class="product-carousel-price">
                                    <ins>${product.price}</ins> <del></del>
                                </div>  

                                <div class="product-option-shop">
                                    <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="showDetails?p_id=${product.id}">Buy immediately</a>
                                      
                                </div>                       
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <center>
              <br><br>
                Total  ${productPage.totalPageNumber } page(s)

                &nbsp;&nbsp;
                Current  ${productPage.pageNo } page(s)		
                <c:if test="${productPage.hasPrev }">
                    <a href="ShowAllGoods?pageNo=1">home page</a>
                    &nbsp;&nbsp;
                    <a href="ShowAllGoods?pageNo=${productPage.prevPage }">Up page</a>
                </c:if>

                &nbsp;&nbsp;

                <c:if test="${productPage.hasNext }">
                    <a href="ShowAllGoods?pageNo=${productPage.nextPage }">Down page</a>
                    &nbsp;&nbsp;
                    <a href="ShowAllGoods?pageNo=${productPage.totalPageNumber }">Last page</a>
                </c:if>

                &nbsp;&nbsp;

                Go to <input type="text" size="1" id="pageNo"/> page(s)	
            </center>
        </div>
    </body>
</html>
