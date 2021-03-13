<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css" />

 <div class = menu>
   <ul> <%--class 명에 fm은 메뉴 ID임--%>
       <a href="/"> <img src="resources/image/logo.png" style="width: 100px; float: left;cursor: pointer"></a>
     <li><a class="fm" href="/board">시작</a></li>
     <li><a class="fm" href="/notepad">연습장</a></li>
     <li><a class="fm" href="/fighting">화이팅</a></li>
     <li><a class="fm" href="/programming">프로그래밍</a></li>
     <li><a class="fm" href="/academy">학원</a></li>
       <li><a class="fm"> <span id="date" class="txt">2020년05월15일</span>
           <span id="hour" class="txt">2020년05월15일</span></a></li>
   </ul>
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

