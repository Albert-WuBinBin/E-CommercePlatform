<%-- 
    Document   : setUpShop
    Created on : 2016-11-6, 21:47:38
    Author     : AlbertPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="true"/>
    <center> <h1><font color="#00ffcc;">Upload Resume</font></h1></center>
    <form method="post" action="UploadServlet" enctype="multipart/form-data">
        <input type="hidden" name="test" value="good">
        <table width="75%" border="1" align="center">
            <tr>
                <td>请上传个人身份证：</td>
                <td><div align="center"><input type="file" name="file1" ></div></td>
                 <td><div align="center"><input type="submit" name="submit" value="submit" ></div></td>
            </tr>
           
        </table>
    </form>
 

    <jsp:include page="footer.jsp" flush="true"/>
</body>
</html>
