<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Object name = session.getAttribute("name");
        if(name == null){
            response.sendRedirect("message.jsp");
        }else{
            String message = request.getParameter("user_message");
            String SQLstr = "INSERT INTO message (userID, message) VALUES ('"+ name.toString() +"', '"+ message +"')";
            SQLUpdate.executeUpdate(SQLstr);
            response.sendRedirect("message.jsp");
        }
    %>
</body>
</html>
