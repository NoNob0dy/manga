<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.bean.mangaData" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>漫画信息查看&更改</title>
    <script src="js/messages_zh.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validate.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.validate.input.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<jsp:useBean id="getMangaData" class="com.bean.getMangaData"/>
<%
    String mname = request.getParameter("mname");
    mangaData data = getMangaData.get(mname);
    session.setAttribute("mname", mname);
%>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l1"></div>
        <div id="title">
            <form action="changeServlet" method="post">
                <table class="center" style="padding-top: 150px; padding-left: 20px">
                    <tr>
                        <td colspan="2" style="text-align: center; padding-bottom: 10px; padding-right: 25px">
                            <h3>漫画信息查看&更改</h3>
                        </td>
                    <tr>
                    <tr>
                        <td>系列名:</td>
                        <td><input name="mname" type="text" class="t_p" value=<%=data.val[1]%>></td>
                    </tr>
                    <tr>
                        <td>作者:</td>
                        <td><input name="mauthor" type="text" class="t_p" value=<%=data.val[2]%>></td>
                    </tr>
                    <tr>
                        <td>出版社名:</td>
                        <td><input name="mpublish" type="text" class="t_p" value=<%=data.val[3]%>></td>
                    </tr>
                    <tr>
                        <td>贩卖日:</td>
                        <td><input name="mdate" type="date" class="t_p" value=<%=data.val[4]%>></td>
                    </tr>
                    <tr>
                        <td>分类:</td>
                        <td><select name="mtype">
                            <option selected>少年漫画</option>
                            <option>青年漫画</option>
                            <option>少女漫画</option>
                            <option>女性漫画</option>
                            <option>轻小说</option>
                            <option>其他</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>状态：</td>
                        <td><select name="mstate">
                            <option selected>在售</option>
                            <option>售罄</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>数量:</td>
                        <td><input name="mnum" type="text" class="t_p" value=<%=data.mnum%>> 本</td>
                    </tr>
                    <tr>
                        <td>价格:</td>
                        <td><input name="mprice" type="text" class="t_p" value=<%=data.mprice%>> 元</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 10px; padding-right: 25px">
                            <input type="submit" class="t_button" value="提交更改信息">
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
