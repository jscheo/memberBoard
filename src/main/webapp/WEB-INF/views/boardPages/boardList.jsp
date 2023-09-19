<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp"%>
    <h2>글목록</h2>
    <a href="/board/save">글작성</a>
    <a href="/">Home</a>
    <c:if test="${sessionScope.loginEmail != null}">
    <a href="/member/main">마이페이지</a>
    </c:if>
<div id="section">
    <div class="container">
        <form action="/board/list" method="get">
            <select name="type">
                <option value="boardTitle">제목</option>
                <option value="boardWriter">작성자</option>
            </select>
            <input type="text" name="q" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
        <form action="/board/list" method="get">
            <input type="text" name="countPage" placeholder="출력할 페이지 수 입력하세요">
            <input type="submit" value="입력">
        </form>
    </div>
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
                    <td><a href="/board/detail?id=${board.id}&page=${paging.page}&q=${q}&type=${type}">${board.boardTitle}</a></td>
                    <td>${board.boardWriter}</td>
                    <td>${board.boardContents}</td>
                    <td>${board.boardHits}</td>
                    <td>${board.createdAt}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div class="container">
        <ul class="pagination justify-content-center">
            <c:choose>
                <c:when test="${paging.page<=1}">
                    <li class="page-item disabled">
                        <a class="page-link">[이전]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page?=${paging.page-1}&q=${q}&type=${type}">[이전]</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq paging.page}">
                        <li class="page-item active">
                            <a class="page-link">${i}</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a class="page-link" href="/board/list?page=${i}&q=${q}&type=${type}">${i}</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${paging.page >= paging.maxPage}">
                    <li class="page-item disabled">
                        <a class="page-link">[다음]</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a href="/board/list?page=${paging.page + 1}&q=${q}&type=${type}">[다음]</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<%@include file="component/footer.jsp" %>
</body>
</html>
