<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String sort_name = request.getParameter("type");
        switch (sort_name){
            case "无":
                session.setAttribute("sort", null);
                response.sendRedirect("sort.jsp");
                break;
            case "数学":
                session.setAttribute("sort", "数学");
                response.sendRedirect("sort.jsp");
                break;
            case "历史":
                session.setAttribute("sort", "历史");
                response.sendRedirect("sort.jsp");
                break;
            case "计算机":
                session.setAttribute("sort", "计算机");
                response.sendRedirect("sort.jsp");
                break;
            case "中文小说":
                session.setAttribute("sort", "中文小说");
                response.sendRedirect("sort.jsp");
                break;
            case "英文小说":
                session.setAttribute("sort", "英文小说");
                response.sendRedirect("sort.jsp");
                break;
            default:
                break;
        }
    %>
</body>
</html>
