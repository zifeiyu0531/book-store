<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
<head>
    <title>书籍管理</title>
    <link href="../css/book_manage.css" rel="stylesheet"/>
</head>
<body>
<p id="title">书籍管理</p>
<a id="add_book" href="./add_book.jsp">添加书籍</a>
<table id="book_table" border="5">
    <tr id="book_table_tr">
        <th width="50">ID</th>
        <th width="150">书名</th>
        <th width="150">作者</th>
        <th width="200">出版社</th>
        <th width="100">类别</th>
        <th width="100">价格</th>
        <th width="200">操作</th>
    </tr>
    <%
        String SQLstr = "SELECT * FROM book order by ID";
        ResultSet rs = SQLSearch.executeQuery(SQLstr);
        try{
            while(rs.next()){
                int id = rs.getInt("ID");
                out.print(
                        "<tr>" +
                                "<td>" + rs.getString("ID") + "</td>" +
                                "<td>" + rs.getString("title") + "</td>" +
                                "<td>" + rs.getString("author") + "</td>" +
                                "<td>" + rs.getString("publish") + "</td>" +
                                "<td>" + rs.getString("type") + "</td>" +
                                "<td>" + rs.getString("price") + "￥</td>" +
                                "<td> " +
                                    "<form action=\"./delete_or_change.jsp\" method=\"POST\"> " +
                                        "<input type=\"number\" name=\"id\" value=\""+ id +"\" hidden=\"hidden\"> " +
                                        "<input type=\"submit\" name=\"submit_button\" value=\"删除\"> " +
                                        "<input type=\"submit\" name=\"submit_button\" value=\"修改\"> " +
                                    "</form> " +
                                "</td>" +
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
