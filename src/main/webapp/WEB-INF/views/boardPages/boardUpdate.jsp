<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>
    <h2>글 수정</h2>
    <form action ="/board/update" method="post" >
        <input type="hidden" name="id" value="${board.id}">
        <input type="text" name="boardTitle" value="${board.boardTitle}" placeholder="제목을 입력하세요"> <br>
        <input type="text" name="boardWriter" value="${sessionScope.loginEmail}" placeholder="작성자를 입력하세요" readonly> <br>
        <textarea name="boardContents" cols="30" rows="10">${board.boardContents}</textarea> <br>
        <input type="submit" value="작성">
    </form>
<%@include file="component/footer.jsp" %>
</body>
</html>
