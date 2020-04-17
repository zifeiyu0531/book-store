<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<html>
<head>
    <title>注册</title>
    <link href="../css/logon.css" rel="stylesheet"/>
    <script language="JavaScript">
        var name = "<%=session.getAttribute("name")%>";
        if(name !== "null"){
            alert("您已登录，无需重复登录");
            window.location.replace("../index.jsp");
        }
        function logon_check() {
            var name = document.getElementById("name").value;
            var password = document.getElementById("password").value;
            var check_password = document.getElementById("check_password").value;
            var phone = document.getElementById("phone").value;
            var address = document.getElementById("address").value;
            var realname = document.getElementById("realname").value;
            if(name === ""){
                alert("用户名为空");
                return false;
            }
            if(password !== check_password){
                alert("密码输入不一致");
                return false;
            }
            if(phone === ""){
                alert("手机号为空");
                return false;
            }
            if(address === ""){
                alert("收货地址为空");
                return false;
            }
            if(realname === ""){
                alert("收件人为空");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <p id="title">注册</p>
    <form id="logon_form" method="post" action="logon_check.jsp" onsubmit="return logon_check()">
        用户名：<br/><input class="logon_form_cell" id="name" type="text" name="name"/><br/>
        密码：<br/><input class="logon_form_cell" id="password" type="password" name="password"><br/>
        确认密码：<br/><input class="logon_form_cell" id="check_password" type="password"/><br/>
        手机号：<br/><input class="logon_form_cell" id="phone" type="text" name="phone"/><br/>
        收货地址：<br/><input class="logon_form_cell" id="address" type="text" name="address"/><br/>
        收件人：<br/><input class="logon_form_cell" id="realname" type="text" name="realname"/><br/>
        <input type="submit" value="注册">
    </form>
</body>
</html>
