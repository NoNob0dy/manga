<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>しゅうえん的漫画屋</title>
    <link rel="stylesheet" type="text/css" href="css/slideshow.css"/>
    <script src="js/jquery-3.6.3.js"></script>
    <script src="js/jquery.slider.js"></script>
</head>
<body>
<div id="contain" class="center">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="slider"></div>
    <script type="text/javascript">
        let options = {
            container: "slider",
            imgs: ['img/1.jpg', 'img/2.jpg', 'img/3.jpg', 'img/4.jpg', 'img/5.jpg'],
            duration: 3000,
            delay: 3000,
            direction: "left",
            auto: true,
            arrows: true,
            width: 1200,
            height: 506.25
        }
        $('#slider').sliderImg(options);
    </script>
</div>
<script src="js/tail.js"></script>
</body>
</html>
