<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
<%@include file="component/header.jsp" %>
    <h2 class="text-center fw-semibold">글 수정</h2>
    <form action ="/board/update" method="post" enctype="multipart/form-data" class="text-center" >
        <input type="hidden" name="id" value="${board.id}">
        <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요" class="rounded"> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" placeholder="작성자를 입력하세요" readonly class="rounded mt-2"> <br>
        <textarea class="rounded mt-2" name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
        <input class="mt-2" type="file" name="boardFile" multiple ><br>
        <input class="mt-2" type="submit" value="작성">
    </form>
<%@include file="component/footer.jsp" %>
</body>
</html>
