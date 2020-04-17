<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<jsp:useBean id="SQLSearch1" scope="page" class="bean.sql"/>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>购物车</title>
    <link href="../css/cart.css" rel="stylesheet"/>
</head>
<body>
<%
    int book_id = 0;
    int num = 0;
    Enumeration para_names = request.getParameterNames();
    while(para_names.hasMoreElements()){
        String name = para_names.nextElement().toString();
        if(name.equals("id")){
            book_id = Integer.parseInt(request.getParameter("id"));
        }else if(name.equals("num")){
            num = Integer.parseInt(request.getParameter("num"));
        }
    }
    String user_name = "";
    if(session.getAttribute("name")==null){
        response.sendRedirect("../page-log/login.jsp");
    }else{
        user_name = session.getAttribute("name").toString();
    }
%>
<%
    if(book_id != 0){
        String SQLstr = "INSERT INTO cart (bookID, user_name, num) VALUES ("+ book_id +", '"+ user_name +"', "+ num +")";
        SQLUpdate.executeUpdate(SQLstr);
    }
%>
    <p id="title">购物车</p>
    <table id="book_table" border="5">
        <tr id="book_table_tr">
            <th width="200"></th>
            <th width="150">书名</th>
            <th width="100">单价</th>
            <th width="200">数量</th>
            <th width="100"></th>
        </tr>
        <%
            String SQLstr = "SELECT * FROM cart WHERE user_name='" + user_name +"'";
            ResultSet rs = SQLSearch.executeQuery(SQLstr);
            String img_src = "";
            String book_title = "";
            float book_price = 0;
            int book_num = 0;
            try{
                while(rs.next()){
                    int cart_id = rs.getInt("ID");
                    int cart_book_id = rs.getInt("bookID");
                    SQLstr = "SELECT * FROM book WHERE ID="+cart_book_id;
                    ResultSet rs_book = SQLSearch1.executeQuery(SQLstr);
                    if(rs_book.next()){
                        img_src = rs_book.getString("imgsrc");
                        book_title = rs_book.getString("title");
                        book_price = rs_book.getFloat("price");
                    }
                    rs_book.close();
                    book_num = rs.getInt("num");
                    out.print(
                            "<tr>" +
                            "<td> <img src =\"." + img_src + "\"/> </td>" +
                            "<td>" + book_title + "</td>" +
                            "<td>" + book_price + "￥</td>" +
                            "<td>" + book_num + "</td>" +
                            "<td> <form action=\"delete_cart.jsp\" method=\"POST\"> <input type=\"number\" name=\"cart_id\" value=\""+ cart_id +"\" hidden=\"hidden\"> <input type=\"submit\" value=\"删除\"> </form> </td>" +
                            "</tr>"
                    );
                }
                rs.close();
            }catch (java.sql.SQLException ex){
                System.out.println(ex.getMessage());
            }
        %>
    </table>
    <br/>
    <div id="make_order_div">
        <a id="make_order_button" href="../page-order/order.jsp">提交订单</a>
    </div>
</body>
</html>
