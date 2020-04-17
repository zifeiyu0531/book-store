<%@ page import="javax.sql.rowset.serial.SQLOutputImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" class="bean.sql" scope="page"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int id = Integer.parseInt(session.getAttribute("ID").toString());
        String SQLstr = "DELETE FROM book WHERE ID = "+ id +"";
        SQLUpdate.executeUpdate(SQLstr);
        response.sendRedirect("book_manage.jsp");
    %>
</body>
</html>
