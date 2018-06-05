<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function () {
                $(".delete").click(function () {

                    var $tr = $(this).parent().parent();
                    var title = $.trim($tr.find("td:first").text());
                    var flag = confirm("确定要删除" + title + "的信息吗?");
                    if (flag) {
                        return true;
                    }

                    return false;
                });

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

                    var $tr = $(this).parent().parent();
                    var title = $.trim($tr.find("td:first").text());

                    if (quantity == 0) {
                        var flag2 = confirm("确定要删除" + title + "吗?");
                        if (flag2) {
                            //得到了 a 节点
                            var $a = $tr.find("td:last").find("a");
                            //执行 a 节点的 onclick 响应函数. 
                            $a[0].onclick();

                            return;
                        }
                    }

                    var flag = confirm("确定要修改" + title + "的数量吗?");

                    if (!flag) {
                        $(this).val($(this).attr("class"));
                        return;
                    }
                    //2. 请求地址为: bookServlet
                    var url = "bookServlet";

                    //3. 请求参数为: method:updateItemQuantity, id:name属性值, quantity:val, time:new Date()
                    var idVal = $.trim(this.name);
                    var args = {"method": "updateItemQuantity", "id": idVal, "quantity": quantityVal, "time": new Date()};

                    //4. 在 updateItemQuantity 方法中, 获取 quanity, id, 再获取购物车对象, 调用 service 的方法做修改
                    //5. 传回 JSON 数据: bookNumber:xx, totalMoney

                    //6. 更新当前页面的 bookNumber 和 totalMoney
                    $.post(url, args, function (data) {
                        var bookNumber = data.bookNumber;
                        var totalMoney = data.totalMoney;

                        $("#totalMoney").text("总金额: ￥" + totalMoney);
                        $("#bookNumber").text("您的购物车中共有" + bookNumber + "本书");
                    }, "JSON");

                });

            });

        </script>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
        <table>
            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <form method="post" action="#">
                            <table cellspacing="0" class="shop_table cart">
                                <thead>
                                    <tr>
                                        <th class="product-remove">&nbsp;</th>
                                        <th class="product-thumbnail">&nbsp;</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cart}" var="c">  
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <a title="Remove this item" class="remove" href="#">×</a> 
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.html"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="${c.product.image}"></a>
                                            </td>

                                            <td class="product-name">
                                                <a href="single-product.html">${c.product.name}</a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">${c.product.price}</span> 
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <input type="button" class="minus" value="-">
                                                    <input type="number" size="4" class="input-text qty text" title="Qty" value="1" min="0" step="1">
                                                    <input type="button" class="plus" value="+">
                                                </div>
                                            </td>

                                            <td class="product-subtotal">
                                                <span class="amount">£15.00</span> 
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <tr>
                                        <td class="actions" colspan="6">

                                            <input type="submit" value="Update Cart" name="update_cart" class="button">
                                            <input type="submit" value="Settlement" name="proceed" class="checkout-button button alt wc-forward">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
    </body>
</html>
