<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>

    <h2>회원 정보 수정</h2>
    <form name="updateForm" action="/member/update" method="post">
        <input type="hidden" name="id" value="${member.id}">
        <input type="text" name="memberEmail" value="${member.memberEmail}" readonly><br>
        <input type="text" name="memberPassword" id="pass-check"><br>
        <input type="text" name="memberName" value="${member.memberName}"><br>
        <input type="text" name="memberMobile" value="${member.memberMobile}"><br>
        <input type="button" onclick="pass_check()" value="수정">
    </form>
</body>
<%@include file="component/footer.jsp" %>
<script>
    const pass_check= () =>{
        const inputPass = document.getElementById("pass-check").value;
        if(inputPass == ${member.memberPassword}){
            document.updateForm.submit();
        }else{
            alert("비밀번호가 틀립니다.");
        }
    }
</script>
</html>
