<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.setAttribute("ID", request.getParameter("id"));
        String type = new String(request.getParameter("submit_button").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        if(type.equals("删除")){
            response.sendRedirect("delete_book.jsp");
        }else{
            response.sendRedirect("change_book.jsp");
        }
    %>
</body>
</html>
