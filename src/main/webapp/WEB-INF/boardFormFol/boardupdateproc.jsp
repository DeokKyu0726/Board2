<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%

    Class.forName("org.mariadb.jdbc.Driver");

    String url = "jdbc:mariadb://127.0.0.1/wifi";

    String mysql_id = "root";

    String mysql_pw = "root";



    // 받아온 파라미터 값을 utf-8로 인코딩

    request.setCharacterEncoding("utf-8");



    // 받아온 파라미터 값을 변수에 담는 부분

    String board_no = request.getParameter("board_no");
    String board_nick = request.getParameter("board_nick");
    String board_content = request.getParameter("board_content");





    // 데이터 베이스 연동 후 쿼리 적용 하는 부분

    try{

        Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);



        String sql = "update board set board_nick=?, board_content=? where board_no=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);



        pstmt.setString(1, board_nick);
        pstmt.setString(2, board_content);
        pstmt.setString(3, board_no);



        pstmt.execute();

%>



<!--수정 완료 창 띄운 후에 수정된 게시글 상세보기로 이동 -->

<script>
    <%--alert("수정완료 되었습니다");--%>
    <%--window.location.href = "Detail.jsp?board_no="+<%=board_no%>;--%>
</script>

<%
        pstmt.close();
    }catch(SQLException e){
        out.println(e.toString());
    }
%>
