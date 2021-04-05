<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%--DB import 부분--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>



<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/menu.css"/>

<div class=menu>
    <div class="hamburger-icon">
        <div class="hamburger-icon__middle"></div>
    </div>
    <a href="/"> <img src="resources/image/logo_1.png" style="height:100%; cursor: pointer"></a>
</div>

<div class=sub_menu>
    <div class="close-icon"> X</div>
    <ul>
        <li><a class="fm" href="/jejusi">제주시</a></li>
        <li><a class="fm" href="/seogwipo">서귀포시</a></li>
        <li><a class="fm" href="/board">건의사항</a></li>
    </ul>
</div>

<table class="board" border="1">

    <colgroup>
        <col width="50"/>
        <col width="300"/>
        <col width="80"/>
        <col width="100"/>
        <col width="70"/>
    </colgroup>

    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>날짜</th>
    </tr>
    </thead>


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
        <td><%= rs.getString("INX") %></td>
        <td><%= rs.getString("CONTENT") %></td>
        <td><%= rs.getString("ID") %></td>
        <td><%= rs.getString("DATE") %></td>
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


</table>
=======
        <tbody>
        <tr>
            <td class="index">0</td>
            <td class="title">게시판 제목</td>
            <td class="name">글쓴이</td>
            <td class="date">날짜</td>
        </tr>
        </tbody>
    </table>
</center>
<div class="button">
>>>>>>> 9df26ddd832f7a249f398a50eb1d0b9f79d283bf
    <p>
        <input type="button" onclick="location.href='/boardForm'" value="글쓰기">
    </p>
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

