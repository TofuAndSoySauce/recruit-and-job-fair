<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ===============================================  -->
<c:if test="${empty statscol}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:if test="${not empty statscol}">
<!-- 칼럼 차트 -->
<script type="text/javascript">
	var likeArr = new Array();  //선호도
	var enterArr = new Array();  // 기업명
</script>
<c:forEach items="${statscol}" var="list3">
	<script>
	likeArr.push(${list3.pct});  //선호도
	enterArr.push("${list3.ent}");  //기업명
	</script>
</c:forEach>
<script type="text/javascript">
  google.charts.load('current', {packages:['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  //구글차트
  function drawChart() {
	  var data = new google.visualization.DataTable();
	  data.addColumn('string','기업명');                                      
	  data.addColumn('number','선호도');
	                                                    
	  for(var i=0;i<enterArr.length;i++){
			data.addRow([enterArr[i], likeArr[i]]);
		}
	  
	  var options = {
		animation : {
			startup : true,
			duration : 1000,
			easing : 'linear'
		},  
			  title: '전체 기업별 선호도 (%)',
			  vAxis: {title : '선호도(%)'},
			  hAxis: {title: '기업명'},
			  seriesType: 'bars',
			  series: {5: {type: 'line'}},
			  colors: ['#3CB371'],
			  backgroundColor: 'transparent',
	  };
	  
		/* for(var i=0;i<dateArr.length;i++){
			data.addRow([likeArr[i],enterArr[i]]);
		} */
		/* var options = {
			animation : { //차트가 뿌려질때 실행될 애니메이션 효과
				startup : true,
				duration : 1000,
				easing : 'linear'
			},
			seriesType : 'bars',
			series : {2: {type:'line',
						  targetAxisIndex: 1},			
		   },
		   vAxes: {0: {
           	title:'선호도'
           }, 	
           }
		} */
		 var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		 chart.draw(data, options);
		 //chart.draw(data, options);
  }
  // style="width: 800px; height: 500px;"
</script>
<div id="chart_div" style="width: 450px; height: 250px;"></div>
</c:if>
<!--  ===============================================  -->