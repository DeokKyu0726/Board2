<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%--DB import 부분--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>


<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/semantic.min.css">
<jsp:include page="/WEB-INF/commons/submenu.jsp"/>



<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui large form">
            <div class="ui stacked segment">
                <table class="ui celled table">

                    <thead>
                    <tr>
                        <td>INX</td>
                        <td>닉네임</td>
                        <td>제목</td>
                        <td>게시시간</td>
                    </tr>
                    <%

   Class.forName("org.mariadb.jdbc.Driver");

    String url = "jdbc:mariadb://127.0.0.1/wifi";
    String mysql_id = "root";
    String mysql_pw = "root";
    int total = 0;



    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도
      Statement stmt = conn.createStatement();
      String totalSql = "select count(*) from board;";  // 총 글갯수를 찾는 sql문
      ResultSet rs = stmt.executeQuery(totalSql);



      if(rs.next()){            // 결과가 있다면 true값을 반환합니다

        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입

      }



      // total은 나중에 페이징 처리시 사용



      String listSql = "select board_no,board_nick,board_date,board_content from board;"; // 전체 리스트를 가져오는 sql문

      rs = stmt.executeQuery(listSql);



      // try catch에서 오류가없을시에 출력되는 내용입니다

  %>
                    <%

  // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

    if(total==0){

  %>

                        <tr>

                            <td>게시글이 존재하지 않습니다</td>

                        </tr>

                        <%

                            // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

                        } else{

                            while(rs.next()){ //rs값이 있을때까지 반복합니다.

                                int board_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.

                                String board_nick = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.

                                String board_date = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.

                                String board_content = rs.getString(4);

                                // 실제 리스트가 출력되는 부분 입니다.

                        %>

                        <tr>

                            <td><%=board_no%></td>
                            <td><%=board_nick%></td>
                            <td><%=board_content%></td>
                            <td><%=board_date%></td>
                        </tr>
                        <%
                                    }
                                }
                                rs.close();
                                conn.close();
                                stmt.close();
                            }catch(SQLException e){
                                out.println(e.toString());
                            }
                        %>
                    </thead>
                </table>

            </div>

            <a href="/boardForm"><button class="ui fluid large teal submit button">게시글 작성하기</button></a>

            <div class="ui error message"></div>

        </div>
    </div>
</div>

<div class="ui modal" id='view_modal'>
    <i class="close">x</i>
    <div class="header" id="b_title">

    </div>
    <div class="content">
        <div class="description">
            <p style = "text-align: right" id = "b_review"></p>
            <div id = 'b_content'></div>
        </div>
    </div>
    <div class="actions">
        <div class="ui black deny button">
            닫기
        </div>
    </div>

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

        function submitc(){
            alert("test click");
            console.log("클릭함");
        }

</script>

