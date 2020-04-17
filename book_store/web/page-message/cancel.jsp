<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name = session.getAttribute("name").toString();
        String SQLstr = "DELETE FROM message WHERE userID = '"+ name +"'";
        SQLUpdate.executeUpdate(SQLstr);
        response.sendRedirect("message.jsp");
    %>
</body>
</html>
