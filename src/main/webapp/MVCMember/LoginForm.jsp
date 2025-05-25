<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Session</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
	</head>
	<body>
		<span style="color: red; font-size: 1.2em;">
			<%= request.getAttribute("LoginErrMsg") == null ? 
					"" : request.getAttribute("LoginErrMsg")%>
		</span>
		<%
			if(session.getAttribute("Id") == null) {	// 로그인 상태 확인
				// 로그아웃 상태
		%>
		<script>
			function validateForm(form) {
				if(!form.user_id.value){
					alert("아이디를 입력하세요.");
					return false;
				}
				if(form.user_pw.value == ""){
					alert("패스워드를 입력하세요");
					return false;
				}
			}
		</script>
	    <header>
			<%@ include file="../MVCBoard/NavBar.jsp"%>
		</header> 
		<br/><br/><br/><br/>
		<form method="post" name="loginFrm" style="text-align: center;"
			onsubmit="return validateForm(this);" action="../mvcboard/login.do">
			아이디 &nbsp;&nbsp;&nbsp;: <input type="text" name="user_id" /><br/>
			패스워드 : <input type="password" name="user_pw" /><br/><br/>
			<button class="btn btn-outline-primary" type="submit">로그인하기</button>
		</form>
		<%	
		}
		%>
	</body>
</html>