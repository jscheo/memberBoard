<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<%@include file="component/nav.jsp"%>
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
        <c:if test="${sessionScope.loginEmail == 'admin'}">
            <td>
                <button class="btn btn-dark" onclick="delete_fn()">삭제</button>
            </td>
        </c:if>
    </table>
    <div>
        <input type="text" id="comment-writer" value="${sessionScope.loginEmail}" placeholder="작성자"><br>
        <textarea id="comment-contents" cols="30" rows="10"></textarea> <br>
        <button onclick="comment_fn()">댓글 작성</button>
    </div>
    <div id="comment-list-area">
        <c:choose>
            <c:when test="${commentList == null}">
                <h3>작성된 댓글이 없습니다.</h3>
            </c:when>
            <c:otherwise>
                <table id="comment-list">
                    <tr>
                        <td>작성자</td>
                        <td>내용</td>
                        <td>작성시간</td>
                        <td>삭제</td>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td>${comment.createdAt}</td>
                            <td>
                                <button onclick="commentDelete_fn('${comment.id}')">삭제</button>
                            </td>

                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const commentDelete_fn = (id) => {
        location.href="/comment/delete?id=" +id;
    }

    const comment_fn = () => {
        const commentWriter = document.getElementById("comment-writer").value;
        const commentContents = document.querySelector("#comment-contents").value;
        const boardId = '${board.id}';
        const result = document.getElementById("comment-list-area");
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                commentWriter: commentWriter,
                commentContents: commentContents,
                boardId: boardId
            },
            success: function (res) {
                console.log("리턴값", res);
                let output = "<table id=\"comment-list\">\n" +
                    "    <tr>\n" +
                    "        <th>작성자</th>\n" +
                    "        <th>내용</th>\n" +
                    "        <th>작성시간</th>\n" +
                    "        <th>삭제</th>\n" +
                    "    </tr>\n";
                for (let i in res) {
                    output += "    <tr>\n";
                    output += "        <td>" + res[i].commentWriter + "</td>\n";
                    output += "        <td>" + res[i].commentContents + "</td>\n";
                    output += "        <td>" + res[i].createdAt + "</td>\n";
                    output += "        <td><button onclick='commentDelete_fn()'>" + 삭제 + "</button></td>\n";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
                document.getElementById("comment-writer").value = "";
                document.getElementById("comment-contents").value = "";
            },
            error: function () {
                console.log("댓글 작성 실패");
            }
        });
    }
    const update_fn = () => {
        location.href = "/board/update?id=" + ${board.id};
    }

    const delete_fn = () => {
        location.href = "/board/delete?id=" + ${board.id};
    }
</script>
</html>
