<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>글목록</h2>
<a href="/board/save">글작성</a>
<div class="container" id="list">
    <table class="table table-striped table-hover text-center">
        <tr>
            <td>글번호</td>
            <td>제목</td>
            <td>작성자</td>
            <td>내용</td>
            <td>조회수</td>
            <td>작성일자</td>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardWriter}</td>
                <td>${board.boardContents}</td>
                <td>${board.boardHits}</td>
                <td>${board.createdAt}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
