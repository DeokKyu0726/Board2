<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%--DB import 부분--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>


<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/semantic.min.css">
<jsp:include page="/WEB-INF/commons/menu.jsp"/>



<div class="ui middle aligned center aligned grid">
    <div class="column">
        <div class="ui large form">
            <div class="ui stacked segment">

                <table class="ui celled table">
                    <thead>
                    <tr>
                        <td>INX</td>
                        <td>제목</td>
                        <td>등록자</td>
                    </tr>

                    <%--    --%>
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

                            String query = "select * from board";
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
                        <tr>
                            <td><%= rs.getString("board_no") %></td>
                            <td><%= rs.getString("board_content") %></td>
                            <td><%= rs.getString("board_nick") %></td>
                        </tr>
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
                    <%--    --%>
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

