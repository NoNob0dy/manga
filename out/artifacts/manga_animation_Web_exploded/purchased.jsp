<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=yes"/>
    <title>漫画订单</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap-table.css"/>
    <script src="js/jquery-3.6.3.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
        $(function () {
            $('#order').bootstrapTable({
                pagination: "true",
                sidePagination:"client",
                pageSize: 10,
                columns: [{
                    title: '序号',
                    field: 'ID',
                    align: 'center',
                    valign: 'middle',
                },{
                    title: '卖家/买家',
                    field: 'buyerOrSaler',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '漫画名',
                    field: 'mname',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '价格',
                    field: 'mprice',
                    align: 'center',
                    valign: 'middle',
                }, {
                    title: '交易时间',
                    field: 'mtime',
                    align: 'center',
                    valign: 'middle',
                }]
            });
        });

    </script>
</head>
<body>
<jsp:useBean id="order" class="com.bean.orderLists"/>
<%
    order.getLists("buyer", session.getAttribute("user").toString());
%>
<div id="contain">
    <jsp:include page="head.jsp" flush="true"/>
    <div id="content">
        <div id="img_l3"></div>
        <div id="title">
            <h3>已购买漫画订单</h3>
            <hr/>
            <table class="table table-bordered" id="order">
                <%
                    for (int i = 0; i < order.salers.size(); i++) {
                %>
                <tr>
                    <td><%=(i + 1)%>
                    </td>
                    <td><%=order.salers.get(i)%>
                    </td>
                    <td><%=order.mnames.get(i)%>
                    </td>
                    <td><%=order.mprices.get(i)%>
                    </td>
                    <td><%=order.otimes.get(i)%>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="img_r3"></div>
    </div>
</div>
<script src="js/tail.js"></script>
</body>
</html>
