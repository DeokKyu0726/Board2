<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/solar.css" />
<div class="menu-wrapper">
  <div class="sections clearfix">


    <div class="menu-container">
      <li class="menu">
        <a href="/">
          <p class="name">시작</p>
        </a>
      </li>
      <li class="menu">
        <a href="/board">
          <p class="name">게시판</p>
        </a>
      </li>
      <li class="menu">
        <a href="/notepad">
          <p class="name">연습장</p>
        </a>
      </li>
      <li class="menu">
        <a href="/fighting">
          <p class="name">화이팅</p>
        </a>
      </li>
      <li class="menu">
        <a href="/programming">
          <p class="name">프로그래밍</p>
        </a>
      </li>
      <li class="menu">
        <a href="/academy">
          <p class="name">학원</p>
        </a>
      </li>

      <div class="date">
        <span id="date" class="txt">2020년05월15일</span>
      </div>

      <div class="date">
        <span id="hour" class="txt">16:56:00</span>
      </div>

    </div>
  </div>
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

