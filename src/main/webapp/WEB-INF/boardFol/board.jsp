<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>

<div class=menu>
    <div class="hamburger-icon">
        <div class="hamburger-icon__middle"></div>
    </div>
    <a href="/"> <img src="resources/image/logo_1.png" style="height:100%; cursor: pointer"></a>
</div>

<div class=sub_menu>
    <div class="close-icon"> X</div>
    <ul>
        <li><a class="fm" href="/jejusi">제주시</a></li>
        <li><a class="fm" href="/seogwipo">서귀포시</a></li>
        <li><a class="fm" href="/board">건의사항</a></li>
    </ul>
</div>

<center>
    <table class="board" border="1">
        <caption> 건의사항</caption>
        <colgroup>
            <col width=10%>
            <col width=60%>
            <col width=10%>
            <col width=20%>
        </colgroup>

        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td class="index">0</td>
            <td class="title">게시판 제목</td>
            <td class="name">글쓴이</td>
            <td class="date">날짜</td>
        </tr>
        </tbody>
    </table>
</center>
<div class="button">
    <p>
        <input type="button" onclick="location.href='/boardForm'" value="글쓰기">
    </p>
</div>

<script>
        $(function () {
            /*햄버거 메뉴 클릭 */
            $('.hamburger-icon').click(function () {
                $('.sub_menu').addClass("open");
            });

            $('.close-icon').click(function () {
                $('.sub_menu').removeClass("open");
            });
        });

        function submitc(){
            alert("test click");
            console.log("클릭함");
        }

</script>

