<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/board.css"/>
<jsp:include page="/WEB-INF/commons/menu.jsp"/>

<input type="text" name="input">

<input type="submit" value="저장" id="btn">

<script>

    $("#btn").click(function (e) {

        e.preventDefault();
        if (!confirm("명령을 전송하시겠습니까?")) {

        }

        const data = {

            title: $("title").val(),
            content: $("content").val()

        };

        $.ajax({
            url: '/api/controls/board',
            type: 'post',
            dataType: 'json',
            data: data,
            success: function (resp) {
            },
            error: function (xhr, status, e) {
            }
        });
    });


</script>





