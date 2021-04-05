<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<style>
    /* Form */
    .question{width:100%;border-top:2px solid #bdbdbd;border-bottom:2px solid #bdbdbd;font-family:"NanumGothic",sans-serif;}
    .question .qtit{text-align:left; margin:50px 0 10px 0;}
    .question tr{border-top:1px solid #cdcdcd;}
    .question tr:first-child{border-top:0;}
    .question th{background:#f6f6f6; width:20%;text-align:left; padding-left:3%}
    .question td{text-align:left;background:#fff;padding-top:1%!important;padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-height:26px;padding-left:3%}
    .question input[type="text"],
    .question select{margin-right:1%;color:#5c5c5c;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#f6f6f6;vertical-align:middle;border:1px solid #cdcdcd;padding:1%;}
    .question select{padding:0.9%;}
    .question textarea{vertical-align:middle;border:1px solid #cdcdcd; width:94%; height:100px;background:#f6f6f6;padding:1%}
    .question label{margin-right:1%;}
    .question .button{margin-right:1%;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#5e5e5e;vertical-align:middle;border:1px solid #5e5e5e;padding:1%; cursor:pointer;}
    .question .button a{color:#fff;}
    /*.question .add{margin-top:1%;}*/
    /*.question .wid10{width:10%;}*/
    .question .nickname{width:49%;}
    /*.question .wid30{width:30%;}*/
    .question .email{width:49%;}

    .btngreen{margin-top:30px;}
    .btngreen a{width:8%;margin:0 auto;display:block;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#fff;border:1px solid #008d2d;border-radius:2em;background:#008d2d; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
    .btngreen a:hover{background:#fff;color:#008d2d;}
</style>

<!-- Form -->
<table class="question">
    <caption class="qtit">기본정보</caption>
    <tr>
        <th class="th" scope="row" >닉네임</th>
        <td><input type="text" title="닉네임" class="nickname" placeholder="닉네임을 입력하세요" />
        </td>
    </tr>
<%--    <tr>--%>
<%--        <th class="th" scope="row">연락처</th>--%>
<%--        <td><select lass="wid10" title="핸드폰 앞 자리 선택">--%>
<%--            <option value="010">010</option>--%>
<%--            <option value="011">011</option>--%>
<%--            <option value="016">016</option>--%>
<%--            <option value="017">017</option>--%>
<%--            <option value="018">018</option>--%>
<%--            <option value="019">019</option>--%>
<%--        </select><input type="text" title="전화번호 앞" maxlength="4" lass="wid20" /><input type="text"  title="전화번호뒤" maxlength="4" lass="wid20" /></td>--%>
<%--    </tr>--%>
    <tr>
        <th class="th" scope="row">이메일</th>
        <td><input type="text" class="email" title="이메일" placeholder="email please"></td>
    </tr>
    <tr>
        <th class="th" scope="row">문의사항</th>
        <td>
            <textarea title="문의사항" placeholder="200자 이내(400byte)로 입력해 주세요"></textarea>
        </td>
    </tr>
</table>

<div class="btngreen">
    <a href="/board" class="button">글쓰기</a>
</div>
<!-- //Form -->
