<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="book" class="bean.Book" scope="page">
    <%
        request.setCharacterEncoding("UTF-8");
    %>
    <jsp:setProperty name="book" property="*"/>
</jsp:useBean>
<jsp:useBean id="SQLUpdate" class="bean.sql" scope="page"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String SQLstr = "INSERT INTO book (title, author, publish, type, introduction, price, imgsrc) VALUES " +
            "('"+ book.getTitle() +"','"+ book.getAuthor() +"','"+ book.getPublish() +"','"+ book.getType() +"','"+ book.getIntroduction() +"',"+ book.getPrice() +", './img/"+ book.getImgsrc() +"')";
    SQLUpdate.executeUpdate(SQLstr);
    response.sendRedirect("add_book.jsp");
%>
</body>
</html>
