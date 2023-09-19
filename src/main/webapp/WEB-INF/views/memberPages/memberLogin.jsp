<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>
    <h2>로그인</h2>
    <form action="/member/login" method="post">
        <input type="text" name="memberEmail" placeholder="이메일"><br>
        <input type="text" name="memberPassword" placeholder="비밀번호"><br>
        <input type="submit" value="로그인">
    </form>
<%@include file="component/footer.jsp" %>
</body>
</html>
