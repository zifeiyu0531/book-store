<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
<head>
    <title>分类统计</title>
    <link href="../css/sort.css" rel="stylesheet"/>
</head>
<body>
    <%
        int total = 0;
        String sort = "";
        String SQLstr = "";
        String SQLbook = "";
        if(session.getAttribute("sort")==null){
            SQLstr = "SELECT count(1) AS total FROM book";
            SQLbook = "SELECT * FROM book order by ID";
        }else{
            sort = session.getAttribute("sort").toString();
            SQLstr = "SELECT count(1) AS total FROM book WHERE type = '"+ sort +"'";
            SQLbook = "SELECT * FROM book WHERE type = '"+ sort +"'";
        }
        ResultSet rs = SQLSearch.executeQuery(SQLstr);
        try{
            if(rs.next()){
                total = rs.getInt("total");
            }
            rs.close();
        }catch (java.sql.SQLException ex) {
            System.out.println(ex.getMessage());
        }
    %>
    <p id="title">分类统计</p>
    <p id="total">共有<%=sort%>书<%=total%>本</p>
    <form action="get_sort.jsp" method="POST">
        选择类型：<select id="type" name="type">
            <%
                String[] types = {"无", "数学", "历史", "计算机", "中文小说", "英文小说"};
                for(String type:types){
                    out.print("<option>"+ type +"</option>");
                }
            %>
        </select>
        <input type="submit" value="查询">
    </form>
    <table id="book_table" border="5">
        <tr id="book_table_tr">
            <th width="50">ID</th>
            <th width="150">书名</th>
            <th width="150">作者</th>
            <th width="200">出版社</th>
            <th width="100">类别</th>
            <th width="100">价格</th>
        </tr>
        <%
            rs = SQLSearch.executeQuery(SQLbook);
            try{
                while(rs.next()){
                    out.print(
                            "<tr>" +
                                    "<td>" + rs.getString("ID") + "</td>" +
                                    "<td>" + rs.getString("title") + "</td>" +
                                    "<td>" + rs.getString("author") + "</td>" +
                                    "<td>" + rs.getString("publish") + "</td>" +
                                    "<td>" + rs.getString("type") + "</td>" +
                                    "<td>" + rs.getString("price") + "￥</td>" +
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
