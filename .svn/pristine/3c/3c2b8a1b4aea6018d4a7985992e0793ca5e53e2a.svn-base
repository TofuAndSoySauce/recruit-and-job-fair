<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KakaoLogin</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		var loginId = $("#loginId").val();
		var userNm = $("#userNm").val();
		var userType = $("#userType").val();
		var result = $("#result").val();
		var password = $("#password").val();
		console.log(password);
		var param = {
			lgn_Id : loginId,
			userNm : userNm,
			userType : userType,
			pwd : password
		};
		console.log(JSON.stringify(param));
		$.ajax({
			url : '/loginProc.do',
			type : 'post',
			data : param,
			dataType : 'json',
			async : true,
			success : function(data) {
				fKakaoLoginProcResult(data);
			}
		});
	});

	function fKakaoLoginProcResult(data) {
		var lhost = data.serverName;

		if (data.result == "SUCCESS") {
			closePopupAndRedirect();
		}
	};

	function closePopupAndRedirect() {
		// 부모 페이지로 이동
		window.opener.location.href = "http://localhost/dashboard/dashboard.do";
		window.close();
	};
</script>
</head>
<body>
	<input type="hidden" value="${loginId}" id="loginId">
	<input type="hidden" value="${userNm}" id="userNm">
	<input type="hidden" value="${userType}" id="userType">
	<input type="hidden" value="${result}" id="result">
	<input type="hidden" value="${password}" id="password">
	<p>카카오 로그인 진행 중 새로고침을 하시거나 창을 닫아주세요.</p>
</body>
</html>
