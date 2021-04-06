<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%

    Class.forName("org.mariadb.jdbc.Driver");

    String url = "jdbc:mariadb://127.0.0.1/wifi";
    String mysql_id = "root";
    String mysql_pw = "root";



    String num = request.getParameter("board_num");




    try{

        Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);

        Statement stmt = conn.createStatement();



        String sql = "select board_nick, board_content from board where board_no=" + num;

        ResultSet rs = stmt.executeQuery(sql);

        if(rs.next()){


            String board_nick = rs.getString(1);
            String board_content = rs.getString(2);

%>

<table class="body">

    <tr>

        <th style="height:40px;">닉네임</th>

        <td><%=board_nick%></td>

    </tr>

    <tr>

        <th style="height:200px;">글내용</th>

        <td><%=board_content%></td>

    </tr>

</table>
<input type="hidden" id="board_num" value="<%=num%>">

<%

            rs.close();

            stmt.close();

            conn.close();

        }

    }catch(SQLException e){

        out.println(e.toString());

    }

%>



<div class="btnDiv">

    <input type="button" id="update" value="수정">

    <input type="button" id="delete" value="삭제">

</div>
