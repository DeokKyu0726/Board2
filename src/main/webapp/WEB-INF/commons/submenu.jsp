<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%--DB import 부분--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JEJU wifi map</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">JEJU wifi <sup>2</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="/">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>지도</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            location
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="/jejusi">
                <i class="fas fa-fw fa-table"></i>
                <span>제주시</span></a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="/seogwiposi">
                <i class="fas fa-fw fa-table"></i>
                <span>서귀포시</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
            contact us
        </div>

        <!-- Nav Item - Tables -->
        <li class="nav-item active">
            <a class="nav-link" href="/board">
                <i class="fas fa-fw fa-table"></i>
                <span>건의사항</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <div class="sidebar-heading">
                    contact us
                </div>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
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


                                    try {

                                        Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도
                                        Statement stmt = conn.createStatement();
                                        String totalSql = "select count(*) from board;";  // 총 글갯수를 찾는 sql문
                                        ResultSet rs = stmt.executeQuery(totalSql);


                                        if (rs.next()) {            // 결과가 있다면 true값을 반환합니다

                                            total = rs.getInt(1);   // total에 전체 글 갯수 값 대입

                                        }


                                        // total은 나중에 페이징 처리시 사용


                                        String listSql = "select board_no,board_nick,board_date,board_content from board;"; // 전체 리스트를 가져오는 sql문

                                        rs = stmt.executeQuery(listSql);


                                        // try catch에서 오류가없을시에 출력되는 내용입니다

                                %>
                                <%

                                    // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

                                    if (total == 0) {

                                %>

                                <tr>

                                    <td>게시글이 존재하지 않습니다</td>

                                </tr>

                                <%

                                    // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

                                } else {

                                    while (rs.next()) { //rs값이 있을때까지 반복합니다.

                                        int board_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.

                                        String board_nick = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.

                                        String board_date = rs.getString(3); // sql문의 세번째 컬럼내용을 담습니다.

                                        String board_content = rs.getString(4);

                                        // 실제 리스트가 출력되는 부분 입니다.

                                %>

                                <tr>

                                    <td><%=board_no%>
                                    </td>
                                    <td><%=board_nick%>
                                    </td>
                                    <td><%=board_content%>
                                    </td>
                                    <td><%=board_date%>
                                    </td>
                                </tr>
                                <%
                                            }
                                        }
                                        rs.close();
                                        conn.close();
                                        stmt.close();
                                    } catch (SQLException e) {
                                        out.println(e.toString());
                                    }
                                %>
                                </thead>
                            </table>

                        </div>

                        <a href="/boardForm">
                            <button class="ui fluid large teal submit button">게시글 작성하기</button>
                        </a>

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
                        <p style="text-align: right" id="b_review"></p>
                        <div id='b_content'></div>
                    </div>
                </div>
                <div class="actions">
                    <div class="ui black deny button">
                        닫기
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/chart-area-demo.js"></script>
<script src="/resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>

