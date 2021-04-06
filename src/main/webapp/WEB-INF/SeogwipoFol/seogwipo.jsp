<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/wifi.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>



<style>
    #nav { font-family:'arial'; margin-top: 10px;}
    #nav ul{ width:100%; margin:0; padding:0; }
    #nav ul.city_menu li{ float:left; width:100%; list-style-type:none; font-size:30px;}
    #nav ul.city_menu li a{ color: black;}
</style>

<%--<div id="nav" style="width:100%">--%>
<%--    <ul class="city_menu">--%>
<%--        <form>--%>
<%--        <li><a href="#"></a>--%>
<%--            <select class="sub">--%>
<%--                <option><a href="#">안덕면</a></option>--%>
<%--                <option><a href="#">천지동</a></option>--%>
<%--                <option><a href="#">Deacheon-dong</a></option>--%>
<%--                <option><a href="#">Deajeong-eub</a></option>--%>
<%--                <option><a href="#">Dearyun-dong</a></option>--%>
<%--                <option><a href="#">Donghong-dong</a></option>--%>
<%--                <option><a href="#">Hyodon-dong</a></option>--%>
<%--                <option><a href="#">Jeongbang-dong</a></option>--%>
<%--                <option><a href="#">Jongang-dong</a></option>--%>
<%--                <option><a href="#">Joongmoon-dong</a></option>--%>
<%--                <option><a href="#">Namwon-eub</a></option>--%>
<%--                <option><a href="#">Pyoseon-myun</a></option>--%>
<%--                <option><a href="#">Seohong-dong</a></option>--%>
<%--                <option><a href="#">Seongsan-eub</a></option>--%>
<%--                <option><a href="#">Songsan-dong</a></option>--%>
<%--                <option><a href="#">Yearea-dong</a></option>--%>
<%--                <option><a href="#">Yeongcheon-dong</a></option>--%>
<%--            </select>--%>
<%--        </li>--%>
<%--        </form>--%>
<%--    </ul>--%>
<%--</div>--%>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#nav ul.sub").hide();
        $("#nav ul.city_menu li").click(function () {
            $("ul", this).slideToggle("fast");
        });
    });
</script>

<div id="map" style=" width:100%; height: 93%;"></div>

<button onclick="setOverlayMapTypeId('traffic')">교통정보 보기</button>
<button onclick="setOverlayMapTypeId('roadview')">로드뷰 도로정보 보기</button>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=823225c9f117d22aaa31fc6556d5bca7"></script>

<script>

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.25626, 126.55924), // 지도의 중심좌표
            level: 8 // 지도의 확대 레벨
        };
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


   // ----------------------------------------------------------%%%%아래서부터 주석이 끝나는 부분까지는 현재위치를 표시하는 기능임 이건  릴리즈시 주석해제%%%%%%%%%%%%*-----------------------------------------/
   //  //현재위치
   //  // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
   //  if (navigator.geolocation) {
   //
   //      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
   //      navigator.geolocation.getCurrentPosition(function(position) {
   //
   //          var lat = position.coords.latitude, // 위도
   //              lon = position.coords.longitude; // 경도
   //
   //          var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
   //              message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
   //
   //          // 마커와 인포윈도우를 표시합니다
   //          displayMarker(locPosition, message);
   //
   //      });
   //
   //  } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
   //
   //      var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
   //          message = 'geolocation을 사용할수 없어요..'
   //
   //      displayMarker(locPosition, message);
   //  }
   //
   //  // 지도에 마커와 인포윈도우를 표시하는 함수입니다
   //  function displayMarker(locPosition, message) {
   //
   //      // 마커를 생성합니다
   //      var marker = new kakao.maps.Marker({
   //          map: map,
   //          position: locPosition
   //      });
   //
   //      var iwContent = message, // 인포윈도우에 표시할 내용
   //          iwRemoveable = true;
   //
   //      // 인포윈도우를 생성합니다
   //      var infowindow = new kakao.maps.InfoWindow({
   //          content : iwContent,
   //          removable : iwRemoveable
   //      });
   //
   //      // 인포윈도우를 마커위에 표시합니다
   //      infowindow.open(map, marker);
   //
   //      // 지도 중심좌표를 접속위치로 변경합니다
   //      map.setCenter(locPosition);
   //  }



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

     String query = "select PLACE,LATITUDE,LONGTITUDE from seogwipo ";
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
            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image: markerImage, // 마커 이미지
            clickable: true
        });

        var iwContent = new kakao.maps.InfoWindow({
            content : positions[i].content// iwcontent 에 표시할 내용 (Place)

        }),iwRemoveable = true;

        var infowindow = new kakao.maps.InfoWindow({
            content: positions[i].title, // 인포윈도우에 표시할 내용
            removable : iwRemoveable
        });



        // kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
        // kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
        kakao.maps.event.addListener(marker, 'click', makeclick(map, marker, infowindow));

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
    // 마커클릭 시 iwcontent 창을 보여줌니다.
    function makeclick(map, marker, infowindow){
        return function(){
            infowindow.open(map, marker, infowindow);
        };
    }

////////////////////////////////////////////////지도 타입////////////////////////////////////


    // 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
    var currentTypeId;

    // 버튼이 클릭되면 호출되는 함수입니다
    function setOverlayMapTypeId(maptype) {
        var changeMaptype;

        // maptype에 따라 지도에 추가할 지도타입을 결정합니다
        if (maptype === 'traffic') {

            // 교통정보 지도타입
            changeMaptype = kakao.maps.MapTypeId.TRAFFIC;

        } else if (maptype === 'roadview') {
            // 로드뷰 도로정보 지도타입
            changeMaptype = kakao.maps.MapTypeId.ROADVIEW;
        }

        // 이미 등록된 지도 타입이 있으면 제거합니다
        if (currentTypeId) {
            map.removeOverlayMapTypeId(currentTypeId);
        }

        // maptype에 해당하는 지도타입을 지도에 추가합니다
        map.addOverlayMapTypeId(changeMaptype);

        // 지도에 추가된 타입정보를 갱신합니다
        currentTypeId = changeMaptype;
    }





    function submitc(){

        alert("test click");


        console.log("클릭함");
    }




</script>



