<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>


<div id="map">

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBR8nlPgvUI6vz1YNHIKpSBu6hj8k0HdJc&callback=initMap"></script>

<script>


    function showmap(){
        var e = document.getElementById('map');
        new google.maps.Map(e, {center:{lat:37.562161, lng:127.035199}, zoom:14})

    }
    function  showMarker(){
        var e = document.getElementById('map');

        var jeju= new google.maps.LatLng(37.562161, 127.035199);

        var opts= {
            center: jeju,
            zoom: 14
        }


        new google.maps.Map(e,opts);
    }



</script>





