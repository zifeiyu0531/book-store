<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<html>
<head>
    <title>欢迎</title>
    <link href="../css/welcome.css" rel="stylesheet">
    <script language="javascript">
        setTimeout(function () {
            window.location.replace("../index.jsp");
        }, 5000)
    </script>
</head>
<body>
    <%
        String name = session.getAttribute("name").toString();
    %>
    <p id="welcom_title">欢迎！<%=name%></p>
    <p id="back_text">5秒后自动返回主页面</p>
    <a href="../index.jsp">点击直接返回</a>
</body>
</html>
