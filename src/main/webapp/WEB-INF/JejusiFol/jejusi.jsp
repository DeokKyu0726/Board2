<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>



<style>
    #nav { font-family:'arial'; margin-top: 10px;}
    #nav ul{ width:100%; margin:0; padding:0; }
    #nav ul.city_menu li{ float:left; width:100%; list-style-type:none; font-size:30px;}
    #nav ul.city_menu li a{ color: black;}
</style>

<div id="nav" style="width:100%">
    <ul class="city_menu">
        <form>
            <li><a href="#">동 선택</a>
                <select class="sub">
                    <option><a href="#">안덕면</a></option>
                    <option><a href="#">천지동</a></option>
                    <option><a href="#">Deacheon-dong</a></option>
                    <option><a href="#">Deajeong-eub</a></option>
                    <option><a href="#">Dearyun-dong</a></option>
                    <option><a href="#">Donghong-dong</a></option>
                    <option><a href="#">Hyodon-dong</a></option>
                    <option><a href="#">Jeongbang-dong</a></option>
                    <option><a href="#">Jongang-dong</a></option>
                    <option><a href="#">Joongmoon-dong</a></option>
                    <option><a href="#">Namwon-eub</a></option>
                    <option><a href="#">Pyoseon-myun</a></option>
                    <option><a href="#">Seohong-dong</a></option>
                    <option><a href="#">Seongsan-eub</a></option>
                    <option><a href="#">Songsan-dong</a></option>
                    <option><a href="#">Yearea-dong</a></option>
                    <option><a href="#">Yeongcheon-dong</a></option>
                </select>
            </li>
        </form>
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

<div id="map" style=" width:100%; height: 80%;"></div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=823225c9f117d22aaa31fc6556d5bca7"></script>

<script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.50695, 126.49295), // 지도의 중심좌표
            level: 8 // 지도의 확대 레벨
        };
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다





    // ----------------------------------------------------------%%%%아래서부터 주석이 끝나는 부분까지는 현재위치를 표시하는 기능임 이건  릴리즈시 주석해제%%%%%%%%%%%%*-----------------------------------------/
    // //현재위치
    // // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    // if (navigator.geolocation) {
    //
    //     // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    //     navigator.geolocation.getCurrentPosition(function(position) {
    //
    //         var lat = position.coords.latitude, // 위도
    //             lon = position.coords.longitude; // 경도
    //
    //         var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    //             message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
    //
    //         // 마커와 인포윈도우를 표시합니다
    //         displayMarker(locPosition, message);
    //
    //     });
    //
    // } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    //
    //     var locPosition = new kakao.maps.LatLng(33.273409, 126.703757),
    //         message = 'geolocation을 사용할수 없어요..'
    //
    //     displayMarker(locPosition, message);
    // }
    //
    // function displayMarker(locPosition, message) {
    //     // 마커를 생성합니다
    //     var marker = new kakao.maps.Marker({
    //         map: map,
    //         position: locPosition
    //     });
    //     var iwContent = message, // 인포윈도우에 표시할 내용
    //         iwRemoveable = true;
    //
    //     // 인포윈도우를 생성합니다
    //     var infowindow = new kakao.maps.InfoWindow({
    //         content : iwContent,
    //         removable : iwRemoveable
    //     });
    //
    //     // 인포윈도우를 마커위에 표시합니다
    //     infowindow.open(map, marker);
    //
    //     // 지도 중심좌표를 접속위치로 변경합니다
    //     map.setCenter(locPosition);
    // }


    // 마커를 표시할 위치와 title 객체 배열입니다


    var positions = [

        <%
 // 1. JDBC 드라이버 로딩
 Class.forName("org.mariadb.jdbc.Driver");

 Connection conn = null; // DBMS와 Java연결객체
 Statement stmt = null; // SQL구문을 실행
 ResultSet rs = null; // SQL구문의 실행결과를 저장

 try
 {
     String jdbcDriver = "jdbc:mariadb://127.0.0.1/wifi";
     String dbUser = "root";
     String dbPass = "root";

     String query = "select PLACE,LATITUDE,LONGTITUDE from jeju ";
     // 2. 데이터베이스 커넥션 생성
     conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
     // 3. Statement 생성
     stmt = conn.createStatement();
     // 4. 쿼리 실행
     rs = stmt.executeQuery(query);
     // 5. 쿼리 실행 결과 출력
     while(rs.next())
     {
%>
        {
            content: '<%= rs.getString("PLACE") %>',
            title: '<%= rs.getString("PLACE") %>',
            latlng: new kakao.maps.LatLng(<%= rs.getString("LATITUDE") %>,<%= rs.getString("LONGTITUDE") %>)
        },

        <%
     }
 }catch(SQLException ex){
     out.println(ex.getMessage());
     ex.printStackTrace();
 }finally{
     // 6. 사용한 Statement 종료
     if(rs != null) try { rs.close(); } catch(SQLException ex) {}
     if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}

     // 7. 커넥션 종료
     if(conn != null) try { conn.close(); } catch(SQLException ex) {}
 }
%>

    ];



    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

    for (var i = 0; i < positions.length; i ++) {

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35);

        // 마커 이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지
        });

        // 마커에 표시할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: positions[i].content // 인포윈도우에 표시할 내용
        });

        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
        // 이벤트 리스너로는 클로저를 만들어 등록합니다
        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    }

    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }
</script>



