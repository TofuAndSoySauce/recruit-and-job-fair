<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ===============================================  -->
<c:if test="${empty statspie1 && empty statspie1_2}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:if test="${not empty statspie1 && empty statspie1_2}">
	<!-- 파이 차트1 -->
	<script type="text/javascript">
		var fnoArr = new Array(); // 박람회 번호
		var sexfcArr = new Array(); // 성별
		var sexfcntArr = new Array(); // 성별 카운트
	</script>
	<%-- <c:if test = "${not empty statspie1 && empty statspie1_2}"> --%>
	<c:forEach items="${statspie1}" var="list5">
		<script>
			fnoArr.push("${list5.fno2}");  // 박람회 번호
			sexfcArr.push("${list5.sex_fc}"); // 성별
			sexfcntArr.push("${list5.sex_fcnt}"); // 성별 카운트
		</script>
	</c:forEach>
	<script type="text/javascript">
		google.charts.load('current', {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(pieChart);
		//구글차트
		function pieChart() {
			var data3 = new google.visualization.DataTable();
			data3.addColumn('string', '성별');
			data3.addColumn('number', '성별 카운트');
			//console.log(111);
			for (var i = 0; i < sexfcArr.length; i++) {
				data3.addRow([ sexfcArr[i], parseInt(sexfcntArr[i])  ]);
			}
			var title_var2 = '박람회별 성별 ( ' + fnoArr[0] + ' 번 박람회 )';
			var options3 = {
				//title : '박람회별 성별',
				title: title_var2,
				legend : 'none',
				height : 400,
				label : 'top',
				hAxis : {
					showTextEvery : 1,
					fontSize : '5',
					slantedText : true,
					slantedTextAngle : 45
				},
				animation : { //차트가 뿌려질때 실행될 애니메이션 효과
					startup : true,
					duration : 1000,
					easing : 'inAndOut',
				},
				pieSliceText : 'label',
				is3D : true,
				//backgroundColor: 'transparent',
				colors: ['#6495ED','#ffc1cc'],
			};

			var chart3 = new google.visualization.PieChart(document
					.getElementById('chart_div3'));
			chart3.draw(data3, options3);
		}
	</script>
	<div id="chart_div3" style="width: 450px; height: 250px;"></div>
	<%-- </c:if> --%>
</c:if>
<!--  ===============================================  -->
<c:if test="${not empty statspie1_2}">
	<!-- 파이 차트1_2 -->
	<script type="text/javascript">
		var fnoArr1_2 = new Array(); // 박람회 번호
		var sexfcArr2 = new Array(); // 성별
		var sexfcntArr2 = new Array(); // 성별 카운트
	</script>
	<c:forEach items="${statspie1_2}" var="list5_2">
		<script>
			fnoArr1_2.push("${list5_2.fno2_2}");  // 박람회 번호
			sexfcArr2.push("${list5_2.sex_fc2}"); // 성별
			sexfcntArr2.push("${list5_2.sex_fcnt2}"); // 성별 카운트
		</script>
	</c:forEach>
	<script type="text/javascript">
		google.charts.load('current', {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(pieChart);
		//구글차트
		function pieChart() {
			var data3_2 = new google.visualization.DataTable();
			data3_2.addColumn('string', '성별');
			data3_2.addColumn('number', '성별 카운트');
			//console.log(111);
			for (var i = 0; i < sexfcArr2.length; i++) {
				data3_2.addRow([ sexfcArr2[i], parseInt(sexfcntArr2[i])  ]);
			}
			var title_var2 = '박람회별 성별 ( ' + fnoArr1_2[0] + ' 번 박람회 )';
			var options3 = {
				//title : '박람회별 성별',
				title: title_var2,
				legend : 'none',
				height : 400,
				label : 'top',
				hAxis : {
					showTextEvery : 1,
					fontSize : '5',
					slantedText : true,
					slantedTextAngle : 45
				},
				animation : { //차트가 뿌려질때 실행될 애니메이션 효과
					startup : true,
					duration : 1000,
					easing : 'inAndOut',
				},
				pieSliceText : 'label',
				is3D : true,
				//backgroundColor: 'transparent',
				colors: ['#6495ED','#ffc1cc'],
			};

			var chart3 = new google.visualization.PieChart(document
					.getElementById('chart_div3'));
			chart3.draw(data3_2, options3);
		}
	</script>
	<div id="chart_div3" style="width: 450px; height: 250px;"></div>
</c:if>