<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>





<div id="map" style="width:50%; height: 50%;">

</div>
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
