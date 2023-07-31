<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Q&A</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->

</head>
<body>
   <form id="myForm" action="" method="">
      <input type="hidden" name="action" id="action" value=""> <input
         type="hidden" name="loginId" id="loginId" value="${loginId}">
      <input type="hidden" name="userType" id="userType" value="${userType}">
      <input type="hidden" name="qna_no" id="qna_no" value=""> 
      <input type="hidden" name="currentpage" id="currentpage" value="">
      <input type="hidden" name="filecd" id="filecd" value="">

      <!-- 모달 배경 -->
      <div id="mask"></div>

      <div id="wrap_area">

         <h2 class="hidden">header 영역</h2>
         <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

         <h2 class="hidden">컨텐츠 영역</h2>
         <div id="container">
            <ul>
               <li class="lnb">
                  <!-- lnb 영역 --> <jsp:include
                     page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
               </li>
               <li class="contents">
                  <!-- contents -->
                  <h3 class="hidden">contents 영역</h3> <!-- content -->
                  <div class="content">

                     <p class="Location">
                        <a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a>
                        <span class="btn_nav bold">실습</span>
                        <span class="btn_nav bold">Q&A관리</span>
                        <a href="/community/qna.do" class="btn_set refresh">새로고침</a>
                     </p>
                     <p class="conTitle">
                        <span class="btn_nav bold">Q&A </span>
                     </p>

                     <p>
                        <span class="fr"> 제목 <input type="text" id="srctitle"
                           name="srctitle" /> <input type="date" id="srcsdate"
                           name="srcsdate" /> ~ <input type="date" id="srcedate"
                           name="srcedate" /> <a class="btnType blue"
                           href="javascript:qnalist();" name="modal"><span>검색</span></a>
                          <c:if test = "${sessionScope.userType eq 'B' || sessionScope.userType eq 'C' }">
                        <a class="btnType blue" href="javascript:insertqna();" name="modal"><span>등록</span></a>
                        </c:if>
                        </span>
                     </p>
                     <div class="divComGrpCodList" id="space">
                        <table class="col">
                           <caption>caption</caption>
                           <colgroup>
                              <col width="6%">
                              <col width="12%">
                              <c:if test="${sessionScope.userType eq 'A'}">
                              <col width="5%">
                              </c:if>
                              <col width="30%">
                              <col width="10%">
                           </colgroup>
                           <thead>
                              <tr>
                                 <th scope="col">번호</th>
                                 <th scope="col">날짜</th>
                                  <c:if test="${sessionScope.userType eq 'A'}">
                                 <th scope="col">기업/개인</th>
                                 </c:if>
                                 <th scope="col">제목</th>
                                 <th scope="col">답변여부</th>
                              </tr>
                           </thead>
                           <tbody id="listqna"></tbody>
                        </table>
                     </div>

                     <div class="paging_area" id="qnaPagination"></div>

                  </div> <!--// content -->

                  <h3 class="hidden">풋터 영역</h3> <jsp:include
                     page="/WEB-INF/view/common/footer.jsp"></jsp:include>
               </li>
            </ul>
         </div>
      </div>

      <div id="qnaregfile" class="layerPop layerType2"
         style="width: 600px;">
         <dl>
            <dt>
               <strong>Q&A 등록/수정</strong>
            </dt>
            <dd class="content">
               <!-- s : 여기에 내용입력 -->
               <table class="row">
                  <caption>caption</caption>
                  <colgroup>
                     <col width="120px">
                     <col width="*">
                     <col width="120px">
                     <col width="*">
                  </colgroup>

                  <tbody>
                     <tr>
                        <th scope="row">제목 <span class="font_red">*</span></th>
                        <td colspan="3"><input type="text" class="inputTxt p100" name="qna_title" id="qna_title" /></td>
                     </tr>

                     <tr>
                        <th scope="row">내용 <span class="font_red">*</span></th>
                        <td colspan="3"><textarea class="inputTxt p100"   name="qna_content" id="qna_content"> </textarea></td>
                     </tr>

                     <tr>
                        <th scope="row">파일 <span class="font_red">*</span></th>
                        <c:if test = "${sessionScope.userType eq 'B' || sessionScope.userType eq 'C' }">
                           <td>
                              <input type="file" class="btnType blue" name="multifile"
                              id="multifile" />
                           </td>
                           <td colspan="2"><div id="fileview"></div></td>
                        </c:if>
                        <c:if test = "${sessionScope.userType eq 'A'}">
                           <td colspan="3"><div id="fileview"></div></td>
                        </c:if>
                     </tr>
                     
                     <tr id="commentHide">
                        <th>답변</th>
                        <td  colspan="3">
                        <c:choose>
                           <c:when test="${sessionScope.userType eq 'A'}">
                           <textarea name="qnacomment" class="inputTxt p100" id="qnacomment"></textarea>
                           </c:when>
                           <c:otherwise>
                           <span id="commentDate"></span>
                           <br/>
                           <span id="qnacomment"></span>
                           </c:otherwise>                        
                        </c:choose>
                        </td>
                     </tr>

                  </tbody>
               </table>

               <!-- e : 여기에 내용입력 -->

               <div class="btn_areaC mt30">
                  <a href="javascript:openinsert();" class="btnType blue" id="btnSavefile" name="btn"><span>저장</span></a>
                  <a href="javascript:deletebtn();" class="btnType blue" id="btnDeletefile" name="btn"><span>삭제</span></a>
                  <a href="" class="btnType gray" id="btnClosefile" name="btn"><span>닫기</span></a>
               </div>
            </dd>
         </dl>
         <a href="" class="closePop"><span class="hidden">닫기</span></a>
      </div>

   </form>
   
   
   <script type="text/javascript">
   
   // 페이징 설정을 하는 겁니다 
   var pageSize = 10;
   var pageBlockSize = 5;
   
   $(function() {
      qnalist();
      
   });
   
   //qna리스트
   function qnalist(cpage){
      
      cpage = cpage || 1;
      
      var data ={
         qna_title : $("#srctitle").val(),
         start_date : $("#srcsdate").val(),
         end_date : $("#srcedate").val(),
         pageSize : pageSize,
         cpage : cpage
      }
      
      var callbackqna = function(res){
         console.log(res);
         var html = "";
         
         if(res.list.length == 0){
            console.log(res.list.length);
            
            html += "<td colspan='4'>조회된 내용이 없습니다</td>";
         }else{
            for(var i=0; i<res.list.length; i++){
               
               var idx = (pageSize * (cpage -1)) + (i+1);
               
               html += "<tr>";
               html += "<td>"+idx+"</td>";
               // html += "<td>"+res.list[i].qna_no+"</td>";
               html += "<td>"+res.list[i].reg_date+"</td>";
               if($("#userType").val() == 'A'){
                  html += "<td>" + res.list[i].user_type +"</td>";
               }            
               html += "<td><a href='javascript:btnTitle("+res.list[i].qna_no+")'>"+res.list[i].qna_title+"</a></td>";
               if(res.list[i].qna_answer == "1"){
                  html += "<td>미답변</td>";
               }else{
                  html += "<td>답변</td>";
               }
               
               html += "</tr>";
            }
         }
         $("#listqna").html(html);
         //카운트
         var count = res.countqnalist;
         //페이징 처리
         var paging = getPaginationHtml(cpage, count, pageSize, pageBlockSize, 'qnalist');
         
         $("#qnaPagination").empty().append(paging);
         $("#currentpage").val(cpage);
      }
      callAjax("/community/qnaList.do","post","JSON","false",data,callbackqna);
   }
         
         
   
   //상세페이지
   //S는 등록, l은 수정, c는 코멘트등록
   function btnTitle(qna_no) {
      
      $("#action").val("l");
      
      gfModalPop("#qnaregfile");
      $("#btnDeletefile").show();
      $("#btnSavefile").html('<span>수정</span>');
      $("#qnacomment").val('');
      $("#multifile").val("");   //파일객체 비우기
      $("#fileview").empty();      //미리보기 비우기
      
      if($("#userType").val() == 'A'){
      //사용자가 관리자일때
         $("#action").val("c");
      //코멘트 등록할때 저장버튼 보여줘
         $("#btnSavefile").html('<span>저장</span>');
      }
      var qnadetail = {
            qna_no : qna_no
      }
      
      var btndetail = function(res){
         console.log(res);
         $("#qna_no").val(res.qna_no);
         $("#qna_title").val(res.qna_title);
         $("#qna_content").val(res.qna_content);
         if($("#userType").val() == 'A'){//관리자 일때는 답변 텍스트area보여줘
            $("#qnacomment").val(res.comment_content);
         }else{//관리자 아니면 span테그 html로 보여줘 날짜까지
            $("#qnacomment").html(res.comment_content);
            $("#commentDate").html(res.reg_date);
            
         }
         $("#filecd").val(res.file_cd);
         
         //로그인한 아이디와 작성자가 같고 관리자이면 수정할 수 있게 만들기
         //로그인 히든태그에서 가져와서 res에 담긴 아이디랑 같으면
         //수정,삭제,닫기 보여주기
         if($("#loginId").val() == res.loginID || $("#userType").val() == 'A'){
            $("#btnDeletefile").show();
            $("#btnSavefile").show();
         }else{
            $("#btnDeletefile").hide();
            $("#btnSavefile").hide();
            //같이안으면 리드온리!
            $("#qna_content").attr("readonly","readonly");
            $("#qna_title").attr("readonly","readonly");
         }
         
         // 저장된 파일 미리보기
         var file_name = res.file_name;
         var filearr = [];
         var previewhtml = "";
         
         if( file_name == "" || file_name == null || file_name == undefined) {
            previewhtml = "";
         } else {
            filearr = file_name.split(".");
            if (filearr[1] == "jpg" || filearr[1] == "png") {
               previewhtml = "<a href='javascript:fn_downaload()'>   <img src='" + res.file_nadd + "' style='width: 200px; height: 130px;' />  </a>";
            } else {
               previewhtml = "<a href='javascript:fn_downaload()'>" + res.file_name  + "</a>";
            }
         }
         $("#fileview").empty().append(previewhtml);         
      }
      
      callAjax("/community/qnaDetail.do","post","JSON","false",qnadetail,btndetail);
   }
   
   //파일 미리보기
   var imgView = $("#multifile");
   imgView.on("change", function(event){
      $("#fileview").empty();
      var image = event.target;
      var imgpath = "";
      if(image.files[0]){
         imgpath = window.URL.createObjectURL(image.files[0]);
         
         var filearr = $("#multifile").val().split(".");
         
         var previewhtml = "";
         
         console.log(filearr);
         
         if(filearr[1] == "jpg" || filearr[1] == "png"){
            previewhtml = "<img src='" + imgpath + "' style='width: 200px; height:130px;' />";
         }
         $("#fileview").empty().append(previewhtml);
      }
   });
   
   
   //등록
   function insertqna(){
      
      //d
      $("#qna_content").attr("readonly",false);
      $("#qna_title").attr("readonly",false);
      $("#btnSavefile").html('<span>저장</span>');
      $("#action").val("s");
      gfModalPop("#qnaregfile");
      $("#btnDeletefile").hide();
      $("#qna_content").val('');//초기화 하는 이유는 전에 불러왔던 데이터가 뜨기때문에 꼭 초기화 해줘야한다!
      $("#qna_title").val('');
      $("#qnacomment").val('');
      $("#commentHide").hide();
      $("#multifile").val("");   //파일 객체 비우기
      $("#fileview").empty();      //미리보기 비우기
      
   }
   
   //저장
   function openinsert(){
      //액션으로 어떤 행위를 했는지 구문
      let d = $("#action").val();
      var pop = "";
         if($("#qna_title").val() == null || $("#qna_title").val() == '' ){
           alert("제목을 입력해주세요");
           
           return false;
           }else if($("#qna_content").val() == null || $("#qna_content").val() == ''){
              alert("내용을 입력해주세요")
           
              return false;
           }
      
      
      if(d == "s"){
         var frm = document.getElementById("myForm");
         frm.enctype = "multipart/form-data";
         var param = new FormData(frm);
         
         /* var insertdata = {
               qna_title : $("#qna_title").val(),
               qna_content : $("#qna_content").val()
         } */
            
         var callbackinsert= function(res){
            //저장에 성공하였습니다.
            
             
            alert("저장하였습니다.");
            
            gfCloseModal();
            qnalist();
         }
         callAjaxFileUploadSetFormData("/community/qnaInsert.do", "post", "json", true, param, callbackinsert);
         //callAjax("/community/qnaInsert.do","post","JSON","false",insertdata,callbackinsert);
      } 
      else if(d == "l"){
         
         //수정
/*          var updateData = {
               qna_title : $("#qna_title").val(),
               qna_content : $("#qna_content").val(),
               qna_no : $("#qna_no").val()
         }
         var callbackupdate= function(res){
            //저장에 성공하였습니다.
            alert("수정하였습니다.");
            gfCloseModal();
            qnalist();
         }
         callAjax("/community/qnaUpdate.do","post","JSON","false",updateData,callbackupdate); */
         
         //수정시 파일 업로드
         var frm = document.getElementById("myForm");
         frm.enctype = "multipart/form-data";
         var param = new FormData(frm);
         
         var callbackupdate= function(res){
            //저장에 성공하였습니다.
            alert("저장하였습니다.");
            gfCloseModal();
            qnalist();
         }
         callAjaxFileUploadSetFormData("/community/qnaUpdate.do", "post", "json", true, param, callbackupdate);
         
      }
      else if(d == "c") {
         
         //댓글등록
         var insertcomment ={
               comment_content : $("#qnacomment").val(),
               qna_no : $("#qna_no").val()
         }
         var commentdata = function(commentres){
            //댓글등록
            alert("저장되었습니다.")
            gfCloseModal();
            qnalist();
         }
         callAjax("/community/insertComment.do","post","JSON","false",insertcomment,commentdata);
      }
   }
   
   
   //삭제
   function deletebtn(){
      var qnadelete = {
            qna_no : $("#qna_no").val()
      }
      
      var btndelete = function(res){
         console.log(res)
         alert("삭제되었습니다");
         gfCloseModal();
         qnalist();
      }
      callAjax("/community/qnaDelete.do","post","JSON","false",qnadelete,btndelete);
   }
   
   
   
   
   </script>
   
   
</body>
</html>