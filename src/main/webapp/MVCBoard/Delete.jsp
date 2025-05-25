<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>게시물 삭제</title>
	</head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
	<body>
		<header>
			<%@ include file="NavBar.jsp"%>
		</header>  
		<form action="../mvcboard/delete.do" method="post" style="text-align: center">
			<input type="hidden" name="board_idx" value="${ dto.board_idx }" /> <br/>
			<h2>정말 삭제하시겠습니까?</h2><br/><br/><br/><br/>
			<h4>게시물 : ${ dto.title }</h4><br/><br/>
			<button type="submit" class="btn btn-outline-primary">예</button>
			<button type="button" onclick="location.href='../mvcboard/view.do?board_idx=${ dto.board_idx }';" class="btn btn-outline-primary">아니오</button>			
		</form>
	</body>
</html>