<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%

    request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리



    Class.forName("org.mariadb.jdbc.Driver"); // mysql 연동

    String url = "jdbc:mariadb://127.0.0.1/wifi"; // mysql 데이터베이스명
    String mysql_id = "root";   // mysql id값
    String mysql_pw = "root";   // mysql pw값



    String board_NICK = request.getParameter("board_nick");
    String board_EMAIL = request.getParameter("board_email"); //
    String board_CONTENT = request.getParameter("board_content");


    try{

        Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도



        String sql = "INSERT INTO board(board_email, board_content, board_nick) values(?,?,?)"; // insert 쿼리문

        PreparedStatement pstmt = conn.prepareStatement(sql);


        pstmt.setString(1, board_EMAIL);
        pstmt.setString(2, board_CONTENT);
        pstmt.setString(3, board_NICK);




        pstmt.execute();

        pstmt.close();

    }catch(SQLException e){

        out.println(e.toString());

    }
%>
<script>
   alert("게시글이 입력 되었습니다.");
   window.location.href="board";
</script>
