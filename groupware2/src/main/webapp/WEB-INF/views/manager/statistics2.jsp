<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <!-- 헤드 네비게이션 효과 -->
  <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Gender', 'Count'],
        ['남자', ${map.m}],
        ['여자', ${map.f}]
      ]);

      var options = {
        title: '남녀 비율',
        is3D: true,
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
      chart.draw(data, options);
    }
});
$(document).ready(function(){
	google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {      
      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Rank');
      data.addColumn('number', 'Count');
      //data.addColumn({type:'string', role:'tooltip'});
      
      var length = 0;
      <c:forEach var="d" items="${rank}" varStatus="status">
	  var length = "${status.count}";
 	 </c:forEach>
 	 
    data.addRows(parseInt(length));
      <c:forEach var="r" items="${rank}" varStatus="status">
    	  data.setCell(${status.count-1}, 0, '${r.name}');
    	  data.setCell(${status.count-1}, 1, '${r.count}');
    	  //data.setCell(${status.count-1}, 2, '${r.name}<br>${r.count}명');
      </c:forEach>

      var options = {
        title: '부서별 직원 비율',
        pieHole: 0.4,
      };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(data, options);
    }
});
$(document).ready(function(){
	google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
    	var data = new google.visualization.DataTable();
        data.addColumn('string', 'Department');
        data.addColumn('number', 'Count');
        
        var length = 0;
        <c:forEach var="d" items="${dept}" varStatus="status">
  	  var length = "${status.count}";
   	 </c:forEach>
   	 
      data.addRows(parseInt(length));
        <c:forEach var="d" items="${dept}" varStatus="status">
      	  data.setCell(${status.count-1}, 0, '${d.name}');
      	  data.setCell(${status.count-1}, 1, '${d.count}');
        </c:forEach>

      var options = {
        title: '직급별 직원 비율',
      };

      var chart = new google.visualization.PieChart(document.getElementById('piechart'));

      chart.draw(data, options);
    }
});
$(document).ready(function(){
	var myConfig = {
		 	type: "pie", 
		 	plot: {
		 	  borderWidth: 5,
		 	  // slice: 90,
		 	  valueBox: {
		 	    placement: 'out',
		 	    text: '%t\n%npv%',
		 	    fontFamily: "Open Sans"
		 	  },
		 	  tooltip:{
		 	    fontSize: '18',
		 	    fontFamily: "Open Sans",
		 	    padding: "5 10",
		 	    text: "%npv%"
		 	  },
		 	  animation:{
		      effect: 2, 
		      method: 5,
		      speed: 500,
		      sequence: 1
		    }
		 	},
		 	source: {
		 	  text: 'gs.statcounter.com',
		 	  fontColor: "#8e99a9",
		 	  fontFamily: "Open Sans"
		 	},
		 	title: {
		 	  fontColor: "#fff",
		 	  text: 'Global Browser Usage',
		 	  align: "left",
		 	  offsetX: 10,
		 	  fontFamily: "Open Sans",
		 	  fontSize: 25
		 	},
		 	subtitle: {
		 	  offsetX: 10,
		 	  offsetY: 10,
		 	  fontColor: "#8e99a9",
		 	  fontFamily: "Open Sans",
		 	  fontSize: "16",
		 	  text: 'May 2016',
		 	  align: "left"
		 	},
		 	plotarea: {
		 	  margin: "20 0 0 0"  
		 	},
			series : [
				{
				  values : [11.38],
				  text: "Internet Explorer",
				  backgroundColor: '#50ADF5',
				},
				{
				  values: [56.94],
				  text: "Chrome",
				  backgroundColor: '#FF7965'
				},
				{
				  values: [14.52],
				  text: 'Firefox',
				  backgroundColor: '#FFCB45'
				},
				{
				  text: 'Safari',
				  values: [5],
				  backgroundColor: '#6877e5'
				},
				{
				  text: 'Other',
				  values: [7.48],
				  backgroundColor: '#6FB07F'
				}
			]
		};

		zingchart.render({ 
			id : 'myChart', 
			data : myConfig, 
			height: 300, 
			width: 525 
		});
	
});
</script>
<style>
.chartbox{
	width: 100%;
	height: 500px;
	overflow: hidden;
	margin:0 auto;
}
</style>

</head>
<body>
<br>
<div class="container-fluid text-center">		
	<div class="col-lg-10">
		<div class="card" >
		    <div class="card-header py-3">
		  		<h4 class="m-0 font-weight-bold text-primary">남녀 비율</h4>
		    </div>
			<div class="card-body text-center">
				<div id="piechart_3d" class="chartbox"></div>
			</div>
		</div>
	</div>
	<br>
	<div class="col-lg-10">
		<div class="card" >
		    <div class="card-header py-3">
		   		<h4 class="m-0 font-weight-bold text-primary">부서별 직원 비율</h4>
		    </div>
			<div class="card-body text-center">
				<div id="piechart" class="chartbox"></div>
			</div>
		</div>
	</div>
	<br>
	<div class="col-lg-10">
		<div class="card" >
		    <div class="card-header py-3">
		   		<h4 class="m-0 font-weight-bold text-primary">직급별 직원 비율</h4>
		    </div>
			<div class="card-body text-center">
				<div id="donutchart" class="chartbox"></div>
			</div>
		</div>
	</div>
	<div class="col-lg-10">
		<div class="card" >
		    <div class="card-header py-3">
		   		<h4 class="m-0 font-weight-bold text-primary">비율</h4>
		    </div>
			<div class="card-body text-center">
				<div id="myChart" class="chartbox"></div>
			</div>
		</div>
	</div>
</div>
<br>
</body>
</html>