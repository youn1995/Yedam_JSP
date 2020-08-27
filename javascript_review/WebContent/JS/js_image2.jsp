<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js_image.jsp</title>
<style>
img {
	width: 100px;
}
</style>
</head>
<body>
	<script>
		var imgArr = [ {
			src : "./images/Chrysanthemum.jpg",
			alt : "국화",
			width : 100
		}, {
			src : "./images/Desert.jpg",
			alt : "사막",
			width : 110
		}, {
			src : "./images/Hydrangeas.jpg",
			alt : "수국",
			width : 120
		}, {
			src : "./images/Jellyfish.jpg",
			alt : "해파리",
			width : 130
		} ];
		var tmpWidth;
		for (var i = 0; i < imgArr.length; i++) {
			var img = document.createElement("img");
			img.src = imgArr[i].src;
			img.alt = imgArr[i].alt;
			img.style.width = imgArr[i].width + "px";

			document.body.appendChild(img);
			img.onmouseover = function() {
				tmpWidth = this.style.width;
				this.style.width = "200px";
			}
			img.onmouseout = function() {
				this.style.width = tmpWidth;
			}
		}
	</script>
</body>
</html>