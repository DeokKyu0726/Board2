<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>JEJU wifi map - contact us</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4">Contact us!</h1>
                        </div>

                        <form class="user" name="insertFrm" id="insertFrm" action="insert">
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="board_nick" name="board_nick"
                                           placeholder="Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" id="board_email" name="board_email"
                                       placeholder="Email Address">
                            </div>

                            <div class="form-group">
                                <textarea class="form-control form-control-sm" id="board_content" name="board_content"
                                          placeholder="200자 이내(400byte)로 입력해 주세요..." style="height: 170px"></textarea>
                            </div>
                            <hr>
                            <input type="button" value="제출하기" href="/board" id="insert" class="btn btn-primary btn-user btn-block" OnClick="javascript:Insert();">
                        </form>
<%--                        <hr>--%>

<%--                        <div class="text-center">--%>
<%--                            <a class="small" href="forgot-password.html">Forgot Password?</a>--%>
<%--                        </div>--%>
<%--                        <div class="text-center">--%>
<%--                            <a class="small" href="login.html">Already have an account? Login!</a>--%>
<%--                        </div>--%>
                    </div>
                </div>
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

<%--양식 제출--%>
<script>
    function Insert()
    {
        var insertFrm = document.insertFrm;
        if( !insertFrm.board_nick.value){
            alert( "닉네임을 입력하세요" );
            insertFrm.board_nick.focus();
            return;
        }

        if( !insertFrm.board_email.value){
            alert( "이메일을 입력하세요" );
            insertFrm.board_email.focus();
            return;
            if (!exptext){
                alert( "제대로 입력하세요" );
            }
        }

        if( !insertFrm.board_content.value ){
            alert( "내용을 입력하세요" );
            insertFrm.board_content.focus();
            return;
        }
        insertFrm.submit();
    }
    function CheckEmail(str)
    {
        if(!reg_email.test(str)) {
            return false;
        }

        else {
            return true;
        }
    }

</script>

<%--모바일 웹 더블탭 시 확대방지--%>
<script>
    document.documentElement.addEventListener('touchstart', function (event) {
        if (event.touches.length > 1) {
            event.preventDefault();
        }
    }, false);

    var lastTouchEnd = 0;

    document.documentElement.addEventListener('touchend', function (event) {
        var now = (new Date()).getTime();
        if (now - lastTouchEnd <= 300) {
            event.preventDefault();
        } lastTouchEnd = now;
    }, false);
</script>
</body>

</html>