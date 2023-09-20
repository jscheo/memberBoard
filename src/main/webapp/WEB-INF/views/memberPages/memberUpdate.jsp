<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>
<%@include file="component/header.jsp" %>

    <h3 class="text-center fw-semibold">회원 정보 수정</h3>
    <form name="updateForm" action="/member/update" method="post" class="text-center">
        <input type="hidden" name="id" value="${member.id}" class="rounded">
        <input type="text" name="memberEmail" value="${member.memberEmail}" readonly class="rounded"><br>
        <input type="text" name="memberPassword" id="pass-check" class="rounded"><br>
        <input type="text" name="memberName" value="${member.memberName}" class="rounded"><br>
        <input type="text" name="memberMobile" value="${member.memberMobile}" class="rounded"><br>
        <input class="rounded mt-2" type="button" onclick="pass_check()" value="수정">
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
