
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>商品列表</title>
        <script type="text/javascript" src="jslib/jquery.min.js"></script>
        <script type="text/javascript" src="js/showGoods.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="single-product-area">
			 <div class="container">
			 	<div class="row" style="position:absolute; top:30px; left:23%; height:50px;">
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
                        <div class="col-md-3 col-sm-6" style="height: 300px;">
                            <div class="single-shop-product">
                                <div class="product-upper">
                                    <a href="showDetails?p_id=${product.id}"><img src="${product.image}"  alt=""></a>
                                </div>
                                <h2><a href="showDetails?p_id=${product.id}">${product.name}</a></h2>
                                <div class="product-carousel-price">
                                    <ins>${product.price}</ins> <ins>${product.brand}</ins>
                                </div>  
                                <div class="product-option-shop">
                                    <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="70" rel="nofollow" href="showDetails?p_id=${product.id}">查看详情</a>
                                	<%
										if (session.getAttribute("username") != null) {
									%>
									<button class="add_to_cart_button addToCart" data-quantity="1" id="${product.id}" data-product_sku="" data-product_id="70" rel="nofollow" data-toggle="modal"
								data-target="#addModal">加入购物车</button>
									<%
										} else {
									%>
									<a href="login.jsp"><button type="submit" onclick="return login()"
										class="add_to_cart_button" data-quantity="1" id="${product.id}" data-product_sku="" data-product_id="70" rel="nofollow">
										加入购物车
									</button></a>
									<%
										}
									%>
                                </div>                       
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            	<!-- 添加模态框 -->
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">加入购物车</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" action="addProduct" method="post">

						<div class="form-group">
							<label class="col-sm-2 control-label"> <span
								class="glyphicon glyphicon-list-alt"></span> 数量<span
								class="glyphicon glyphicon-star" style="color: red;"></span>
							</label>
							<span style="display: none;" id ="p_id"></span>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="quantity" name="quantity"
									placeholder="请填写购买数量">
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary btn-add">保存</button>
				</div>

			</div>
		</div>
	</div>
            
            
            <center>
              <br><br>
                	共  ${productPage.totalPageNumber } 页(s)

                &nbsp;&nbsp;
                	当前第 ${productPage.pageNo } 页(s)		
                <c:if test="${productPage.hasPrev }">
                    <a href="ShowAllGoods?pageNo=1">第一页</a>
                    &nbsp;&nbsp;
                    <a href="ShowAllGoods?pageNo=${productPage.prevPage }">上一页</a>
                </c:if>

                &nbsp;&nbsp;

                <c:if test="${productPage.hasNext }">
                    <a href="ShowAllGoods?pageNo=${productPage.nextPage }">下一页</a>
                    &nbsp;&nbsp;
                    <a href="ShowAllGoods?pageNo=${productPage.totalPageNumber }">最后一页</a>
                </c:if>

                &nbsp;&nbsp;
              	 跳转第 <input type="text" size="1" id="pageNo"/> 页(s)	
            </center>
        </div>
    </body>
</html>
