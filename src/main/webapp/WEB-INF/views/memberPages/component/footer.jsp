<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="footer" class="text-center">

</div>
<script>
    const date = new Date();
    console.log(date);
    console.log(date.getFullYear());
    const footer = document.getElementById("footer");
    const footer1 = document.querySelector("#footer");
    footer.innerHTML = "<p>&copy; " + date.getFullYear() + "&nbsp; Hello everyone All rights reseves";
</script>