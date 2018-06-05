<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="jslib/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(function () {
                $(".delete").click(function () {
                    var name = document.getElementById("name").innerHTML;
                    var flag = confirm("确定要删除" + name + "的信息吗?");

                    if (flag) {
                        return true;
                    }

                    return false;
                });
                $(".clear").click(function () {     
                    var flag = confirm("确定要清空购物车吗?");
                    if (flag) {
                        return true;
                    }

                    return false;
                })
                //ajax 修改单个商品的数量:
                //1. 获取页面中所有的 text, 并为其添加 onchange 响应函数. 弹出确认对话框: 确定要修改吗? 
                $(":text").change(function () {
                    var quantityVal = $.trim(this.value);

                    var flag = false;

                    var reg = /^\d+$/g;
                    var quantity = -1;
                    if (reg.test(quantityVal)) {
                        quantity = parseInt(quantityVal);
                        if (quantity >= 0) {
                            flag = true;
                        }
                    }

                    if (!flag) {
                        alert("输入的数量不合法!");
                        $(this).val($(this).attr("class"));
                        return;
                    }

                    var name = document.getElementById("name").innerHTML;


                    if (quantity == 0) {
                        var flag2 = confirm("确定要删除" + name + "的信息吗?");
                        if (flag2) {
                            var $a = $("table tbody tr:first td:last").find("a");
                            $a[0].onclick();
                            return;
                        }
                    }

                    var flag = confirm("确定要修改" + name + "的数量吗?");

                    if (!flag) {
                        $(this).val($(this).attr("class"));
                        return;
                    }
                    //2. 请求地址为: updateItemQuantity
                    var url = "updateItemQuantity";

                    //3. 请求参数为: method:updateItemQuantity, id:name属性值, quantity:val, time:new Date()
                    var idVal = $.trim(this.name);
                    var args = {"id": idVal, "quantity": quantityVal, "time": new Date()};

                    //4. 在 updateItemQuantity 方法中, 获取 quanity, id, 再获取购物车对象, 调用 service 的方法做修改
                    //5. 传回 JSON 数据: productNumber:xx, totalMoney

                    //6. 更新当前页面的 productNumber:xx 和 totalMoney
                    $.post(url, args, function (data) {
                        var productNumber = data.productNumber;
                        var totalMoney = data.totalMoney;

                        $("#totalMoney").text("总金额: ￥" + totalMoney);
                        $("#productNumber").text("您的购物车中共有" + productNumber + "件商品");
                    }, "JSON");

                });

            });

        </script>
    </head>

    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <div class="container-fluid" style="height:500px;">
        <table>
            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form method="post" action="#">
                            <table cellspacing="0" class="shop_table cart">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>


                                        <th class="product-remove">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.ShoppingCart.items}" var="item">  
                                        <tr class="cart_item">


                                            <td class="product-thumbnail">
                                                <a href="single-product.html"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${item.product.image}"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="single-product.html" id="name">${item.product.name}</a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">${item.product.price}</span> 
                                            </td>

                                            <td class="product-quantity">
                                                <input class="${item.quantity}" type="text" size="1" name="${item.product.id }" value="${item.quantity}"/>
                                            </td>
                                            <td class="product-remove">
                                                <a title="Remove this item"  class="delete" href="remove?id=${item.product.id}">×</a> 
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td class="actions" colspan="6" >
                                            <div style="position: relative; left:500px;"> 
												<span id="productNumber">您的购物车中共有 ${ sessionScope.ShoppingCart.productNumber}  件商品</span><br/>
                                                <span id="totalMoney">总金额: ￥ ${ sessionScope.ShoppingCart.totalMoney}</span>
                                                <a href="checkout">结账</a>
                                                &nbsp;&nbsp;<br/>
                                                <a href="clear" class="clear">清空购物车</a>
                                                &nbsp;&nbsp;


                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </table>
        </div>
    </body>
</html>