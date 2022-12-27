<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.userData" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>个人中心</title>
    <jsp:useBean id="userData" class="com.bean.getUserData"/>
    <script type="text/javascript">
        function wallet() {
            <%userData data = userData.get(session.getAttribute("user").toString());%>
            const reg = /^(?:0|[1-9][0-9]{0,3}?|10000)(\.[0-9]{0,2})?$/;
            let money = prompt('请输入充值的金额(0-10000,元角分)');
            if (money != null) {
                if (reg.test(money)) {
                    if (confirm('是否确定充值？')) {
                        money += <%=data.wallet%>;
                        <%session.setAttribute("mode", "wallet");%>
                        location.href = encodeURI('walletServlet?money=' + money);
                    }
                } else {
                    alert('请输入正确的金额格式！(0-10000,元角分)');
                }
            } else {
                alert('您输入的金额为空！');
            }
        }
    </script>
</head>
<body>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l3"></div>
        <div id="title">
            <table class="center" style="padding-top: 150px">
                <tr>
                    <td colspan="4" style="text-align: center; padding-bottom: 10px">
                        <h3>个人信息</h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">账户:</td>
                    <td colspan="2"><%=data.val[0]%>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">昵称:</td>
                    <td colspan="2"><%=data.val[1]%>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">性别:</td>
                    <td colspan="2"><%=data.val[3]%>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">年龄:</td>
                    <td colspan="2"><%=data.age%>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">籍贯:</td>
                    <td colspan="2"><%=data.val[4]%>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">电子邮箱:</td>
                    <td colspan="2"><%=data.val[5]%>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">钱包余额:</td>
                    <td colspan="2"><%=data.wallet%></td>
                </tr>
                <tr>
                    <td style="padding-top: 10px"><input type="button" class="t_button" value="上架漫画"
                                                         onclick="window.location.href = 'input.jsp'"></td>
                    <td style="padding-top: 10px"><input type="button" class="t_button" value="漫画信息更改"
                                                         onclick="window.location.href = 'change_manga.jsp'"></td>
                    <td style="padding-top: 10px"><input type="button" class="t_button" value="下架漫画"
                                                         onclick="window.location.href = 'delete.jsp'"></td>
                </tr>
                <tr>
                    <td><input type="button" class="t_button" value="已购买漫画"
                               onclick="window.location.href = 'purchased.jsp'"></td>
                    <td><input type="button" class="t_button" value="已卖出漫画"
                               onclick="window.location.href = 'saled.jsp'"></td>
                    <td><input type="button" class="t_button" style="" value="充值" onclick="wallet()"></td>
                </tr>
            </table>
        </div>
        <div id="img_r3"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>