<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<title>고객통계분석</title>
	<style>
		*{margin:0;padding:0;}
		div{padding:0px; overflow: hidden; height: auto;}
		.hgroup{padding:20px;background-color:#e9e9e9;}
		.hgroup h1{font-family:Tahoma;}
		.hgroup p{margin:10px 0;font-size:10px}
		h2{margin:0;padding:20px;border:1px solid #000;background-color:#f9f9f9;border-width:1px 0;font-family:Tahoma;}
	</style>
	<link rel='stylesheet' href='css/Nwagon.css' type='text/css'>
	<script src='js/Nwagon.js'></script>
	<link rel="stylesheet" href="css/chartist.min.css">
    <script src="js/chartist.min.js"></script>
</head>
<body>
	
<div class="ct-chart ct-golden-section" id="chart1"></div>
<div class="ct-chart ct-golden-section" id="chart2"></div>

<script>
  // Initialize a Line chart in the container with the ID chart1
  new Chartist.Line('#chart1', {
    labels: [1, 2, 3, 4],
    series: [[100, 120, 180, 200]]
  });

  // Initialize a Line chart in the container with the ID chart2
  new Chartist.Bar('#chart2', {
    labels: [1, 2, 3, 4],
    series: [[5, 2, 8, 3]]
  });
</script>
</body>
</html>
