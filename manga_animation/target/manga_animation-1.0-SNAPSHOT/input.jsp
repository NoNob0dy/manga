<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>漫画上架</title>
    <script src="js/jquery-3.6.3.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/messages_zh.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        $().ready(function () {
            $.validator.addMethod("checkEnter", function () {
                if ($('#mname').value.indexOf(" ") !== -1) {
                    return false;
                } else {
                    return true;
                }
            }, "不能输入空格");
            $("#inputForm").validate({
                rules: {
                    mname: {
                        required: true,
                        checkEnter: true,
                        minlength: 2,
                    },
                    mauthor: {
                        required: true,
                    },
                    mpublish: {
                        required: true,
                    },
                    mdate: {
                        required: true,
                    },
                    mtype: {
                        required: true,
                    },
                    mpic: {
                        required: true,
                    },
                    mnum: {
                        required: true,
                        digits: true,
                        min: 0
                    },
                    mprice: {
                        required: true,
                        number: true,
                        range: [0, 1000]
                    },
                },
                messages: {
                    mname: {
                        required: "请输入系列名",
                        checkEnter: "不能输入空格",
                        minlength: "系列名不少于2个字节！",
                    },
                    mauthor: {
                        required: "请输入作者",
                    },
                    mpublish: {
                        required: "请输入出版社名",
                    },
                    mdate: {
                        required: "请选择贩卖日",
                    },
                    mtype: {
                        required: "请选择类别",
                    },
                    mpic: {
                        required: "请上传封面",
                    },
                    mnum: {
                        required: "请输入数量",
                        digits: "请输入正确格式的数量",
                        min: "数量不得小于0！"
                    },
                    mprice: {
                        required: "请输入价格",
                        number: "请输入正确格式的价格",
                        range: "价格区间为0-1000元的数值！"
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
                onfocusout: false,
                onkeyup: false
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
            <form id="inputForm" action="picServlet" method="post" enctype="multipart/form-data">
                <table class="center" style="padding-top: 150px; padding-left: 50px">
                    <tr>
                        <td colspan="2" style="text-align: center; padding-bottom: 10px; padding-right: 50px">
                            <h3>漫画上架</h3>
                        </td>
                    <tr>
                    <tr>
                        <td>系列名:</td>
                        <td><input id="mname" name="mname" type="text" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>作者:</td>
                        <td><input id="mauthor" name="mauthor" type="text" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>出版社名:</td>
                        <td><input id="mpublish" name="mpublish" type="text" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>贩卖日:</td>
                        <td><input id="mdate" name="mdate" type="date" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>分类:</td>
                        <td><select name="mtype">
                            <option>少年漫画</option>
                            <option>青年漫画</option>
                            <option>少女漫画</option>
                            <option>女性漫画</option>
                            <option>轻小说</option>
                            <option>其他</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td style="padding-top: 5px">封面:</td>
                        <td style="padding-top: 5px"><input name="mpic" type="file" class="t_p"></td>
                    </tr>
                    <tr>
                        <td>数量:</td>
                        <td><input id="mnum" name="mnum" type="text" class="t_p"> 本</td>
                    </tr>
                    <tr>
                        <td>价格:</td>
                        <td><input id="mprice" name="mprice" type="text" class="t_p"> 元</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 10px; padding-right: 50px">
                            <input type="submit" class="t_button" value="录入">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div id="img_r1"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>
