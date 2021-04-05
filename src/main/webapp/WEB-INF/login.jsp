<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/solar.css" />

<div class="login-container">


  <div class="form">
    <img src="resources/images/logo.PNG" class="logo-img" style="width: 245px;"/>
    <div class="row clearfix">
      <div class="label">ID</div>
      <div class="frm">
        <input type="text" id="id" placeholder="ID를 입력해주세요" class="inp" />
      </div>
    </div>
    <div class="row clearfix">
      <div class="label">PASSWORD</div>
      <div class="frm">
        <input type="password" id="password" placeholder="패스워드 입력해주세요" class="inp" />
      </div>
    </div>
    <div class="row clearfix">
      <div class="btn" id="loginBtn">LOGIN</div>
    </div>
    <div class="row" id="fail">
      <p class="fail">ID 또는 PASSWORD가 맞지 않습니다.</p>
    </div>
  </div>
</div>

<script>
  $(function() {
    $("#loginBtn").click(function() {
      var isValid = true;
      if ($("#id").val().length == 0) {
        $("#id").addClass("warn");
        isValid = false;
      }

      if ($("#password").val().length == 0) {
        $("#password").addClass("warn");
        isValid = false;
      }

      if (!isValid) {
        return;
      }

      const data = {
        userId: $("#id").val(),
        password: $("#password").val()
      };

      $.ajax({
        url: '/login',
        type: 'post',
        dataType: 'json',
        data: data,
        success: function (resp) {
          if (resp == 0) {
            location.href = "/";
          } else if (resp == -1) {
            $("#id").addClass("warn");
            $("#password").addClass("warn");
            $(".fail").show();
          }
        },
        error: function(xhr, status, e) {
        }
      });
    });
  });
</script>

