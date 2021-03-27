<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css" />

<div class=menu>
    <a href="/"> <img src="resources/image/logo_1.png" style="height:100%; cursor: pointer"></a>
</div>

<div class=sub_menu><%--class 명에  fm은 메뉴 ID임--%>
    <a class="fm" href="/jejusi" >제주시</a>
    <a class="fm" href="/seogwipo">서귀포시</a>
</div>


<script>

  $(function() {
    $(document).ready(function() {
      getDate();
    });

    window.addEventListener("beforeunload", function(e) {
      clearInterval(setDate);
    });
    const setDate = setInterval(getDate, 1000);

    function getDate() {
      const date = new Date();
      const d = date.getFullYear() + '년' + ("0" + (date.getMonth() + 1)).slice(-2) + '월' + ("0" + date.getDate()).slice(-2) + '일';
      const h = ("0" + date.getHours()).slice(-2) + ':' + ("0" + date.getMinutes()).slice(-2) + ':' + ("0" + date.getSeconds()).slice(-2);
      $("#date").text(d);
      $("#hour").text(h);
    }

  });

</script>

