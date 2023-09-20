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
<h3 class="text-center">MyPage</h3>
<h4 class="ms-3">${sessionScope.loginEmail} 님 안녕하세요</h4>
<ul>
    <li>
        <a class="text-decoration-none" href="/">Home</a>
    </li>
    <c:if test="${sessionScope.loginEmail == 'admin'}">
        <li>
            <a class="text-decoration-none" href="/member/admin">관리자 메뉴</a>
        </li>
    </c:if>
    </li>
    <c:if test="${sessionScope.loginEmail != 'admin'}">
    <li>
        <a class="text-decoration-none" href="/member/update?memberEmail=${sessionScope.loginEmail}">회원정보 수정</a>
    </li>
    </c:if>
    <li>
        <a class="text-decoration-none" href="/member/memberDelete?memberEmail=${sessionScope.loginEmail}">회원 탈퇴</a>
    </li>
</ul>
<%@include file="component/footer.jsp" %>
</body>
</html>
