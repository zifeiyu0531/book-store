<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("cart_id"));
        String SQLstr = "DELETE FROM cart WHERE ID="+id;
        SQLUpdate.executeUpdate(SQLstr);
        response.sendRedirect("cart.jsp");
    %>
</body>
</html>
