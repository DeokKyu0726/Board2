<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>




<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBR8nlPgvUI6vz1YNHIKpSBu6hj8k0HdJc&callback=initMap&region=kr"></script>

<p>구글맵</p>

<div id = "mapdiv">
    <div id="map"></div>
</div>

<input type="text" class="form-control form-join" id="address">
<button name="subject" class="btn btn-sucess" id="btn-mapchange" value="ssss">지도변경</button>
<br><br>



<script>

function initmap(){
    var latitude = 37.566536;
    var longitude = 126.97797;

    var seoul = {lat: latitude,lng: longitude};
    var map = new google.maps.map(document.getElementById('map'),
        {
            center: jeju,
            zoom: 15
        });

    console.log("sdsadasdsa");
}

</script>