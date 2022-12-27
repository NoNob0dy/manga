<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>漫画信息更改</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-table.css"/>
    <script src="js/jquery-3.6.3.js"></script>
    <script src="js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        $().ready(function () {
            $('#manga').bootstrapTable({
                pagination: "true",
                sidePagination: "client",
                pageSize: 10,
                columns: [{
                    title: '序号',
                    field: 'ID',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '系列名',
                    field: 'mnames',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '作者',
                    field: 'mauthors',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '出版社名',
                    field: 'mpublishs',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '贩卖日',
                    field: 'mdates',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '价格',
                    field: 'mprices',
                    align: 'center',
                    valign: 'middle',
                }]
            });
        });
    </script>
</head>
<body>
<jsp:useBean id="lists" class="com.bean.mangaLists"/>
<%
    lists.getdata(session.getAttribute("user").toString());
%>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l1"></div>
        <div id="title">
            <h3>漫画下架</h3>
            <hr/>
            <table class="table table-bordered" id="manga">
                <%
                    for (int i = 0; i < lists.mnames.size(); i++) {
                %>
                <tr>
                    <td><%=(i + 1)%>
                    </td>
                    <td>
                        <a href="javascript:void(0)" onclick="if(confirm('你确定要下架这个漫画吗？')) {
                            location.href = encodeURI('deleteServlet?mname=<%=lists.mnames.get(i)%>')}">
                            <%=lists.mnames.get(i)%>
                        </a>
                    </td>
                    <td><%=lists.mauthors.get(i)%>
                    </td>
                    <td><%=lists.mpublishs.get(i)%>
                    </td>
                    <td><%=lists.mdates.get(i)%>
                    </td>
                    <td><%=lists.mprices.get(i)%>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="img_r1"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>
