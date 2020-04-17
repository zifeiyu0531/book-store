<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>后台管理系统</title>
    <link href="css/login.css" rel="stylesheet"/>
  </head>
  <body>
    <%
      if(session.getAttribute("name") == null){
        response.sendRedirect("./page-log/login.jsp");
      }else{
        response.sendRedirect("./page-manage/manage.jsp");
      }
    %>
  </body>
</html>