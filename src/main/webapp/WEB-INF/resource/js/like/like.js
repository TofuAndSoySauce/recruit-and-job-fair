$(function () {
  bookmarkEvent();
});

function bookmarkEvent() {
  $(document).on("click", ".bookmarkButton", bookmarkHandler);
}

function bookmarkHandler(event) {
  event.preventDefault();
  const adNo = $(this).closest("tr").find(".adNo").val();
  const redirectPageUrl = window.location.href;

  var loginId = $("#loginId").val();

  const param = JSON.stringify({
    adNo: adNo,
    loginId: loginId,
    redirectPageUrl: redirectPageUrl,
  });

  console.log(param);

  var submitCallback = function (response) {
    console.log(response);
    alert("즐겨찾기에 추가 되었습니다.");
    window.location.replace(response);
  };

  $.ajax({
    url: "/like/post.do",
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
        alert("이미 즐겨찾기 이력이 있습니다.");
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
