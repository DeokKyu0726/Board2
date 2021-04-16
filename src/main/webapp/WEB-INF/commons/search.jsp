<%--
  Created by IntelliJ IDEA.
  User: hyun
  Date: 2021/04/16
  Time: 6:59 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function search() {
        var arr = new Array();
        var k = 0;
        var search_place = new String();
        search_place = document.getElementById('search_place').value;

        // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
        var bounds = new kakao.maps.LatLngBounds();

        if (search_place == ''){
            //검색단어가 없다면 키워드입력 요청
            alert("키워드를 입력해주세요.");
            return 0;
        } else{
            //검색단어가 있다면 모든 마커 삭제
            remove_markers();
        }

        for (var i = 0; i < positions.length; i++) {
            //검색어를 position배열에 담겨있는 title과 비교
            if(positions[i].title.search(search_place) == -1){

            } else {
                //동일한 검색어가 있다면 해당 마커 지도에 나타내기.
                markers[i].setMap(map);

                //보여주고싶은 마커의 위도경도정보를 지도범위를 재설정할 bounds객체에 담는다.
                bounds.extend(positions[i].latlng);
                arr[k] = positions[i].title;
                k++;
            }
        }

        if(k == 0){
            // 검색결과가 없다면 다시 모든 마커 표시하기
            add_markers();
            alert("검색결과에 없습니다.");
        } else{
            //지도 범위 재설정 및 와이파이 갯수 알림
            map.setBounds(bounds);
            alert("공공와이파이를 "+k+"개 찾았습니다.");
        }
    }

    //마커 전체를 지우는 함수
    function remove_markers(){
        for(var v=0; v<markers.length; v++){
            markers[v].setMap(null);
        }
    }

    //마커 전체를 표시하는 함수
    function add_markers(){
        for(var v=0; v<markers.length; v++){
            markers[v].setMap(map);
        }
    }
</script>
