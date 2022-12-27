<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>登录</title>
</head>
<body>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l2"></div>
        <div id="title">
            <form action="loginServlet" method="post" id="loginForm">
                <table class="center" style="padding-top: 150px">
                    <tr>
                        <td colspan="2" style="text-align: center; padding-bottom: 10px">
                            <h3>用户登录</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>账户名:</td>
                        <td><input name="user" type="text" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>密码:</td>
                        <td><input name="pwd" type="password" class="t_p"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 10px">
                            <input type="submit" class="t_button" value="登录" align="center">
                            <input type="button" class="t_button" value="注册" onclick="location.href = 'register.jsp'"
                                   align="center">
                        </td>
                    <tr>
                </table>
            </form>
        </div>
        <div id="img_r2"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>
