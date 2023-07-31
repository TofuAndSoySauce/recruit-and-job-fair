<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!--  ===============================================  -->
<c:if test="${empty statspie2 && empty statspie2_2}">
	<tr>
		<td colspan="7">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>
<c:if test="${not empty statspie2 && empty statspie2_2}">
<!-- 파이 차트2 -->
<script type="text/javascript">
	var fnoArr2 = new Array();  // 박람회 번호
	var csizeArr = new Array();  // 기업 규모
	var ccntArr = new Array(); // 기업 규모 카운트	
</script>
<c:forEach items="${statspie2}" var="list6">
	<script>
	fnoArr2.push("${list6.fno3}");  // 박람회 번호
	csizeArr.push("${list6.c_size}"); // 기업 규모
	ccntArr.push("${list6.c_cnt}"); // 기업 규모 카운트
	</script>
</c:forEach>
<script type="text/javascript">
  google.charts.load('current', {packages:['corechart']});
  google.charts.setOnLoadCallback(pieChart2);
  //구글차트
  function pieChart2() {
	  var data4 = new google.visualization.DataTable();
	  
	  data4.addColumn('string','기업 규모');
	  data4.addColumn('number','기업 규모 카운트');
	                                                     
	  for(var i=0;i<csizeArr.length;i++){
		  data4.addRow([ csizeArr[i], parseInt(ccntArr[i]) ]);
	  }
		 
	  var title_var3 = '박람회별 기업 규모 ( ' + fnoArr2[0] + ' 번 박람회 )';
	  var options4 = {
			  //title: '박람회별 기업 규모',
			  title: title_var3,
			  legend:'none',
			  height:400,
			  label:'top',
			  hAxis: {showTextEvery: 1,
			  	fontSize:'5',
			    slantedText: true,
			    slantedTextAngle:45}, 
				animation : { //차트가 뿌려질때 실행될 애니메이션 효과
					startup : true,
					duration : 1000,
					easing : 'inAndOut',
			  },
			  pieSliceText:'label',
			  is3D : true,
			//backgroundColor: 'transparent',
			pieHole : 0.4,
			colors: ['#40E0D0','#F88379','#FFD93A'],
	  };
	  
		 var chart4 = new google.visualization.PieChart(document.getElementById('chart_div4'));
		 chart4.draw(data4, options4);
		 //chart.draw(data, options);
  }
  // style="width: 800px; height: 500px;"
</script>
<div id="chart_div4" style="width: 450px; height: 250px;"></div>
</c:if>
<!--  ===============================================  -->
<c:if test="${not empty statspie2_2}">
<!-- 파이 차트2 -->
<script type="text/javascript">
	var fnoArr2_2 = new Array();  // 박람회 번호
	var csizeArr2 = new Array();  // 기업 규모
	var ccntArr2 = new Array(); // 기업 규모 카운트	
</script>
<c:forEach items="${statspie2_2}" var="list6_2">
	<script>
	fnoArr2_2.push("${list6_2.fno3_2}");  // 박람회 번호
	csizeArr2.push("${list6_2.c_size2}"); // 기업 규모
	ccntArr2.push("${list6_2.c_cnt2}"); // 기업 규모 카운트
	</script>
</c:forEach>
<script type="text/javascript">
  google.charts.load('current', {packages:['corechart']});
  google.charts.setOnLoadCallback(pieChart2);
  //구글차트
  function pieChart2() {
	  var data4_2 = new google.visualization.DataTable();
	  
	  data4_2.addColumn('string','기업 규모');
	  data4_2.addColumn('number','기업 규모 카운트');
	  console.log('fnoArr2_2 : ' + fnoArr2_2[0]);
	  console.log('csizeArr2 : ' + csizeArr2[0]);
	  console.log('ccntArr2 : ' + ccntArr2[0]);
	  for(var i=0;i<csizeArr2.length;i++){
		  data4_2.addRow([ csizeArr2[i], parseInt(ccntArr2[i]) ]);
		  console.log('lolololol');
	  }
		 
	  var title_var3 = '박람회별 기업 규모 ( ' + fnoArr2_2[0] + ' 번 박람회 )';
	  var options4 = {
			  //title: '박람회별 기업 규모',
			  title: title_var3,
			  legend:'none',
			  height:400,
			  label:'top',
			  hAxis: {showTextEvery: 1,
			  	fontSize:'5',
			    slantedText: true,
			    slantedTextAngle:45}, 
				animation : { //차트가 뿌려질때 실행될 애니메이션 효과
					startup : true,
					duration : 1000,
					easing : 'inAndOut',
			  },
			  pieSliceText:'label',
			  is3D : true,
			//backgroundColor: 'transparent',
			pieHole : 0.4,
			colors: ['#40E0D0','#F88379','#FFD93A'],
	  };
	  
		 var chart4 = new google.visualization.PieChart(document.getElementById('chart_div4'));
		 chart4.draw(data4_2, options4);
		 //chart.draw(data, options);
  }
  // style="width: 800px; height: 500px;"
</script>
<div id="chart_div4" style="width: 450px; height: 250px;"></div>
</c:if>