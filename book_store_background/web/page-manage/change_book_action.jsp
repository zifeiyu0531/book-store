<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" class="bean.sql" scope="page"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        float price = Float.valueOf(request.getParameter("new_price"));
        int id = Integer.parseInt(session.getAttribute("ID").toString());
        String SQLstr = "UPDATE book SET price = "+ price +" WHERE ID = "+id;
        SQLUpdate.executeUpdate(SQLstr);
        response.sendRedirect("book_manage.jsp");
    %>
</body>
</html>
