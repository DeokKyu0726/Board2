<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>



<style>
    #nav { font-family:'arial'; margin-top: 10px; margin-bottom: 10px;}
    #nav ul{ width:100%; margin:0; padding:0; }
    #nav ul.city_menu li{ float:left; width:100%; list-style-type:none; font-size:30px;}
    #nav ul.city_menu li a{ color: black;}
</style>

<div id="nav" style=" width:100%">
    <ul class="city_menu">
        <li><a href="#">서귀포시</a>
            <ul class="sub">
                <li><a href="#">SUB MENU 2-1</a></li>
                <li><a href="#">SUB MENU 2-2</a></li>
                <li><a href="#">SUB MENU 2-3</a></li>
            </ul>
        </li>
    </ul>
</div>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#nav ul.sub").hide();
        $("#nav ul.city_menu li").click(function () {
            $("ul", this).slideToggle("fast");
        });
    });
</script>

<div id="map" style=" width:100%; height: 70%;"></div>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBR8nlPgvUI6vz1YNHIKpSBu6hj8k0HdJc&callback&callback=initMap&region=kr"></script>
<script>
    function initMap() {
        var jeju = { lat: 33.5101562 ,lng: 126.4861157 }; /*제주공항*/
        var map = new google.maps.Map(
            document.getElementById('map'), {
                zoom: 13,
                center: jeju
            });

        new google.maps.Marker({
            position:jeju,
            map : map,
            label: "제주공항"
        })



    }
</script>




