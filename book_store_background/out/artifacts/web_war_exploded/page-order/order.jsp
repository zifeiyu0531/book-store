<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
<head>
    <title>订单管理</title>
    <link href="../css/order.css" rel="stylesheet"/>
</head>
<body>
    <p id="title">查看订单</p>
    <table id="book_table" border="5">
        <tr id="book_table_tr">
            <th width="50">订单号</th>
            <th width="150">姓名</th>
            <th width="150">收货地址</th>
            <th width="200">联系电话</th>
            <th width="100">书名</th>
            <th width="100">购买数量</th>
            <th width="100">单价</th>
        </tr>
        <%
            String SQLstr = "SELECT * FROM mydb.order, mydb.book WHERE mydb.order.book_id = mydb.book.ID";
            ResultSet rs = SQLSearch.executeQuery(SQLstr);
            try{
                while(rs.next()){
                    out.print(
                            "<tr>" +
                                    "<td>" + rs.getInt("ID") + "</td>" +
                                    "<td>" + rs.getString("name") + "</td>" +
                                    "<td>" + rs.getString("address") + "</td>" +
                                    "<td>" + rs.getString("phone") + "</td>" +
                                    "<td>" + rs.getString("title") + "</td>" +
                                    "<td>" + rs.getInt("book_num") + "</td>" +
                                    "<td>" + rs.getFloat("price") + "￥</td>" +
                                    "</tr>"
                    );
                }
                rs.close();
            }catch (java.sql.SQLException ex){
                System.out.println(ex.getMessage());
            }
        %>
    </table>
</body>
</html>
