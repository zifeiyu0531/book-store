<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<jsp:useBean id="SQLSearch1" scope="page" class="bean.sql"/>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>订单</title>
    <link href="../css/order.css" rel="stylesheet"/>
</head>
<body>
    <p id="title">订单</p>
    <%
        String user_name = "";
        if(session.getAttribute("name")==null){
            response.sendRedirect("../page-log/login.jsp");
        }else{
            user_name = session.getAttribute("name").toString();
        }
        String SQLstr = "SELECT * FROM user WHERE username='"+ user_name +"'";
        ResultSet rs = SQLSearch.executeQuery(SQLstr);
        String real_name = "";
        String phone = "";
        String address = "";
        try{
            if(rs.next()){
                real_name = rs.getString("realname");
                phone = rs.getString("phone");
                address = rs.getString("address");
            }
            rs.close();
        }catch (java.sql.SQLException ex){
            System.out.println(ex.getMessage());
        }
        out.print(
                "<p>收货人："+ real_name +"</p>"+
                "<p>手机号："+ phone +"</p>"+
                "<p>地址："+ address +"</p>"
        );
    %>
    <table id="book_table" border="5">
        <tr id="book_table_tr">
            <th width="200">书名</th>
            <th width="100">单价</th>
            <th width="100">数量</th>
        </tr>
        <%
            SQLstr = "SELECT * FROM cart WHERE user_name='" + user_name +"'";
            rs = SQLSearch.executeQuery(SQLstr);
            String book_title = "";
            float book_price = 0;
            int book_num = 0;
            try{
                while(rs.next()){
                    int cart_book_id = rs.getInt("bookID");
                    SQLstr = "SELECT * FROM book WHERE ID="+cart_book_id;
                    ResultSet rs_book = SQLSearch1.executeQuery(SQLstr);
                    if(rs_book.next()){
                        book_title = rs_book.getString("title");
                        book_price = rs_book.getFloat("price");
                    }
                    rs_book.close();
                    book_num = rs.getInt("num");
                    out.print(
                            "<tr>" +
                            "<td>" + book_title + "</td>" +
                            "<td>" + book_price + "￥</td>" +
                            "<td>" + book_num + "</td>" +
                            "</tr>"
                    );
                    String SQLstr2 = "INSERT INTO mydb.order (name, address, phone, book_id, book_num, price) VALUES ('"+ real_name +"', '"+ address +"', '"+ phone +"', "+ cart_book_id +", "+ book_num +", "+ book_price +")";
                    System.out.println(SQLstr2);
                    SQLUpdate.executeUpdate(SQLstr2);
                }
                rs.close();
                SQLstr = "DELETE FROM cart WHERE user_name = '"+ user_name +"'";
                SQLUpdate.executeUpdate(SQLstr);
            }catch (java.sql.SQLException ex){
                System.out.println(ex.getMessage());
            }
        %>
    </table>
</body>
</html>
