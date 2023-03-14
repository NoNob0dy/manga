<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>注册</title>
    <script src="js/jquery-3.6.3.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/messages_zh.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        $().ready(function () {
            jQuery.validator.addMethod("judgePassword", function () {
                let cmp = document.getElementById("pwd1").value;
                let obj = new RegExp(/[a-z1-9]/i);
                return obj.test(cmp);
            }, "密码应由字母，数字组成组成！");
            $("#form").validate({
                rules: {
                    nickname: {
                        required: true,
                        minlength: 2,
                    },
                    account: {
                        required: true,
                    },
                    pwd1: {
                        required: true,
                        judgePassword: true,
                        minlength: 8,
                    },
                    pwd2: {
                        required: true,
                        equalTo: "#pwd1"
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    age: {
                        required: true,
                        digits: true,
                        range: [10, 69]
                    },
                },
                messages: {
                    nickname: {
                        required: "请输入昵称",
                        minlength: "昵称必需由两个及以上字符组成",
                    },
                    account: {
                        required: "请输入您的账号，以作为登录凭证",
                        minlength: "账号长度不能小于 8 个字符",
                    },
                    pwd1: {
                        required: "请输入密码",
                        minlength: "密码至少为包含数字和字母的8个字符！",
                    },
                    pwd2: {
                        required: "请输入密码",
                        equalTo: "两次密码输入不一致"
                    },
                    email: "请输入邮箱的正确格式",
                    age: {
                        required: "请输入您的年龄",
                        digits: "年龄为10-69之间的整数",
                        range: "年龄的长度在10-69之间"
                    },
                },
                showErrors: function (errorMap, errorList) {
                    let msg = "";
                    $.each(errorList, function (i, v) {
                        msg += (v.message + "\r\n");
                    });
                    if (msg !== "")
                        alert(msg);
                },
                onkeyup: false,
                onfocusout: false
            })
        });
    </script>
</head>
<body>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l1"></div>
        <div id="title">
            <form id="form" method="post" action="registerServlet">
                <table class="center" style="padding-top: 100px">
                    <tr>
                        <td colspan="2" style="text-align: center; padding-bottom: 10px">
                            <h3>用户注册</h3>
                        </td>
                    <tr>
                    <tr>
                        <td>昵称:</td>
                        <td><input id="nickname" name="nickname" type="text" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>账号名:</td>
                        <td><input id="account" name="account" type="text" class="t_p" placeholder="可作为登录凭证">
                        </td>
                    </tr>
                    <tr>
                        <td>密码:</td>
                        <td><input id="pwd1" name="pwd1" type="password" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>确认密码:</td>
                        <td><input id="pwd2" name="pwd2" type="password" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td><input id="email" name="email" type="email" class="t_p" placeholder="可作为登录凭证"></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td><select id="sex" name="sex">
                            <option>男</option>
                            <option>女</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>年龄:</td>
                        <td><input id="age" name="age" type="text" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>籍贯:</td>
                        <td><select name="place">
                            <option>北京</option>
                            <option>天津</option>
                            <option>上海</option>
                            <option>重庆</option>
                            <option>河北</option>
                            <option>山西</option>
                            <option>辽宁</option>
                            <option>吉林</option>
                            <option>黑龙江</option>
                            <option>江苏</option>
                            <option>浙江</option>
                            <option>安徽</option>
                            <option>福建</option>
                            <option>山东</option>
                            <option>河南</option>
                            <option>广东</option>
                            <option>海南</option>
                            <option>四川</option>
                            <option>贵州</option>
                            <option>云南</option>
                            <option>陕西</option>
                            <option>甘肃</option>
                            <option>青海</option>
                            <option>内蒙古</option>
                            <option>广西</option>
                            <option>西藏</option>
                            <option>宁夏</option>
                            <option>新疆</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 10px">
                            <input type="submit" class="t_button" value="提交">
                            <input type="hidden" id="focus" value="提交">
                        </td>
                    <tr>
                </table>
            </form>
        </div>
        <div id="img_r1"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>
