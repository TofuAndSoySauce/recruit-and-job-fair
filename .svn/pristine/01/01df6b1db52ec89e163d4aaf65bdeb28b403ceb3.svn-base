<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ===============================================  -->
<c:if test="${empty statsbar && empty statsbar2}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:if test="${not empty statsbar && empty statsbar2}">
<!-- 칼럼 차트 -->
<script type="text/javascript">
	var enterArr2 = new Array();  // 기업명
	var agesArr = new Array();  // 연령대
	var agecntArr = new Array(); // 연령대 카운트
	var sexcArr = new Array(); // 성별
</script>
	<%-- <c:if test="${not empty statsbar && empty statsbar2}"> --%>
	<c:forEach items="${statsbar}" var="list4">
		<script>
		enterArr2.push("${list4.ent2}");  // 기업명
		agesArr.push("${list4.age_c}");  // 연령대
		sexcArr.push("${list4.sex_c}"); // 성별
		agecntArr.push("${list4.age_cnt}"); // 연령대별 인원수
		</script>
	</c:forEach>
<script type="text/javascript">
  google.charts.load('current', {packages:['corechart']});
  google.charts.setOnLoadCallback(drawChart2);
  //구글차트
  function drawChart2() {
	  var data2 = new google.visualization.DataTable();
	  //data2.addColumn('string','연령대');
	  //data2.addColumn('string','성별'); //
	  data2.addColumn('string','연령대 및 성별');
	  data2.addColumn('number','인원수');
	  
	  for(var i=0;i<agesArr.length;i++){
		  data2.addRow([ agesArr[i], parseInt(agecntArr[i])  ]);
		  data2.addRow([ sexcArr[i], parseInt(agecntArr[i])  ]);
	  }; 
	  var title_var = '기업별 연령대 및 성별 ( ' + enterArr2[0] + ' )';
	  var options2 = {
		animation : {
			startup : true,
			duration : 1000,
			easing : 'linear'
		},  
			  //title: '기업별 연령대 및 성별',
			  title: title_var,
			  vAxis: {title : '연령대 및 성별'},
			  hAxis: {title: '인원수(명)', 
				  		direction: -1,
			  },
			  seriesType: 'bars',
			  //series: {5: {type: 'line'}},
			  series: {
			      0: {color: '#40a1ec'},
			      1: {color: '#ff8888'}
			    },
			  /* series: {
				 0: { axis: '인원수'},
				 1: { axis: '연령대'}
			  }, */
			  //colors: ['#6495ED','#ffc1cc'],
			  orientation: 'vertical',
			  isStaked: true,
			  bar: {
				  //groupWidth: '100%', 
				  gap: 0},
			  //colors: series 
				  //['#6495ED','#ffc1cc'],
	  };
		 var chart2 = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
		 chart2.draw(data2, options2);
		 //chart2.draw(data, options);
  }
  // style="width: 800px; height: 500px;"
</script>
<div id="chart_div2" style="width: 450px; height: 250px;"></div>
	<%-- </c:if> --%>
</c:if>
<!--  ===============================================  -->
<c:if test="${not empty statsbar2}"> <!-- not empty statsbar &&   -->
<script type="text/javascript">
	var enterArr2_2 = new Array();  // 기업명
	var agesArr2 = new Array();  // 연령대
	var agecntArr2 = new Array(); // 연령대 카운트
	var sexcArr2 = new Array(); // 성별
</script>
	<c:forEach items="${statsbar2}" var="list4_2">
		<script>
		enterArr2_2.push("${list4_2.ent2_2}");  // 기업명
		agesArr2.push("${list4_2.age_c2}");  // 연령대
		sexcArr2.push("${list4_2.sex_c2}"); // 성별
		agecntArr2.push("${list4_2.age_cnt2}"); // 연령대별 인원수
		</script>
	</c:forEach>
<script type="text/javascript">
  google.charts.load('current', {packages:['corechart']});
  //google.charts.load("visualization", "1", {packages: ["corechart"]});
  google.charts.setOnLoadCallback(drawChart2);
  //구글차트
  function drawChart2() {
	  var data2_2 = new google.visualization.DataTable();
	  //data2.addColumn('string','연령대');
	  //data2.addColumn('string','성별'); //
	  data2_2.addColumn('string','연령대 및 성별');
	  data2_2.addColumn('number','인원수');
	  for(var i=0;i<agesArr2.length;i++){
		  data2_2.addRow([ agesArr2[i], parseInt(agecntArr2[i])  ]);
		  data2_2.addRow([ sexcArr2[i], parseInt(agecntArr2[i])  ]);
	  }; 
	  var title_var = '기업별 연령대 및 성별 ( ' + enterArr2_2[0] + ' )';
	  var options2 = {
		animation : {
			startup : true,
			duration : 1000,
			easing : 'linear'
		},  
			  //title: '기업별 연령대 및 성별',
			  title: title_var,
			  vAxis: {title : '연령대 및 성별'},
			  hAxis: {title: '인원수(명)', 
				  		direction: -1,
			  },
			  seriesType: 'bars',
			  //series: {5: {type: 'line'}},
			  series: {
			      0: {color: '#40a1ec'},
			      1: {color: '#ff8888'}
			    },
			  /* series: {
				 0: { axis: '인원수'},
				 1: { axis: '연령대'}
			  }, */
			  //colors: ['#6495ED','#ffc1cc'],
			  orientation: 'vertical',
			  isStaked: true,
			  bar: {
				  //groupWidth: '100%', 
				  gap: 0},
			  //colors: series 
				  //['#6495ED','#ffc1cc'],
	  };
		 var chart2 = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
		 chart2.draw(data2_2, options2);
		 //chart2.draw(data, options);
  }
  // style="width: 800px; height: 500px;"
</script>
<div id="chart_div2" style="width: 450px; height: 250px;"></div>
</c:if>