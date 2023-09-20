<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<%@include file="component/header.jsp" %>
    <h3 class="text-center mt-3">로그인</h3>
    <form name="loginForm" action="/member/login" method="post" class="text-center mt -3">
        <input type="text" name="memberEmail" id="loginEmail" placeholder="이메일" class="rounded"><br>
        <input type="text" name="memberPassword" id="loginPassword" placeholder="비밀번호" class="rounded mt-2"><br>
        <input class="mt-3" type="button" onclick="loginCheck()" value="로그인">
    </form>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const loginCheck = () =>{
        const memberEmail = document.getElementById("loginEmail").value;
        const memberPassword = document.getElementById("loginPassword").value;
        $.ajax({
            type :"get",
            url : "/member/loginCheck",
            data :{
                memberEmail : memberEmail,
                memberPassword : memberPassword
            },
            success : function (res){
                if(res =="yes"){
                   document.loginForm.submit();
                }else{
                    alert("아이디 또는 비밀번호가 틀렸습니다.")
                }
            }

        });

    }
</script>
</html>
