<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>
<h2>마이페이지</h2>
<ul>
    <li>
        <a href="/">Home</a>
    </li>
    <c:if test="${sessionScope.loginEmail == 'admin'}">
        <li class="menu-item">
            <a href="/member/admin">관리자 메뉴</a>
        </li>
    </c:if>
    </li>
    <li>
        <button class="btn btn-warning" onclick="update_fn()">회원정보 수정</button>
    </li>
    <li>
        <a href="/member/memberDelete?memberEmail=${sessionScope.loginEmail}">회원 탈퇴</a>
    </li>
</ul>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const update_fn = () => {
        const updateMember = '${sessionScope.loginEmail}';
        location.href = "/member/update?memberEmail=" + updateMember;
    }
</script>
</html>
