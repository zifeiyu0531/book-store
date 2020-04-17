<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.inc"%>
<html>
<head>
    <title>管理员登录</title>
    <link href="../css/login.css" rel="stylesheet"/>
    <script language="javascript">
        function on_submit() {
            if(document.getElementById("name").value===""){
                alert("输入的用户名为空");
                return false;
            }else if(document.getElementById("password").value===""){
                alert("输入的密码为空");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <p id="sub_title">管理员登录</p>
    <form action="check.jsp" method="post" id="login_form" onsubmit="return on_submit()">
        账号：<input id="name" class="login_input" type="text" name="name"><br/>
        密码：<input id="password" class="login_input" type="password" name="password"><br/>
        <input class="login_input" type="submit" value="登录">
    </form>
</body>
</html>
