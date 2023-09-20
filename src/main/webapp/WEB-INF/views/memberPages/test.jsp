<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<!--좋아요 버튼-->
<button class="like__btn" data-board-id="${board.boardId}">
    <span name="icon" id="icon"><i class="far fa-thumbs-up"></i></span>
    <span name="likeCount" id="likeCount">0</span> Like
</button>
<!--좋아요 버튼-->
</body>
<script>
    //좋아요 버튼 동작 정의
    const likeBtn = document.querySelector(".like__btn");
    let likeIcon = document.querySelector("#icon");
    let likeCount = document.querySelector("#likeCount");
    const boardId = "${board.boardId}";

    // let isClicked = false;

    likeBtn.addEventListener("click", () => {
        $.ajax({
            url: "/Like/like",
            type: "POST",
            data: {boardId: boardId},
            success: function (res) {
                if (res.success) {
                    likeCount.textContent = res.likeCount;
                    likeIcon.innerHTML = res.isClicked ? `<i class="fas fa-thumbs-up"></i>` : `<i class="far fa-thumbs-up"></i>`;
                    // } else {
                    //   alert(res.message);
                    // }
                }
            },
            error: function (error) {
                console.log(error);
                alert("An error occurred");
            }
        });
    });
    //좋아요 버튼 동작 정의 끝
</script>
</html>
