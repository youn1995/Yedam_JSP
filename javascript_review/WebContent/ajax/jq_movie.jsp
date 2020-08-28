<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jq_movie</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btnList").on("click", loadDoc);
		$("#result").on("click", ".movieCd", loadInfo);
	});
	function loadDoc() {
		var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt="
			url += $("#name").val();
		
		$.getJSON(url, function(obj){
			var arr = obj.boxOfficeResult.dailyBoxOfficeList;
			for(i=0; i<arr.length; i++){
				var tr = $("<tr>").append($("<td>").text(arr[i].rank),  $("<td>").text(arr[i].movieCd).addClass("movieCd"), $("<td>").text(arr[i].movieNm));
				$("#result").append(tr);
			}
		}); // parse까지 한번에 해줌	
	}
	
	function loadInfo(){
			var $url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=430156241533f1d058c603178cc3ca0e&movieCd="
			$url += $(this).text();
		
		$.getJSON($url, function(data){
			var actor = data.movieInfoResult.movieInfo.actors[0].peopleNm;
			var director = data.movieInfoResult.movieInfo.directors[0].peopleNm;
			var openDt = data.movieInfoResult.movieInfo.openDt;
			var ul = $("<ul>").append($("<li>").text("배우명: "+actor),$("<li>").text("감독명: "+director),$("<li>").text("개봉일: "+openDt));
			$("#info").empty();
			$("#info").append(ul);
		});
		
	}
</script>
</head>
<body>
	<input id="name">
	<button type="button" id ="btnList">검색</button>
	<table border="1" id="result"></table>
	<div id="info"></div>
</body>
</html>