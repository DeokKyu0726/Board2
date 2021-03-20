<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>


<table border=0 cellpadding=0 cellspacing=0 width="100%">
    <tr>
        <td width="30%" height="600px" bgcolor="#FFBB00" align=center>
            <ul class="menu">
                <li><a href="#">제주시</a>
                    <ul class="sub">
                        <li><a href="#">SUB MENU 1-1</a></li>
                        <li><a href="#">SUB MENU 1-2</a></li>
                    </ul>
                </li>
                <li><a href="#">서귀포시</a>
                    <ul class="sub">
                        <li><a href="#">SUB MENU 2-1</a></li>
                        <li><a href="#">SUB MENU 2-2</a></li>
                        <li><a href="#">SUB MENU 2-3</a></li>
                    </ul>
                </li>
            </ul>
        </td>
        <td id="map" width="70%" bgcolor="#8BBDFF" align=center></td>
    </tr>
    <tr>
        <td width="100%" height="20%" bgcolor="#FD65E9" colspan="2" align=center>광고쓰</td>
    </tr>
</table>


<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBR8nlPgvUI6vz1YNHIKpSBu6hj8k0HdJc&callback&callback=initMap&region=kr"></script>

<script>
    function initMap() {
        var jeju = { lat: 33.5101562 ,lng: 126.4861157 };
        var map = new google.maps.Map(
            document.getElementById('map'), {
                zoom: 13,
                center: jeju
            });

    }
</script>




