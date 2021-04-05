<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css" />

<div class=menu>
    <div class="hamburger-icon">
        <div class="hamburger-icon__middle"></div>
    </div>
    <a href="/"> <img src="resources/image/logo_1.png" style="height:100%; cursor: pointer"></a>
</div>

<div class="search">
    <input type="text" name="search" placeholder="장소,주소 검색">
</div>

<div class=sub_menu>
        <div class="close-icon"> X</div>
    <ul>
        <li><a class="fm" href="/jejusi">제주시</a></li>
        <li><a class="fm" href="/seogwipo">서귀포시</a></li>
        <li><a class="fm" href="/board">건의사항</a></li>
    </ul>
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
</script>

