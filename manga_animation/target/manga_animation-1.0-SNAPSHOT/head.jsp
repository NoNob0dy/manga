<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link rel='stylesheet' type='text/css' href='css/base.css'/>
<link rel='stylesheet' type='text/css' href='css/background.css'/>
<link rel="stylesheet" type="text/css" href="css/login_register.css"/>
<script type='text/javascript'>
    window.onload = function () {
        let acc = <%=session.getAttribute("user")%>;
        if (acc !== null) {
            $('.login').addClass('hide');
            $('#login').append("<div class='welcome'>欢迎！用户<%=session.getAttribute("nickname")%></div>");
            $('#login').append("<a href='logout.jsp'><input type='button' class='login' value='注销'></a>");
        }
    }
</script>
<div id='top'>
    <a>
        <div id='logo'>
            しゅうえん的漫画屋
        </div>
    </a>
    <div id='search'>
        <input type='search' id='search_width' class='search' placeholder='搜索你想要的漫画'>
        <input type='button' id='search_button' class='search'
               onclick="location.href = encodeURI('manga.jsp?search=' + document.getElementById('search_width').value)"
               value='搜索'>
    </div>
    <div id='login'>
        <a href='login.jsp'><input type='button' class='login' value='登录'></a>
        <a href='register.jsp'><input type='button' class='login' value='注册'></a>
    </div>
</div>
<div id='links'>
    <span>
        <a href='index.jsp'><input type='button' class='links_button' value='首页'></a>
        <a href="javascript: location.href = encodeURI('manga.jsp?search=')"><input type='button' class='links_button' value='商品浏览'></a>
        <a href="profile.jsp"><input type='button' class='links_button' value='个人中心'></a>
    </span>
</div>