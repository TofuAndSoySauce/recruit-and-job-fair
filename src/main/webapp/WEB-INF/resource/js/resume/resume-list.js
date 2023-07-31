let adNo;
let resumeNo;

$(function () {
  setResumeListButtonEvent();
  fetchResumeList();
  setResumeNumberEvent();
});

// 이력서 목록 불러오기
function fetchResumeList() {
  const param = {
    pageSize: 5,
    cpage: 1,
  };

  var resumeListCallback = function (response) {
    console.log(response);
    if (response.length == 0) {
      const $aTag = $("<a>이력서작성하러가기</a>");
      const $pTag = $("<p>이력서가 없습니다. 이력서를 작성해주세요.</p>");
      $aTag.attr("href", "http://localhost/resume/resumeMgt.do");
      $("#resumeList").append($aTag).append($pTag);
    } else {
      for (let i = 0; i < response.length; i++) {
        const item = response[i];
        const inputElement = $("<input>").attr({
          type: "radio",
          name: "resumeSelection",
          value: item.resume_no,
        });

        const listElement = $("<li>").attr({
          class: "resumeElement",
        });

        const labelElement = $("<label>")
          .attr({ class: "resumeLabel" })
          .text(`(${item.resume_title})`);

        labelElement.append(inputElement);
        listElement.append(labelElement);

        $("#resumeList").append(listElement);
      }

      const $aTag = $("<a></a>");

      $aTag.addClass("btnType blue");
      $aTag.attr("href", "javascript:submitResume()");
      $aTag.attr("name", "modal");

      var $spanTag = $("<span>지원하기</span>");

      $aTag.append($spanTag);
      $(".submitArea").append($aTag);
    }
  };

  callAjax(
    "/resume/resumeListJson.do",
    "GET",
    "json",
    "false",
    param,
    resumeListCallback
  );
}

// 이력서 목록 불러오기 이벤트를 지원하기 버튼에 부착
function setResumeListButtonEvent() {
  var buttons = document.getElementsByClassName("resumeListButton");

  $(document).on("click", ".resumeListButton", popupResumeListModal);
  $(document).on(
    "click",
    '#resumeListModal input[type="radio"]',
    setValueForSubmit
  );

  function popupResumeListModal() {
    $("#resumeListModal").show();
    $('#resumeListModal input[type="radio"]').prop("checked", false);

    $(".submitArea > a.close").click(function (event) {
      if (!$(event.target).closest(".modal-content").length) {
        $("#resumeListModal").hide();
      }
    });
  }

  function setValueForSubmit() {
    resumeNo = $('#resumeListModal input[type="radio"]:checked').val();
    console.log(`adNo: ${adNo}, resumeNo: ${resumeNo}`);
  }
}

function setResumeNumberEvent() {
  $("#listNotice").on("click", ".resumeListButton", function (event) {
    event.preventDefault();

    adNo = $(this).closest("tr").find(".adNo").val();

    console.log(`공고번호 ${adNo}`);
  });
}

function submitResume() {
  const redirectPageUrl = window.location.href;

  var loginId = $("#loginId").val();

  const param = JSON.stringify({
    adNo: adNo,
    resumeNo: resumeNo,
    loginID: loginId,
    redirectPageUrl: redirectPageUrl,
  });

  console.log(param);

  var submitCallback = function (response) {
    
    if (typeof response === "string") {
        response = response.trim(); // Remove any leading/trailing spaces

        if (response.length > 0) {
        	location.reload();
          console.log("Redirecting to: ", response);
          alert("정상 제출 되었습니다.");
          window.location.href = response; // Redirect to the received URL
          return;
        }
      }
    
    console.error("invalid response");
    alert("An error occurred while processing your request.");
  };

  $.ajax({
    url: "/resume/submit.do",
    type: "POST",
    dataType: "text",
    async: true,
    data: param,
    contentType: "application/json",
    beforeSend: function (xhr) {
      xhr.setRequestHeader("AJAX", "true");
      $.blockUI({
        message:
          '<h1><img src="/images/admin/comm/busy.gif" /> Just a moment...</h1>',
        T: 99999,
      });
    },
    success: function (data) {
      submitCallback(data);
    },
    error: function (xhr, status, err) {
      console.log("xhr : " + xhr);
      console.log("status : " + status);
      console.log("err : " + err);

      if (xhr.status == 901) {
        alert("로그인 정보가 없습니다.\n다시 로그인 해 주시기 바랍니다.");
        location.replace("/login.do");
      } else if (xhr.status == 500) {
        alert("이미 지원한 이력이 있습니다.");
        location.replace(redirectPageUrl);
      } else {
        alert("A system error has occurred." + err);
      }
    },
    complete: function (data) {
      $.unblockUI();
    },
  });
}
