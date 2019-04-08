<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/file" enctype="multipart/form-data">
	주소 파일 : <input type="file" name="file" id="file"><br>
	<button type="button" onclick="upload();">주소업로드</button>
</form>
<progress id="pb" value="0" max="100" ></progress>
<script> 
	var xhr = new XMLHttpRequest();
	var fd = new FormData();
	function upload(){
		var fileObj = document.querySelector('#file');
		fd.append('file',fileObj.files[0]);
		xhr.upload.addEventListener('progress',function(evt){
			document.querySelector('#pb').value = Math.round(evt.loaded*100/evt.total)
		},false)
		xhr.open('POST','/file');
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4){
				if(xhr.status==200){
					var res = JSON.parse(xhr.response);
					alert('총 입력 대상 : ' + res.targetCnt);
					alert('총 입력 건수 : ' + res.totalCnt);
					alert('총 수행 시간 : ' + Math.round(res.executTime/1000) + '초');
				}
			}
		}
		xhr.send(fd);
	}
</script>
</body>
</html>