<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

</head>
<body>
<%@include file="component/header.jsp" %>
<a href="/">Home</a>
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
    <c:choose>
        <c:when test="${board.boardWriter == sessionScope.loginEmail}">
            <tr>
                <td>
                    <button class="btn btn-dark" onclick="update_fn()">수정</button>
                </td>
                <td>
                    <button class="btn btn-dark" onclick="delete_fn()">삭제</button>
                </td>
            </tr>
        </c:when>
        <c:when test="${sessionScope.loginEmail == 'admin'}">
            <td>
                <button class="btn btn-dark" onclick="delete_fn()">삭제</button>
            </td>
        </c:when>
    </c:choose>
    </table>
    <div >
        <input type="text" id="comment-writer" value="${sessionScope.loginEmail}" placeholder="작성자" readonly><br>
        <textarea id="comment-contents" cols="30" rows="10"></textarea> <br>
        <button onclick="comment_fn()">댓글 작성</button>
    </div>
    <div id="comment-list-area" >
        <c:choose>
            <c:when test="${commentList == null}">
                <h3>작성된 댓글이 없습니다.</h3>
            </c:when>
            <c:otherwise>
                <table id="comment-list">
                    <tr>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>작성시간</th>
                        <th>삭제</th>
                    </tr>
                    <c:forEach items="${commentList}" var="comment">
                        <tr>
                            <td>${comment.commentWriter}</td>
                            <td>${comment.commentContents}</td>
                            <td>${comment.createdAt}</td>
                            <td><input type="button" onclick="commentDelete_fn(${comment.id},${board.id})" value="삭제"></td>
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
    const commentDelete_fn = (commentId,boardId) => {
        if(confirm("삭제하시겠습니까?")){
            const comment = commentId;
            const board = boardId;
            location.href = "/comment/delete?commentId="+comment+"&boardId="+board ;
        }else{
            alert("취소되었습니다.")
        }

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
                    output += "<td><input type=\"button\" onclick=\"commentDelete_fn("+res[i].id+",${board.id})\" value=\"삭제\"></td>";
                    output += "    </tr>\n";
                }
                output += "</table>";
                result.innerHTML = output;
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