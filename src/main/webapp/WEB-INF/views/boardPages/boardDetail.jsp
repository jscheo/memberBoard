<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>상세정보</h2>
    <div id="section">
        <table>
            <tr>
                <th>id</th>
                <td>${board.id}</td>
            <tr>
                <th>writer</th>
                <td>${board.boardWriter}</td>
            </tr>
            <tr>
                <th>date</th>
                <td>${board.createdAt}</td>
            </tr>
            <tr>
                <th>hits</th>
                <td>${board.boardHits}</td>
            </tr>
            <tr>
                <th>title</th>
                <td>${board.boardTitle}</td>
            </tr>
            <tr>
                <th>contents</th>
                <td>${board.boardContents}</td>
            </tr>
            <c:if test="${board.fileAttached == 1}">
                <tr>
                    <th>image</th>
                    <td>
                        <c:forEach items="${boardFileList}" var="boardFile">
                            <img src="${pageContext.request.contextPath}/upload/${boardFile.storedFileName}"
                                 alt="" width="100" height="100">
                        </c:forEach>
                    </td>
                </tr>
            </c:if>
            <c:if test="${board.boardWriter == sessionScope.loginEmail}">
            <tr>
                <td>
                    <button class="btn btn-dark" onclick="update_fn()">수정</button>
                </td>
                <td>
                    <button class="btn btn-dark" onclick="delete_fn()">삭제</button>
                </td>
            </tr>
            </c:if>
        </table>
</body>
<script>
    const update_fn = () =>{
        location.href = "/board/update?id=" + ${board.id};
    }

    const delete_fn = () =>{
        location.href = "/board/delete?id=" + ${board.id};
    }
</script>
</html>
