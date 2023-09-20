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
<h3>회원 목록</h3>
<a href="/">Home</a>
<table>
    <tr>
        <td>이메일</td>
        <td>비밀번호</td>
        <td>이름</td>
        <td>전화번호</td>
    </tr>
    <c:forEach items="${memberList}" var="member">
        <tr>
            <td>${member.memberEmail}</td>
            <td>${member.memberPassword}</td>
            <td>${member.memberName}</td>
            <td>${member.memberMobile}</td>
            <td>
                <button class="btn btn-warning"><a href="/member/delete?id=${member.id}">삭제</a></button>
            </td>
        </tr>
    </c:forEach>
</table>
<%@include file="component/footer.jsp" %>
</body>
</html>
