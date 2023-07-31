<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker :: Login</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
  $(function() {
    // Datepicker 설정
    $("#datepicker").datepicker({
      dateFormat: "yy-mm-dd", // XXXX-XX-XX 형식으로 설정
      changeMonth: true,
      changeYear: true,
      yearRange: "-70:+0" // 최근 70년까지 선택 가능하도록 설정
    });
  });
</script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
    
    comcombo('user_sexuality','gender','sel','');
    comcombo('location','user_hope_area','sel','');
    comcombo('position','user_hope_work','sel','');
    comcombo('location','company_area','sel','');
    comcombo('position','company_work','sel','');
    comcombo('company_size','company_size','sel','');
  } );
  </script>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${CTX_PATH}/css/admin/login.css" />

<!-- 우편번호 조회 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${CTX_PATH}/js/popFindZipCode.js"></script>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>

<script type="text/javascript" src="${CTX_PATH}/js/login_pub.js"></script>

<script type="text/javascript">
/* 핸드폰 자동 하이픈 */
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
var check;

/* 사업자등록 번호 하이픈 */
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,2})(\d{0,5})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	
var check;

/* OnLoad Event */
$(document).ready(function() {
	$("#confirm").hide();
	$("#loginRegister").hide();
	$("#loginEmail").hide();
	$("#loginPwd").hide();

	var cookie_user_id = getCookie('EMP_ID');
	if (cookie_user_id != "") {
		$("#EMP_ID").val(cookie_user_id);
		$("#cb_saveId").attr("checked", true);
	}

	$("#EMP_ID").focus();
	
	init();
	
});


function fcancleModal(){
	gfCloseModal();
	}

/* 회원가입 모달창 실행 */
function fRegister() {
	var div_cd;
	$("#action").val("I");
	// 모달 팝업
	gfModalPop("#layer1");
	instaffRegister();
}


 function init() {
	check = new Vue({
		el: '#layer1',
		data : {
			langitems: [],
			langitems1: [],
			langitems2: [],
			langitems3: [],	
			langitemss: [],
			langitemarea1: [],
			langitemarea2: [],
			langitemarea3: [],
			listlistCod: '',
			weblistCod:'',
			dblistCod:'',
			wslistCod:'',
			sklcdlistCod:'',
			areacdlistCod:'',
			skillgrpcd:'',
			skilldtlcd:''
			
		}
	})
 }

 /*체크리스트 콜백함수*/
 function checklistResult(data){ 	
	
	/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
 	$.ajax({
		url : '/checklist.do',
		type : 'post',
		data : data,
		dataType : 'json',
		async : true,
		success : function(data) {
			check.check = [];
			check.langitems = data.listlistCod;
			check.langitems1 = data.weblistCod;
			check.langitems2 = data.dblistCod;
			check.langitems3 = data.wslistCod;
			check.langitemss = data.sklcdlistCod;
			check.langitemarea1 = data.areacdlistCod;
			check.langitemarea2 = data.areacdlistCod;
			check.langitemarea3 = data.areacdlistCod;
			}
		});
	}

$("input[v-model=chkbox]:checked").each(function(){
	var chk = $(this).val();
})

var chk_arr = [];
$("input[v-model=chkbox]:checked").each(function(){
	var chk = $(this).val();
	chk_arr.push(chk);
})

/*일반 회원가입 폼 초기화*/
function instaffRegister(){
	
	$("#user_type").val("C");
	$("#div_cd").val("CommonMember");
	$("#user_type_li").hide();
	$("#registerId").val("");
	$("#registerPwd").val("");
	$("#registerPwdOk").val("");
	$("#registerName").val("");
	$("#rggender_th").show();
	$("#rggender_td").show();
	$("#rgcompany_th").hide();
	$("#rgcompany_td").hide();
	$("#registerName").show();
	$("#registerName_th").show();
	$("#user_company_li").hide("");
	$("#user_company").val("");
	$("#registerEmail").val("");
	$("#detailaddr").val("");
	$("#loginaddr").val("");
	$("#loginaddr1").val("");
	$("#phone").val("");
	$("#del_cd").val("2");
	$("#ckIdcheckreg").val("0");
	$("#birthday1").show();
	$("#datepicker").val("");
	$("#user_company_number").hide();
	$("#consult_yn").show();
	$("#user_hope_area_th").show("");
	$("#user_hope_area_td").show("");
	$("#user_hope_area").val("");
	$("#user_hope_work_th").show("");
	$("#user_hope_work_td").show("");
	$("#user_hope_work").val("");
	$("#company_area_th").hide();
	$("#company_area_td").hide();
	$("#company_work_th").hide();
	$("#company_work_td").hide();
	$("#company_size_th").hide();
	$("#company_size_td").hide();
	$("#user_describe").val("");


	console.log($("#user_type").val());
	console.log($("#div_cd").val());
	
	//체크리스트출력
	checklistResult(); 
		
}

/*기업 고객 회원가입 폼 초기화*/
function outstaffRegister(){

	$("#user_type").val("B");
	$("#div_cd").val("BusinessMember");
	$("#user_type_li").hide();
	$("#registerId").val("");
	$("#registerPwd").val("");
	$("#registerPwdOk").val("");
	$("#registerName").val("");
	$("#rggender_th").hide();
	$("#rggender_td").hide();
	$("#rgcompany_th").show();
	$("#rgcompany_td").show();
	$("#registerName").hide();
	$("#registerName_th").hide();
	$("#user_company").val("");
	$("#gender_li").hide();
	$("#registerEmail").val("");
	$("#detailaddr").val("");
	$("#gender").val("");
	$("#loginaddr").val("");
	$("#loginaddr1").val("");
	$("#phone").val("");
	$("#del_cd").val("n");
	$("#ckIdcheckreg").val("0");
	$("#birthday1").hide();
	$("#user_company_number").show();
	$("#user_company_number2").val("");
	$("#user_hope_area_th").hide();
	$("#user_hope_area_td").hide();
	$("#user_hope_work_th").hide();
	$("#user_hope_work_td").hide();
	$("#company_area_th").show();
	$("#company_area_td").show();
	$("#company_area").val("");
	$("#company_work_th").show();
	$("#company_work_td").show();
	$("#company_work").val("");
	$("#company_size_th").show();
	$("#company_size_td").show();
	$("#company_size").val("");

	
	checklistResult(); 

	console.log($("#user_type").val());
	console.log($("#div_cd").val());
}



/* 아이디/비밀번호 찾기 모달창 실행 */
function findIdPwd() {

	// 모달 팝업
	gfModalPop("#layer2");
	
}


/* 회원가입 validation */
function RegisterVal(){
	  
	var div_cd = $('#div_cd').val();
	var user_type = $('#user_type').val();
	var rgid = $('#registerId').val();
	var rgpwd = $('#registerPwd').val();
	var rgpwdok = $('#registerPwdOk').val();
	var rgname = $('#registerName').val();
	var gender = $('#gender').val();
	var datepicker = $('#datepicker').val();
	var user_company = $('#user_company').val();
	var user_company_number2 = $('#user_company_number2').val();
	var rgemail = $('#registerEmail').val();
	var dtadr = $('#detailaddr').val();
	var lgadr = $('#loginaddr').val();
	var lgadr1 = $('#loginaddr1').val();
	var phone = $('#phone').val();
	var user_hope_area = $("#user_hope_area").val();
	var user_hope_work = $("#user_hope_work").val();
	var company_area = $("#company_area").val();
	var company_work = $("#company_work").val();
	var company_size = $("#company_size").val();
		
	if(user_type == ""){
		swal("타입을 입력해주세요.").then(function() {
			$("#user_type").focus();
		  });
		return false;
	}
	
	if(rgid.length < 1){
		swal("아이디를 입력하세요.").then(function() {
			$('#registerId').focus();
		  });
		return false;
	}
	
	if(rgpwd.length < 1){
		swal("비밀번호를 입력하세요.").then(function() {
			$('#registerPwd').focus();
		  });
		return false;
	}
	
	if(rgpwdok.length < 1){
		swal("비밀번호 확인을 입력하세요.").then(function() {
			$('#registerPwdOk').focus();
		  });
		return false;
	}
	
	if(rgpwd != rgpwdok){
		swal("비밀번호가 맞지 않습니다.").then(function() {
			$('#registerPwd').focus();
		  });
		return false;
	}
	
	if(user_type == 'C' && rgname.length < 1){
		swal("이름을 입력하세요.").then(function() {
			$('#registerName').focus();
		  });
		return false;
	}
	
	if(user_type == 'C' && gender === ""){
		console.log(gender.value);
		console.log(gender);
		swal("성별을 선택하세요.").then(function() {
			$('#gender').focus();
		  });
		return false;
	}	
	if(user_type == 'C' && datepicker === ""){
		swal("생년월일을 입력하세요.").then(function() {
			$('#datepicker').focus();
		  });
		return false;
	}	
	
	if(user_type == 'B' && user_company.length < 1){
		swal("회사명을 입력하세요.").then(function() {
			$('#user_company').focus();
		  });
		return false;
	}
	
	if(user_type == 'B' && user_company_number2.length < 11 ){
		swal("사업자번호를 10자리를 입력하세요.").then(function() {
			$('#user_company_number2').focus();
		  });
		return false;
	}
	
	if(rgemail.length < 1){
		swal("이메일을 입력하세요.").then(function() {
			$('#registerEmail').focus();
		  });
		return false;
	}
	
	if(dtadr.length < 1){
		swal("우편번호를 입력하세요.").then(function() {
			$('#detailaddr').focus();
		  });
		return false;
	}
	
	if(lgadr.length < 1){
		swal("주소를 입력하세요.").then(function() {
			$('#loginaddr').focus();
		  });
		return false;
	}
	
	if(phone.length < 13){
		swal("전화번호 11자리를 모두 입력하세요.").then(function() {
			$('#phone').focus();
		  });
		return false;
	}
	if(!phone.startsWith("010")){
		swal("전화번호를 바르게 입력하세요.").then(function() {
			$('#phone').focus();
		  });
		return false;
	}
	
	if(user_type == 'C' && user_hope_area === ""){
		swal("선호지역을 선택하세요.").then(function() {
			$('#user_hope_area').focus();
		  });
		return false;
	}
	if(user_type == 'C' && user_hope_work === ""){
		swal("선호직무를 선택하세요.").then(function() {
			$('#user_hope_work').focus();
		  });
		return false;
	}
	if(user_type == 'B' && company_area === ""){
		swal("지역을 선택하세요.").then(function() {
			$('#company_area').focus();
		  });
		return false;
	}
	if(user_type == 'B' && company_work === ""){
		swal("직종을 선택하세요.").then(function() {
			$('#company_work').focus();
		  });
		return false;
	}
	if(user_type == 'B' && company_size === ""){
		swal("기업규모를 선택하세요.").then(function() {
			$('#company_size').focus();
		  });
		return false;
	}
	
	
	return true;	
}


/*loginID 중복체크*/
function loginIdCheck(){
	
	var data = {"loginID" : $("#registerId").val()};
	
	var idRules =  /^[a-z0-9]{6,20}$/g ;
	var id = $("#registerId").val();

	/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
	$.ajax({
		url : '/check_loginID.do',
		type : 'post',
		data : data,
		dataType : 'text',
		async : true,
		success : function(data) {
			if($("#registerId").val()==""){
				console.log("입력 아이디 없음");
				swal("아이디를 입력해주세요.").then(function(){
					$("#registerId").focus();
				});
				$("#ckIdcheckreg").val("0");
			}
			 else if (data==1){
				console.log("아이디 있음");
				swal("중복된 아이디가 존재합니다.").then(function(){
					$("#registerId").focus();
				});
				console.log(data);
				$("#ckIdcheckreg").val("0");
			} else if(!idRules.test($("#registerId").val())){
				swal('아이디는 숫자,영문자 조합으로 6~20자리를 사용해야 합니다.').then(function(){
					$("#registerId").focus();
				});
				$("#ckIdcheckreg").val("0");
				return false;
			} else if(data == 0){
				console.log("아이디 없음");
				swal("사용할 수 있는 아이디 입니다.");
				$("#ckIdcheckreg").val("1");
			}
		}
	});
}

/*회원가입 버튼 아이디 중복 체크*/
function loginIdCheckComplete(){
	
	var data = {"loginID" : $("#registerId").val()}
	
	var idRules =  /^[a-z0-9]{6,20}$/g ;
	var id = $("#registerId").val();

	/*callAjax시 로그인 여부 확인 하므로 ajax 함수 직접 작성*/
	$.ajax({
		url : '/check_loginID.do',
		type : 'post',
		data : data,
		dataType : 'text',
		async : false,
		success : function(data) {
			if (data == 1){
				$("#ckIdcheckreg").val("0");
				console.log("아이디 있음");
				return false;
			} else if(!idRules.test($("#registerId").val())){
				$("#ckIdcheckreg").val("0");
				return false;
			}
		}
	});
}



/*이메일 중복 체크*/
function emailCheck(){
	var data = {"user_email" : $("#registerEmail").val()};

	$.ajax({
		url : '/check_email.do',
		type : 'post',
		data : data,
		dataType : 'text',
		async : false,
		success : function(data) {
			if(data == 1){
				$("#ckEmailcheckreg").val("0");
				console.log("이메일 있음");
				console.log(data);
				return false;
			} else {
				$("#ckEmailcheckreg").val("1");
				console.log(data);
				console.log("이메일 없음");
			}
			
		}
	});
}
/* 회원가입  완료*/
function CompleteRegister() {
	
	var param = $("#RegisterForm").serialize();
	/*패스워드 정규식*/
	var passwordRules = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
 	var password = $("#registerPwd").val();
 	/*이메일 정규식*/
	var emailRules = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var email = $("#registerEmail").val();
	
	//console.log(div_cd);
	/* validation 체크 */
	if(!RegisterVal()){
		return;
	}
		
	loginIdCheckComplete();
	emailCheck();
			 
	if (RegisterForm.ckIdcheckreg.value == "0"){
		swal("아이디 중복확인을 진행해주세요.").then(function() {
			$("#registerId").focus();
		  });
	} else if(!passwordRules.test($("#registerPwd").val())){
		swal('비밀 번호는 숫자,영문자,특수문자 조합으로 8~15자리를 사용해야 합니다.').then(function() {
			$("#registerPwd").focus();
		  });
		return false;
	} else if(!emailRules.test($("#registerEmail").val())){
		swal("이메일 형식을 확인해주세요.").then(function() {
			$("#registerEmail").focus();
		  });
	} else if(RegisterForm.ckEmailcheckreg.value =="0"){
		swal("중복된 이메일이 존재합니다. 다시 입력해주세요.").then(function() {
			$("#registerEmail").focus();
		  });
	} else{
	
		var resultCallback = function(data) {
		fSaveRegister(data);
		}
	
	callAjax("/register.do", "post", "json", true, param, resultCallback);
	}

}

/* 회원 가입 저장 콜백함수 */
function fSaveRegister(data) {

	if (data.result == "SUCCESS") {
		alert(data.resultMsg);
		gfCloseModal();
	} else {
		alert(data.resultMsg);
		return false;
	}
}


// 우편번호 api
function execDaumPostcode(q) {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('detailaddr').value = data.zonecode;
			document.getElementById("loginaddr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("loginaddr1").focus();
		}
	}).open({
		q : q
	});
}


/* 로그인 validation */
function fValidateLogin() {

	var chk = checkNotEmpty([ [ "EMP_ID", "아이디를 입력해 주세요." ],
			[ "EMP_PWD", "비밀번호를 입력해 주세요." ] ]);

	if (!chk) {
		return;
	}

	return true;
}

/* 로그인 */
function fLoginProc() {
	if ($("#cb_saveId").is(":checked")) { // 저장 체크시
		saveCookie('EMP_ID', $("#EMP_ID").val(), 7);
	} else { // 체크 해제시는 공백
		saveCookie('EMP_ID', "", 7);
	}

	// vaildation 체크
	if (!fValidateLogin()) {
		return;
	}

	var resultCallback = function(data) {
		fLoginProcResult(data);
	};

	callAjax("/loginProc.do", "post", "json", true, $("#myForm")
			.serialize(), resultCallback);
}

/* 로그인 결과 */
function fLoginProcResult(data) {

	var lhost = data.serverName;

	if (data.result == "SUCCESS") {
		location.href = "${CTX_PATH}/dashboard/dashboard.do";
	} else {

		$("<div style='text-align:center;'>" + data.resultMsg + "</div>")
				.dialog({
					modal : true,
					resizable : false,
					buttons : [ {
						text : "확인",
						click : function() {
							$(this).dialog("close");
							$("#EMP_ID").val("");
							$("#EMP_PWD").val("");
							$("#EMP_ID").focus();
						}
					} ]
				});
		$(".ui-dialog-titlebar").hide();
	}
}


/*이메일 기능  (아이디 있는지 없는지 체크)*/
function SendEmail() {
	var data = {
		"user_email" : $("#emailText").val(),
		/*"data-code" : $("#emailText").attr("data-code")*/
	};

	$.ajax({
		url : "/selectFindInfoId.do",
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		success : function(flag) {
				if ($("#emailText").val() == "") {
					swal("이메일을 입력해주세요.");
			}	else if (flag.result == "FALSE") {
					swal("존재하지 않는 이메일 입니다.");
				}
				else if (flag.result == "SUCCESS") {
					swal("해당 이메일로 인증번호를 전송하였습니다.");
					
					$("#authNumId").val(flag);
					$("#confirm").show();
					findMailSendId();
			} 
		}
	});
}

/*ID 찾기 이메일 전송*/
function findMailSendId(){
	var data = {
			"email" : $("#emailText").val(),
			"authNumId" : $("#authNumId").val()
		};
	$.ajax({
		url : "/sendmail.do",
		type : "post",
		dataType : "json",
		async : true,
		data : data,
		success : function(flag) {
				$("#authNumId").val(flag.authNumId);
		},
		error : function(request,status,error){
			swal("실패");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}

/* 이메일 인증 */
function SendComplete() {
 	var inputNum = $("#emailNum").val();
	var emailNum = $("#authNumId").val(); 
	console.log(emailNum);
	
	if (inputNum.length < 1) {
		swal("인증번호를 입력해주세요.");
		return false;
		
	} else if (emailNum != inputNum) {
		swal("인증번호가 틀렸습니다.");
		return false;
		}
	
	 else if (emailNum == inputNum) {
		swal("인증 되었습니다.");
		
		// 아이디 메일 전송 함수호출
		findId();
	}
}

/* 아이디 뜨게 하는 */
var findId = function() {
	var data = {
		"user_email" : $("#emailText").val()
	};
	$.ajax({
		url : '/selectFindInfoId.do',
		type : 'post',
		data : data,
		dataType : 'json',
		async : false,
		success : function(flag) {
			// 모달 or span 
			console.log(flag);
			swal("귀하의 아이디는  " + flag.resultModel.loginID + " 입니다");
			$("#emailText").val('');
			$("#confirm").hide();
			$("#emailText").val('');
			$("#authNumId").val('');
			$("#emailNum").val('');
			$("#authNumId").val('');
		gfCloseModal();
		}
	});
}

/* 비밀번호 찾기에서 아이디 체크하는 창(가입된 아이디가 알람창으로) */
function RegisterIdCheck(){
	var loginid = $("#emailIdText").val();

	
	var data = {
			"loginID" :loginid
	};
	console.log(data);
	
	$.ajax({
		url : "/registerIdCheck.do",
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		success : function(data){
			if(loginid.length < 1){
				swal("아이디를 입력해주세요.");
				$("#loginEmail").hide();
			}
		
			else if (data.result == "SUCCESS"){
				
				swal("아이디가 존재합니다.");
				$("#loginEmail").show();
			}else{
				//console.log("data : " + JSON.stringify(data));
				swal("아이디가 존재하지 않습니다.");
				$("#loginEmail").hide();
			}
			
		}
		
	});
}

/* 이메일 기능 (비밀번호 기능)*/
function SendPwdEmail() {
	
	var data = {
		user_email : $("#emailPwdText").val(),
		loginID : $("#emailIdText").val(),
/* 		"data-code" : $("#emailPwdText").attr("data-code") */

	};
	
	console.log(data);
	
	
	
	$.ajax({
		url : "/selectFindInfoPw.do",
		type : "post",
		dataType : "json",
		async : false,
		data : data,
		success : function(flag) {
			
			
			if ($("#emailPwdText").val() == "") {
				swal("이메일을 입력해주세요.");
			} else if (flag.result == "FALSE") {
				swal("이메일이 틀렸습니다.");
				console.log("flag : " + JSON.stringify(flag));
			} else if (flag.result == "SUCCESS") {
				console.log("flag : " + JSON.stringify(flag));
				swal("해당 이메일로 인증번호를 전송하였습니다.");
				$("#authNumPwd").val(flag);
				$("#loginPwd").show();
				findMailSendPwd();
			}

		}
	});
}

/*비밀번호 찾기 이메일 전송*/
function findMailSendPwd(){
	var data = {
			"emailPwd" : $("#emailIdText").val(),
			"email" : $("#emailPwdText").val(),
			"authNumIdPwd" : $("#authNumPwd").val()
		};
	$.ajax({
		url : "/sendmail.do",
		type : "post",
		dataType : "json",
		async : true,
		data : data,
		success : function(flag) {
				$("#authNumPwd").val(flag.authNumId);
		},
		error : function(request,status,error){
			swal("실패");
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
}
 
/* 이메일 비밀번호 인증 */
function SendCompletePwd() {
	var inputPwd = $("#emailPwdNum").val();
	var emailPwdNum = $("#authNumPwd").val();
	if (inputPwd.length < 1) {
		swal("인증번호를 입력해주세요.");
		return false;
	} else if (emailPwdNum != inputPwd) {
		swal("인증번호가 틀렸습니다.");
		return false;
	} else if (emailPwdNum == inputPwd) {
		swal("인증번호가 맞습니다.");
		$("#authNumPwd").val('');

		// 비밀번호 호출하는 함수
		findPwd();
	}
}


/* 비밀번호 뜨게 하는 창 */
var findPwd = function() {
	var data = {
		"loginID" : $("#emailIdText").val(),
		"user_email" : $("#emailPwdText").val()
	};
	$.ajax({
		url : '/selectFindInfoPw.do',
		type : 'post',
		data : data,
		dataType : 'json',
		async : false,
		success : function(flag) {
			swal("귀하의 비밀번호는  " + flag.resultModel.password + " 입니다");
			$("#loginEmail").hide();
			$("#loginPwd ").hide();
			$("#emailIdText").val('');
			$("#emailPwdText").val('');
			$("#emailPwdNum").val('');
			gfCloseModal();
		}
	});
}

/* 아이디 찾기 버튼 클릭 이벤트 */
function fSelectId() {

	gfModalPop("#layer2");
	$("#registerEmailId").show();
	$("#loginRegister").hide();
	$("#loginEmail").hide();
	$("#loginPwd").hide();
	$("#emailText").val('');
}

/* 비밀번호 찾기 버튼 클릭 이벤트 */
function fSelectPwd() {

	$("#registerEmailId").hide();
	$("#confirm").hide();
	$("#loginRegister").show();
	$("#loginEmail").hide();
	$("#loginPwd").hide();
	$("#emailIdText").val('');
	gfModalPop("#layer2");
}

/* 아이디 찾기 메일 인증하기 버튼 클릭 이벤트 */
function fSelectIdOk() {
	$("#emailOk").on("click", function() {
		swal("인증이 완료 되었습니다.")
	});
}

/** ID 조회 */
function fSelectData() {
	var resultCallback = function(data) {
		fSelectDataResult(data);
	};
	callAjax("/selectFindInfoId.do", "post", "json", true, $("#modalForm")
			.serialize(), resultCallback);
}

/** PW 조회 */
function fSelectDataPw() {
	var resultCallback = function(data) {
		fSelectDataResultPw(data);
	};

	callAjax("/selectFindInfoPw.do", "post", "json", true, $("#modalForm2")
			.serialize(), resultCallback);
}

/** pw 저장 */
function fSaveData() {

	var resultCallback = function(data) {
		fSaveDataResult(data);
	};

	callAjax("/updateFindPw.do", "post", "json", true, $("#modalForm2")
			.serialize(), resultCallback);
}

/** 데이터 저장 콜백 함수 */
function fSaveDataResult(data) {
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		swal(data.resultMsg);
		location.href = "/login.do";
	} else {
		// 오류 응답 메시지 출력
		alert(data.resultMsg);
	}
}

	
</script>
</head>
<body>
	<form id="myForm" action="" method="post">
		<div id="background_board">
			<div class="login_form shadow" align="center">
				<div class="login-form-right-side">
					<div class="top-logo-wrap">
						<img src="${CTX_PATH}/images/admin/login/logo_img.png">
					</div>
					<h3>안되는 것이 실패가 아니라 포기하는 것이 실패다</h3>
					<p>
						성공은 실패의 꼬리를 물고 온다. 지금 포기한 것이 있는가?<br>그렇다면 다시 시작해 보자.<br>
						안되는 것이 실패가 아니라 포기하는 것이 실패다.<br> 포기한 순간이 성공하기 5분전이기 쉽다.<br>
						실패에서 더 많이 배운다.<br> 실패를 반복해서 경험하면 실망하기 쉽다. <br>하지만 포기를
						생각해선 안된다. 실패는 언제나 중간역이지 종착역은 아니다. <br>
					</p>
					<p>- 이대희, ‘1%의 가능성을 희망으로 바꾼 사람들’ 에서</p>
				</div>
				<div class="login-form-left-side">
					<fieldset>
						<legend>로그인</legend>
						<p class="id">
							<label for="user_id">아이디</label> <input type="text" id="EMP_ID"
								name="lgn_Id" placeholder="아이디"
								onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}"
								style="ime-mode: inactive;" />
						</p>
						<p class="pw">
							<label for="user_pwd">비밀번호</label> <input type="password"
								id="EMP_PWD" name="pwd" placeholder="비밀번호"
								onfocus="this.placeholder=''; return true"
								onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}" />
						</p>
						<p class="member_info" style="font-size: 15px">
							<input type="checkbox" id="cb_saveId" name=""
								onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}">
							<span class="id_save">ID저장</span> <br>
						</p>
						<a class="btn_login" href="javascript:fLoginProc();"
							id="btn_login"><strong>Login</strong></a> <br> <a
							href="javascript:fRegister();" id="RegisterBtn" name="modal"><strong>[회원가입]</strong></a>
						<a href="javascript:findIdPwd();"><strong>[아이디/비밀번호
								찾기]</strong></a>

					</fieldset>
					<div id="snslogins">
						<span class="sc-llYSUQ gylOiQ">
							<div class="line"></div> <span class="sc-iJKOTD lgasjq">개인
								회원 SNS로 간편 가입 및 로그인</span>
							<div class="line"></div>
						</span>
						<div class="sc-giYglK fedtzx">
							<!-- 카카오 로그인  -->
							<a onclick="javascript:kakaoOpen();" id="kakao-login-btn"> <img
								alt="카카오로그인버튼"
								src="https://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_kakao_login.gif"
								style="width: 200px;">
							</a>
							<%-- <a id="kakao-login-btn" href="#" onclick="openPopupAndRedirect();">
    					<img src="${CTX_PATH}/images/admin/login/kakao_login_medium.png">
					</a> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 카카오로그인버튼 클릭시 -->
	<script>
    var popup;

    function kakaoOpen() {
    	var url = 'https://kauth.kakao.com/oauth/authorize?client_id=7ee1658a3c38d5c4932cc70798e38ed8&redirect_uri=http://localhost:80/auth/kakao/callback&response_type=code&a=2';
        popup = window.open(url, "Kakao Login", "left=2000, width=650,height=639");
        
                
    }
	</script>


	<!-- 모달팝업 -->

	<div id="layer1" class="layerPosition layerPop layerType2"
		style="width: 600px;">
		<form id="RegisterForm" action="" method="post">
			<input type="hidden" name="action" id="action" value=""> <input
				type="hidden" name="ckIdcheckreg" id="ckIdcheckreg" value="0" /> <input
				type="hidden" name="ckEmailcheckreg" id="ckEmailcheckreg" value="0" />
			<dl>
				<dt>
					<br> <br> <strong style="font-size: 120%">&nbsp;&nbsp;&nbsp;&nbsp;회원가입</strong>
					<br>
				</dt>
				<dd class="content">
					<div class="btn_areaC">
						<a href="javascript:instaffRegister();" class="btnType blue"
							id="register_instaff"><span>일반회원</span></a> <a
							href="javascript:outstaffRegister();" class="btnType "
							id="register_outstaff"><span>기업회원</span></a> <br> <br>
					</div>
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
							<col width="120px">
						</colgroup>
						<tbody>
							<tr class="hidden">
								<td><input type="text" name="div_cd" id="div_cd" /></td>
								<td><input type="text" name="del_cd" id="del_cd" /></td>
								<td><input type="text" name="user_type" id="user_type" /></td>
							</tr>

							<tr>
								<th scope="row">아이디<span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="loginID" placeholder="숫자 또는 영문자 조합으로 6~20자리 "
									id="registerId" /></td>
								<td><input type="button" value="중복확인"
									onclick="loginIdCheck()" style="width: 130px; height: 20px;" /></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <span class="font_red">*</span></th>
								<td colspan="3"><input type="password"
									placeholder="숫자, 영문자, 특수문자 조합으로 8~15자리 " class="inputTxt p100"
									name="password" id="registerPwd" /></td>
							</tr>

							<tr>
								<th scope="row" style="padding: 0 0">비밀번호 확인<span
									class="font_red">*</span></th>
								<td colspan="3"><input type="password"
									class="inputTxt p100" name="password1" id="registerPwdOk" /></td>
							</tr>

							<tr>
								<th scope="row" id="registerName_th">이름 <span
									class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="name"
									id="registerName" /></td>

								<th scope="row" id="rggender_th">성별<span class="font_red">*</span></th>
								<td id="rggender_td">
									<select name="gender" id="gender" style="width: 100px; height: 28px;">
									</select>
									</td>
							</tr>

							<tr>
								<th scope="row" id="rgcompany_th">회사명<span class="font_red">*</span></th>
								<td id="rgcompany_td" colspan="3"><input type="text"
									style="width: 250px" class="inputTxt p100" name="user_company"
									id="user_company" /></td>
							</tr>

							<tr id="birthday1">
								<th scope="row">생년월일 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									name="birthday" id="datepicker" style="font-size: 15px" />
							</tr>

							<tr id="user_company_number">
								<th scope="row" style="padding: 0px;">사업자번호<span
									class="font_red">*</span></th>
								<td colspan="3"><input maxlength="12" type="text"
									class="inputTxt p100" oninput="autoHyphen(this)"
									name="user_company_number" id="user_company_number2" /></td>
							</tr>

							<tr>
								<th scope="row">이메일<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_email" id="registerEmail" /></td>
							</tr>

							<tr>
								<th scope="row">우편번호<span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="user_zipcode" id="detailaddr" readonly="readonly" /></td>

								<td><input type="button" value="우편번호 찾기"
									onclick="execDaumPostcode()"
									style="width: 130px; height: 20px;" /></td>
							</tr>
							<tr>
								<th scope="row">주소<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_address" id="loginaddr" readonly="readonly" /></td>
							</tr>
							<tr>
								<th scope="row">상세주소</th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_dt_address" id="loginaddr1" /></td>
							</tr>

							<tr>
								<th scope="row">전화번호<span class="font_red">*</span></th>
								<td colspan="3"><input class="inputTxt"
									oninput="autoHyphen2(this)" style="width: 250px" maxlength="13"
									type="text" id="phone" name="user_phone">
							</tr>

							<tr>
								<th scope="row" id="user_hope_area_th">선호지역<span
									class="font_red">*</span></th>
								<td colspan="3" id="user_hope_area_td"><select
									name="user_hope_area" id="user_hope_area"
									style="width: 400px; height: 28px;">
								</select></td>
							</tr>
							<tr>
								<th scope="row" id="user_hope_work_th">선호직무<span
									class="font_red">*</span></th>
								<td colspan="3" id="user_hope_work_td"><select
									name="user_hope_work" id="user_hope_work"
									style="width: 400px; height: 28px;">
								</select></td>
							</tr>

							<tr>
								<th scope="row" id="company_area_th">지역<span
									class="font_red">*</span></th>
								<td colspan="3" id="company_area_td"><select
									name="user_hope_area" id="company_area"
									style="width: 400px; height: 28px;">
								</select></td>
							</tr>
							<tr>
								<th scope="row" id="company_work_th">직종<span
									class="font_red">*</span></th>
								<td colspan="3" id="company_work_td"><select
									name="company_work" id="company_work"
									style="width: 400px; height: 28px;">
								</select></td>
							</tr>
							<tr>
								<th scope="row" id="company_size_th">기업규모<span
									class="font_red">*</span></th>
								<td colspan="3" id="company_size_td"><select
									name="company_size" id="company_size"
									style="width: 400px; height: 28px;">
								</select></td>
							</tr>
					</table>

					<div class="btn_areaC mt30">
						<a href="javascript:CompleteRegister();" class="btnType blue"
							id="RegisterCom" name="btn"> <span>회원가입 완료</span></a> <a
							href="javascript:fcancleModal()" class="btnType gray"
							id="btnCloseLsmCod" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</form>
	</div>


	<!-- 아이디 비밀번호 찾기 모달 -->
	<form id="sendForm" action="" method="post">
		<input type="hidden" name="authNumId" id="authNumId" value="" /> <input
			type="hidden" name="authNumPwd" id="authNumPwd" value="" /> <input
			type="hidden" name="ckIdcheck" id="ckIdcheck" value="" />
		<div id="layer2" class="layerPop layerType2" style="width: 750px;">
			<dl>
				<dt>
					<strong>아이디/비밀번호 찾기</strong>
				</dt>
				<dd>
					<div class="btn_areaC mt30">
						<a href="javascript:fSelectId();" class="btnType gray" id="findId"><span>아이디
								찾기</span></a> <a href="javascript:fSelectPwd();" class="btnType gray"
							id="findPwd"><span>비밀번호 찾기</span></a>
					</div>
				</dd>
				<dd class="content">

					<!-- 아이디/비밀번호 찾기 폼 -->
					<table class="row" id="findForm">
						<tbody>
							<tr>
								<td id="registerEmailId"><input type="text" id="emailText"
									data-code="I" placeholder="가입하신 이메일을 입력하세요" size="30"
									style="height: 30px;" /> <a href="javascript:SendEmail();"
									class="btnType blue" id="findIdSubmit"><span>이메일 전송</span></a></td>

								<td id="confirm"><input type="text" id="emailNum"
									name="authnum" placeholder="전송된 인증번호를 입력하세요" size="30"
									style="height: 30px;" /> <a href="javascript:SendComplete();"
									class="btnType blue" id="sendMail"><span>인증하기</span></a></td>
							</tr>
						</tbody>
					</table>

					<table class="row" id="findPwdForm">
						<tbody>
							<tr>
								<td id="loginRegister"><input type="text" id="emailIdText"
									placeholder="가입하신 아이디를 입력하세요" size="30" style="height: 30px;" />
									<a href="javascript:RegisterIdCheck();" class="btnType blue"
									id=""><span>아이디 체크</span></a></td>

								<td id="loginEmail"><input type="text" id="emailPwdText"
									data-code="P" placeholder="가입하신 이메일을 입력하세요" size="30"
									style="height: 30px;" /> <a href="javascript:SendPwdEmail();"
									class="btnType blue" id=""><span>이메일 전송</span></a></td>

								<td id="loginPwd"><input type="text" id="emailPwdNum"
									data-code="P" placeholder="전송된 비밀번호를 입력하세요" size="30"
									style="height: 30px;" /> <a
									href="javascript:SendCompletePwd();" class="btnType blue"
									id="emailOk"><span>인증하기</span></a></td>
							</tr>
						</tbody>
					</table>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
	</form>
</body>
</html>