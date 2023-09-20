<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
<%@include file="component/header.jsp" %>
    <h3 class="text-center mt-3">로그인</h3>
    <form action="/member/login" method="post" class="text-center mt -3">
        <input type="text" name="memberEmail" placeholder="이메일" class="rounded"><br>
        <input type="text" name="memberPassword" placeholder="비밀번호" class="rounded"><br>
        <input class="mt-3" type="submit" value="로그인">
    </form>
<%@include file="component/footer.jsp" %>
</body>
</html>
