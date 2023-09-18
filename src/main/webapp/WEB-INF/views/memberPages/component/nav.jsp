<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
  <ul class="menu">
    <li class="menu-item">
      <a href="/">Home</a>
    </li>
    <li class="menu-item">
      <a href="/board/list">글목록</a>
    </li>
    <li>
      <a href="/board/save">글 작성</a>
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
    <!--          <li class="menu-item">-->
    <!--              <a href="/login">로그인</a>-->
    <!--          </li>-->
    <%--    <li class="menu-item">--%>
    <%--      <a href="/members">회원목록</a>--%>
    <%--    </li>--%>
    <!-- 로그인 여부에 따라 로그인했으면 oo님 환영합니다. 로그아웃링크 보이고
         로그인 하지 않았으면 로그인이 보이도록
    -->
    <li class="menu-item" id="login-area">

    </li>
  </ul>
</div>
<script>
  const update_fn = () =>{
    const updateMember = '${sessionScope.loginEmail}';
    location.href ="/member/update?memberEmail=" + updateMember;
  }


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