<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<h3 class="text-center fw-semibold">글 작성</h3>
    <form action="/board/save" method="post" enctype="multipart/form-data" class="text-center ">
        <input type="text" name="boardTitle" placeholder="제목을 입력하세요" class="rounded"> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" placeholder="작성자를 입력하세요" class="rounded mt-2"> <br>
        <textarea name="boardContents" cols="30" rows="10" class="rounded mt-2"></textarea> <br>
        <input class="mt-2" type="file" name="boardFile" multiple> <br>
        <input class="mt-2" type="submit" value="작성" class="rounded">
    </form>

<%@include file="component/footer.jsp" %>
</body>
</html>
