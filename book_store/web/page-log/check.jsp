<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String SQLstr = "SELECT * FROM user WHERE username='"+ name +"' AND password='"+ password +"'";
        ResultSet rs = SQLSearch.executeQuery(SQLstr);
        try{
            if(rs.next()){
                session.setAttribute("name", name);
                session.setAttribute("id", rs.getInt("ID"));
                response.sendRedirect("welcome.jsp");
            }else{
                response.sendRedirect("error.jsp");
            }
            rs.close();
        }catch (java.sql.SQLException ex){
            System.out.println(ex.getMessage());
        }
    %>
</body>
</html>
