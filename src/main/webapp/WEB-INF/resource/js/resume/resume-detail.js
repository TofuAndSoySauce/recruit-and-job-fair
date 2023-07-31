// 이력서 상세보기
function popupResumeDetail(resume_no) {
  console.log(resume_no);
  resume_no = resume_no;
  var param = {
    resume_no: resume_no,
  };

  var detailCallback = function (res) {
    setResumeDetail(res);
    gfModalPop("#resumeDetailModal");
  };

  callAjax(
    "/resume/resumeDetailForInterview.do",
    "post",
    "json",
    "false",
    param,
    detailCallback
  );
}

function setResumeDetail(object) {
  console.log(object);

  console.log(object.user_phone);
  console.log(object.user_birthday);

  // 개인정보
  $("#resume_title").text(object.resume_title);
  $("#resume_picture").attr("src", object.file_nadd);
  $("#name").text(object.name);
  $("#phone").text(object.user_phone);
  $("#birthday").text(object.user_birthday);
  $("#sexuality").text(object.user_sexuality);
  $("#email").text(object.user_email);
  const address = object.user_address1 + object.user_address2;
  $("#address").text(address);
  $("#resume_education").text(object.resume_education);
  $("#resume_school").text(object.resume_school);
  $("#resume_major").text(object.resume_major);
  $("#resume_position").text(object.resume_position);
  $("#resume_location").text(object.resume_location);
  $("#resume_hireType").text(object.resume_hireType);
  $("#resume_salary").text(object.resume_salary);
  $("#resume_experience").text(object.resume_experience);

  $("#resume_letterTitle").text(object.resume_letterTitle);
  $("#resume_letterContent").text(object.resume_letterContent);
  $("#resume_yn").text(object.resume_yn);
  $("#update_date").text(object.update_date);

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

  //   disableAllSelectTags();

  //   function disableAllSelectTags() {
  //     const parentModal = document.getElementById("adDetailModal");
  //     const selectTags = parentModal.querySelectorAll("select");

  //     selectTags.forEach((s) => {
  //       s.disabled = true;
  //     });
  //   }
  //   // 기업 사진
  //   var img = document.getElementById("company_picture");
  //   img.src = object.file_nadd;
  // }

  // 오늘 날짜 가져오는 함수
}
