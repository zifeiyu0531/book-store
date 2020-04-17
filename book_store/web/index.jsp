<%@ page language="java" import="java.sql.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ include file="header-for-index.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
    <head>
        <title>书籍列表</title>
        <link href="./css/index.css" rel="stylesheet"/>
        <script language="javascript">
            function on_submit() {
                var name = "<%=session.getAttribute("name")%>";
                if(name === "null"){
                    alert("只有登录用户才能购物");
                    window.location.replace("./page-log/login.jsp");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <p id="title">Book Store</p>
        <table id="book_table" border="5">
            <tr id="book_table_tr">
                <th width="200">    </th>
                <th width="150">书名</th>
                <th width="150">作者</th>
                <th width="200">出版社</th>
                <th width="100">类别</th>
                <th width="300">简介</th>
                <th width="100">价格</th>
                <th width="200">    </th>
            </tr>
            <%
                String SQLstr = "SELECT * FROM book order by ID";
                ResultSet rs = SQLSearch.executeQuery(SQLstr);
                try{
                    while(rs.next()){
                        int id = rs.getInt("ID");
                        out.print(
                                "<tr>" +
                                "<td> <img src =\"" + rs.getString("imgsrc") + "\"/> </td>" +
                                "<td>" + rs.getString("title") + "</td>" +
                                "<td>" + rs.getString("author") + "</td>" +
                                "<td>" + rs.getString("publish") + "</td>" +
                                "<td>" + rs.getString("type") + "</td>" +
                                "<td>" + rs.getString("introduction") + "</td>" +
                                "<td>" + rs.getString("price") + "￥</td>" +
                                "<td> <form action=\"./page-cart/add_cart.jsp\" method=\"POST\" onsubmit=\"return on_submit()\"> <input type=\"number\" name=\"id\" value=\""+ id +"\" hidden=\"hidden\"> <input type=\"submit\" value=\"加入购物车\"> </form> </td>" +
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