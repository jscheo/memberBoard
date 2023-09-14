<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>마이페이지</h2>
    <p>${sessionScope.loginEmail} 님 환영합니다.</p>
    <a href="/board/list">글 목록</a>
    <a href="/member/logout">로그아웃</a>

</body>
</html>
