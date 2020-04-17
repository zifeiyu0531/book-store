<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" class="bean.sql" scope="page"/>
<jsp:useBean id="SQLSearch" class="bean.sql" scope="page"/>
<html>
<head>
    <title>Title</title>
    <link href="../css/change_book.css" rel="stylesheet"/>
    <script language="JavaScript">
        function price_submit() {
            var price = document.getElementById("new_price").value;
            if(price === ""){
               alert("价格不能为空");
               return false;
            }else if(price === "0"){
                alert("价格不能为0");
                return false;
            }
            return true;
        }
    </script>
</head>
<body id="bg">
    <p id="title">价格修改</p>
    <%
        int id = Integer.parseInt(session.getAttribute("ID").toString());
        float oldPrice = 0;
        String title = "";
        String SQLstr = "SELECT * FROM book WHERE id = "+id;
        ResultSet rs = SQLSearch.executeQuery(SQLstr);
        try{
            if(rs.next()){
                title = rs.getString("title");
                oldPrice = rs.getFloat("price");
            }
        }catch (java.sql.SQLException ex){
            System.out.println(ex.getMessage());
        }
    %>
    <p class="old_price"><%=title%></p>
    <p class="old_price">旧价格：<%=oldPrice%>￥</p>
    <form id="change_form" method="post" action="change_book_action.jsp" onsubmit="return price_submit()">
        新价格：<br/><input id="new_price" type="text" name="new_price"/>￥
        <input id="submit" type="submit" value="提交">
    </form>
</body>
</html>
