// 채용공고 상세보기 팝업
function popupAdDetail(ad_no) {
  adNo = ad_no;
  var param = {
    ad_no: ad_no,
  };

  var detailCallback = function (res) {
    setAdDetail(res);
    gfModalPop("#adDetailModal");
  };

  callAjax(
    "/ad/adDetailForUser.do",
    "post",
    "json",
    "false",
    param,
    detailCallback
  );
}

// 채용공고 정보를 조회하여 채워 넣음
function setAdDetail(object) {
  console.log(object);
  let today = new Date();

  let year = today.getFullYear();
  let month = today.getMonth() + 1;
  if (month < 10) month = "0" + month;
  let date = today.getDate();
  if (date < 10) date = "0" + date;

  let now = year + "-" + month + "-" + date;

  // 기업정보
  $("#addfile").val("");
  const adTitle = document.getElementById("ad_title");
  adTitle.textContent = object.ad_title;
  $("#companyName").val(object.name);
  $("#user_phone").val(object.user_phone);
  $("#user_birthday").val(object.user_birthday);
  $("#user_company_size").val(object.user_company_size);
  $("#user_email").val(object.user_email);
  $("#user_company_category").val(object.user_company_category);
  const address = object.user_address1 + object.user_address2;
  $("#user_address").val(address);

  // 채용정보
  $("#ad_experience").val(object.ad_experience);
  $("#ad_salary").val(object.ad_salary);
  $("#ad_education").val(object.ad_education);
  $("#ad_position").val(object.ad_position);
  $("#ad_role").val(object.ad_role);
  $("#ad_type").val(object.ad_type);
  $("#ad_location").val(object.ad_location);
  $("#ad_perference").val(object.ad_perference);
  $("#ad_date").val(object.ad_date);
  const adContent = document.getElementById("ad_content");
  adContent.textContent = object.ad_content;

  // 이미 지원했다면 지원날짜를, 그렇지 않으면 버튼을 출력
  checkApplied(object.appliedAt);

  function checkApplied(date) {
    const appliedAt = object.appliedAt;
    var buttonArea = $("#acceptBox");
    buttonArea.empty();
    const message = `${appliedAt}에 이미 지원하셨습니다! 지원현황을 확인해주세요`;
    let data = "";
    if (appliedAt != null && appliedAt != "0") {
      data = `<p> ${message} </p>`;
    } else {
      data =
        '<a href="#" class="btnType blue resumeListButton" id="btnRestart" name="btn"><span>지원하기</span></a>';
    }

    buttonArea.append(data);
  }

  // 디테일 코드 매핑 및 readonly 처리
  comcombo(
    "company_size",
    "user_company_size",
    "sel",
    object.user_company_size
  );
  comcombo(
    "company_category",
    "user_company_category",
    "sel",
    object.user_company_category
  );
  comcombo("resume_experience", "ad_experience", "sel", object.ad_experience);
  comcombo("resume_salary", "ad_salary", "sel", object.ad_salary);
  comcombo("education", "ad_education", "sel", object.ad_education);
  comcombo("position", "ad_position", "sel", object.ad_position);
  comcombo("ad_role", "ad_role", "sel", object.ad_role);
  comcombo("ad_type", "ad_type", "sel", object.ad_type);
  comcombo("location", "ad_location", "sel", object.ad_location);

  disableAllSelectTags();

  function disableAllSelectTags() {
    const parentModal = document.getElementById("adDetailModal");
    const selectTags = parentModal.querySelectorAll("select");

    selectTags.forEach((s) => {
      s.disabled = true;
    });
  }
  // 기업 사진
  var img = document.getElementById("company_picture");
  img.src = object.file_nadd;
}

// 오늘 날짜 가져오는 함수
function getToday() {
  var date = new Date();
  var year = date.getFullYear();
  var month = ("0" + (1 + date.getMonth())).slice(-2);
  var day = ("0" + date.getDate()).slice(-2);

  return year + "-" + month + "-" + day;
}
