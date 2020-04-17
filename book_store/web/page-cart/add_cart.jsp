<%@ page language="java" import="java.sql.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
<head>
    <title>添加购物车</title>
    <link href="../css/cart.css" rel="stylesheet"/>
    <script language="JavaScript">
        var num = 1;
        function sub() {
            num--;
            if(num<=1){
                num = 1;
            }
            document.getElementById("book_num_input").value = num;
        }
        function add() {
            num++;
            if(num>10){
                num = 10;
                alert("一次最多购买10本");
            }
            document.getElementById("book_num_input").value = num;
        }
        function add_to_cart() {
            var book_num = document.getElementById("book_num").value;
            if(book_num <= 0){
                alert("数量不能为0或负数");
                return false;
            }else{
                return true;
            }
        }
    </script>
</head>
<body>
    <%
        String id = request.getParameter("id");
        String title = "";
        float price = 0;
        String SQLstr = "SELECT * FROM book WHERE id=" + id;
        ResultSet rs = SQLSearch.executeQuery(SQLstr);
        try{
            if(rs.next()){
                title = rs.getString("title");
                price = rs.getFloat("price");
            }
            rs.close();
        }catch (java.sql.SQLException ex){
            System.out.println(ex.getMessage());
        }
        out.print("<p id=\"add_cart_text\">您正在将" + title +"添加到购物车</p>");
        out.print("<p id=\"price_text\">单价：" + price +"￥</p>");
        out.print("<p id=\"choose_num_text\">选择数目：</p>");
    %>
    <br/>
    <button class="num_button" onclick="sub()">-</button>
    <form id="cart_form" method="post" action="cart.jsp" onsubmit="return add_to_cart()">
        <input name="num" id="book_num_input" type="text" value="1">
        <input type="number" name="id" value="<%=id%>" hidden="hidden">
        <input id="submit_button" type="submit" value="添加到购物车">
    </form>
    <button class="num_button" onclick="add()">+</button>
</body>
</html>
