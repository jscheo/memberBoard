<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>
<%@include file="component/header.jsp" %>
    <h2>회원가입</h2>
    <form action="/member/save" method="post" enctype="multipart/form-data">
        <input type="text" name="memberEmail" id="emailCheck" onkeyup="email_check()" placeholder="이메일"><br>
        <p id="email-check-area"></p>
        <input type="text" name="memberPassword" id="passCheck" onkeyup="pass_check()" placeholder="비밀번호"><br>
        <P id="pass-check-area"></P>
        <input type="text" name="memberName" placeholder="이름"><br>
        <input type="text" name="memberMobile" placeholder="전화번호"><br>
        <input type="file" name="memberFile" multiple><br>
            <input type="submit"  value="가입">
    </form>
<%@include file="component/footer.jsp" %>
</body>
<script>
    const pass_check=()=>{
        const inputPass = document.getElementById("passCheck").value;
        const passArea = document.getElementById("pass-check-area");
        let check = /^[0-9]+$/;
        if(!check.test(inputPass)){
            passArea.style.color = "red";
            passArea.innerHTML = "숫자만 입력가능합니다.";
        }else{
            passArea.style.color = "green";
            passArea.innerHTML = "사용가능한 비밀번호입니다."
        }
    }
    const email_check=()=>{
        const inputEmail = document.getElementById("emailCheck").value;
        const emailArea = document.getElementById("email-check-area");
        $.ajax({
            type:"get",
            url:"/member/check",
            data:{memberEmail : inputEmail},
            success  : function (res){
                if(res == "yes"){
                    emailArea.style.color="green";
                    emailArea.innerHTML = " 이메일 사용가능";
                }else{
                    emailArea.style.color = "red";
                    emailArea.innerHTML= "이메일이 중복되었습니다.";
                }
            }
        });
    }
</script>
</html>
