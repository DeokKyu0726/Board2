<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<jsp:include page="/WEB-INF/commons/menu.jsp"/>

<script>
    window.onload = function(){
        $('#index_select').addClass("active");
    }
</script>

<script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.25626, 126.55924), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


    // ----------------------------------------------------------%%%%아래서부터 주석이 끝나는 부분까지는 현재위치를 표시하는 기능임 이건  릴리즈시 주석해제%%%%%%%%%%%%*-----------------------------------------/
    //현재위치
    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: iwContent,
            removable: iwRemoveable
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }


    // 마커를 표시할 위치와 title 객체 배열입니다


<%--    var positions = [--%>

<%--        <%--%>
<%-- // 1. JDBC 드라이버 로딩--%>
<%-- Class.forName("org.mariadb.jdbc.Driver");--%>

<%-- Connection conn = null; // DBMS와 Java연결객체--%>
<%-- Statement stmt = null; // SQL구문을 실행--%>
<%-- ResultSet rs = null; // SQL구문의 실행결과를 저장--%>

<%-- try--%>
<%-- {--%>
<%--     String jdbcDriver = "jdbc:mariadb://127.0.0.1/wifi";--%>
<%--     String dbUser = "root";--%>
<%--     String dbPass = "root";--%>

<%--     String query = "select PLACE,LATITUDE,LONGTITUDE from seogwipo ";--%>
<%--     // 2. 데이터베이스 커넥션 생성--%>
<%--     conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);--%>
<%--     // 3. Statement 생성--%>
<%--     stmt = conn.createStatement();--%>
<%--     // 4. 쿼리 실행--%>
<%--     rs = stmt.executeQuery(query);--%>
<%--     // 5. 쿼리 실행 결과 출력--%>
<%--     while(rs.next())--%>
<%--     {--%>
<%--%>--%>
<%--        {--%>
<%--            content: '<%= rs.getString("PLACE") %>',--%>
<%--            title: '<%= rs.getString("PLACE") %>',--%>
<%--            latlng: new kakao.maps.LatLng(<%= rs.getString("LATITUDE") %>, <%= rs.getString("LONGTITUDE") %>)--%>
<%--        },--%>
<%--        <%--%>
<%--     }--%>
<%-- }catch(SQLException ex){--%>
<%--     out.println(ex.getMessage());--%>
<%--     ex.printStackTrace();--%>
<%-- }finally{--%>
<%--     // 6. 사용한 Statement 종료--%>
<%--     if(rs != null) try { rs.close(); } catch(SQLException ex) {}--%>
<%--     if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}--%>

<%--     // 7. 커넥션 종료--%>
<%--     if(conn != null) try { conn.close(); } catch(SQLException ex) {}--%>
<%-- }--%>
<%--%>--%>
<%--    ];--%>

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
    for (var i = 0; i < positions.length; i++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage, // 마커 이미지
            clickable: true
        });

        var infowindow = new kakao.maps.InfoWindow({
            content: positions[i].content // 인포윈도우에 표시할 내용
        });
        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    }

    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
    function makeOverListener(map, marker, infowindow) {
        return function () {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
    function makeOutListener(infowindow) {
        return function () {
            infowindow.close();
        };

    }

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    function search(){
        alert("ok");
        // 키워드로 장소를 검색합니다
        ps.keywordSearch(String(document.search_place), placesSearchCB);
    }

    // 키워드 검색 완료 시 호출되는 콜백함수 입니다
    function placesSearchCB (data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            var bounds = new kakao.maps.LatLngBounds();

            for (var i=0; i<data.length; i++) {
                displayMarker(data[i]);
                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
            }

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }
    }

</script>


