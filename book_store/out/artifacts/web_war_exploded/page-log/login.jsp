<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<html>
<head>
    <title>登录</title>
    <link href="../css/login.css" rel="stylesheet"/>
    <script language="javascript">
        var try_time = 0;
        var name = "<%=session.getAttribute("name")%>";
        if(name !== "null"){
            alert("您已登录，无需重复登录");
            window.location.replace("../index.jsp");
        }
        function on_submit() {
            if(document.getElementById("name").value===""){
                alert("输入的用户名为空");
                try_time += 1;
                if(try_time === 3){
                    alert("输入错误达到三次，返回主页面");
                    window.location.replace("../index.jsp");
                }
                return false;
            }else if(document.getElementById("password").value===""){
                alert("输入的密码为空");
                try_time += 1;
                if(try_time === 3){
                    alert("输入错误达到三次，返回主页面");
                    window.location.replace("../index.jsp");
                }
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <p id="title">LogIn</p>
    <form action="check.jsp" method="post" id="login_form" onsubmit="return on_submit()">
        账号：<input id="name" class="login_input" type="text" name="name"><br/>
        密码：<input id="password" class="login_input" type="password" name="password"><br/>
        <input class="login_input" type="submit" value="登录">
    </form>
</body>
</html>
