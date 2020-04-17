<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="SQLUpdate" scope="page" class="bean.sql"/>
<html>
<head>
    <title>Title</title>
    <link href="../css/add_book.css" rel="stylesheet">
    <script language="JavaScript">
        function add_check() {
            var title = document.getElementById("title").value;
            var author = document.getElementById("author").value;
            var publish = document.getElementById("publish").value;
            var type = document.getElementById("type").value;
            var introduction = document.getElementById("introduction").value;
            var price = document.getElementById("price").value;
            var file = document.getElementById("imgsrc").files[0];
            document.getElementById("imgsrc").value = file["name"];
            var imgsrc = document.getElementById("imgsrc").value;
            var dataList = [title, author, publish, type, introduction, price, imgsrc];
            var titleList = ["书名", "作者", "出版社", "类型", "简介", "价格", "图片"];
            for(var i=0; i<dataList.length; i++){
                if(dataList[i] === ""){
                    alert(titleList[i]+"不能为空");
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body id="bg">
    <p id="add_title">添加书籍</p>
    <form id="add_book_form" method="post" action="./add_book_action.jsp" onsubmit="return add_check()">
        书名：<br/><input class="add_form_cell" id="title" type="text" name="title"/><br/>
        作者：<br/><input class="add_form_cell" id="author" type="text" name="author"><br/>
        出版社：<br/><input class="add_form_cell" id="publish" type="text" name="publish"/><br/>
        类型：<br/>
                <select id="type" name="type">
                    <%
                        String[] types = {"数学", "历史", "计算机", "中文小说", "英文小说"};
                        for(String type:types){
                            out.print("<option>"+ type +"</option>");
                        }
                    %>
                </select>
              <br/>
        简介：<br/><textarea id="introduction" name="introduction"></textarea><br/>
        售价：<br/><input class="add_form_cell" id="price" type="text" name="price"/><br/>
        图片：<br/><input id="imgsrc" type="file" name="imgsrc"><br/>
        <input type="submit" value="添加书籍">
    </form>
    <%

    %>
</body>
</html>
