<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
    li{
    list-style:none;
   margin-bottom:10px;
    }
    </style>
    <body>
        <%
            if (session.getAttribute("position").equals("User")) {
        %>
        <ul>
            <li><h1>菜单</h1></li>
            <li><a href="viewPersonalInformation.jsp" target="ContentFrame">View Personal Information</a></li>
            <li><a href="modifyPersonalInformation.jsp" target="ContentFrame">Modify  Personal Information</a></li>
            <li><a href="changePassword.jsp" target="ContentFrame">Change Password</a></li>
            <li><a href="secretSecuritySettings.jsp" target="ContentFrame">Set Secret Security</a></li> 
            <!--            <li><a href="uppradeVip.jsp" target="ContentFrame">Upgrade vip</a></li>  -->
                        <li><a href="receiptAddress.jsp" target="ContentFrame">Receipt Address</a></li> 
            <li><a href="myOrder.jsp" target="ContentFrame">My Order</a></li> 
            <!--            <li><a href="ViewPersonalFine.jsp" target="ContentFrame" >View Personal Fine</a></li>-->
            <li><a href="setUpShop.jsp" target="ContentFrame">Set up shop</a></li>

        </ul>
        <%
        } else if (session.getAttribute("position").equals("Manager")) {
        %>
        <ul>
            <li><h1>菜单</h1></li>
            <li><a href="dealApply.jsp" target="ContentFrame">店铺管理</a></li>
            <li><a href="manageCategory.jsp" target="ContentFrame">类别管理</a></li>
            <li><a href="recharge.jsp" target="ContentFrame">人员管理</a></li>
        </ul>
        <%
        } else;
        %>   
    </body>
</html>
