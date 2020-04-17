<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.inc"%>
<jsp:useBean id="SQLSearch" scope="page" class="bean.sql"/>
<html>
<head>
    <title>留言</title>
    <link href="../css/message.css" rel="stylesheet">
    <script language="javascript">
        function message_submit() {
            var username = "<%=session.getAttribute("name")%>";
            var message = document.getElementById("message_area").value;
            if(message === ""){
                alert("留言不能为空");
                return false;
            }
            if(username === "null"){
                alert("只有登录用户才能留言");
                window.location.replace("message.jsp");
                return false;
            }else{
                return true;
            }
        }
    </script>
</head>
<body>
    <p id="title">留言</p>
    <form id="message_form" action="submit.jsp" onsubmit="return message_submit()">
        <textarea id="message_area" name="user_message"></textarea>
        <br/>
        <input id="submit_button" type="submit" value="发表">
    </form>
    <a href="cancel.jsp">
        <button id="cancel_button">删除我的留言</button>
    </a>
    <table id="message_table">
        <%
            String SQLstr = "SELECT * FROM message";
            ResultSet rs = SQLSearch.executeQuery(SQLstr);
            try{
                while(rs.next()){
                    out.print(
                            "<tr>"+
                            "<td class=\"name_td\">" + rs.getString("userID") + "</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=\"message_td\">" + rs.getString("message") + "</td>"+
                            "</tr>"
                    );
                }
                rs.close();
            }catch (java.sql.SQLException ex){
                System.out.println(ex.getMessage());
            }
        %>
    </table>
</body>
</html>
