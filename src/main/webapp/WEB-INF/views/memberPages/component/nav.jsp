<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
  <ul class="menu">
    <li class="menu-item">
    <a href="/board/sample">데이터붓기</a>
    </li>
    <li class="menu-item">
      <a href="/">Home</a>
    </li>
    <li class="menu-item">
    <a href="/member/save">회원가입</a>
    </li>
<%--    <li class="menu-item">--%>
<%--    <a href='/member/login'>로그인</a>--%>
<%--    </li>--%>
    <li class="menu-item">
      <a href="/board/list">글목록</a>
    </li>
    <c:if test="${sessionScope.loginEmail != null}">
    <li class="menu-item">
      <a href="/memberPages/memberMain">마이페이지</a>
    </li>
    </c:if>
    <li class="menu-item" id="login-area">

    </li>
  </ul>
</div>
<script>
  const loginArea = document.getElementById("login-area");
  const loginEmail = '${sessionScope.loginEmail}';
  console.log(loginEmail.length);
  if(loginEmail.length != 0){
    //로그인 했음
    loginArea.innerHTML = "<a href ='/memberPages/memberMain'>" + loginEmail + "님 환영해요!</a>" +
            "<a href='/member/logout'>logout</a>";

  }else{
    //비로그인
    loginArea.innerHTML = "<a href='/member/login'>로그인</a>";
  }
</script>