<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String realname = request.getParameter("realname");
        String SQLstr = "INSERT INTO user (username, password, phone, address, realname) VALUES ('"+ name +"','"+ password +"','"+ phone +"','"+ address +"','"+ realname +"')";
        SQLUpdate.executeUpdate(SQLstr);
        session.setAttribute("name", name);
        response.sendRedirect("welcome.jsp");
    %>
</body>
</html>
