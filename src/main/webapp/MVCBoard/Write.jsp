<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../MVCMember/IsLoggedIn.jsp"%>  
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 첨부형 게시판</title>
		<script type="text/javascript">
			function validateForm(form) {  // 폼 내용 검증
			    if (form.name.value == "") {
			        alert("작성자를 입력하세요.");
			        form.name.focus();
			        return false;
			    }
			    if (form.title.value == "") {
			        alert("제목을 입력하세요.");
			        form.title.focus();
			        return false;
			    }
			    if (form.content.value == "") {
			        alert("내용을 입력하세요.");
			        form.content.focus();
			        return false;
			    }
			    if (form.pass.value == "") {
			        alert("비밀번호를 입력하세요.");
			        form.pass.focus();
			        return false;
			    }
			}
		</script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
       	<style>
			a{
				text-decoration: none;
			}
			.left{
				text-align: left
			}
		</style>
	</head>
	<body>
		<header>
			<%@ include file="NavBar.jsp"%>
		</header>  
		<div class="container row">
            <%@ include file="LeftBar.jsp"%>
	        <div class="col-sm-9">
			<form name="writeFrm" method="post" enctype="multipart/form-data" 
				action="../mvcboard/write.do" onsubmit="return validateForm(this);" class="m-4 ">
			    <table border="1" class="table table-spacing table-bordered text-primary border-primary rounded-3 text-center align-middle w-100 p-4">
			        <tr>
			            <td>작성자</td>
			            <td>
			            	<input type="hidden" name="name" value="<%= session.getAttribute("Name") %>" /> 
			            	<%= session.getAttribute("Name") %>
			            </td>
			        </tr>
			        <tr>
			            <td>제목</td>
			            <td class="left">
			                <input type="text" name="title" style="width: 90%;" class="form-control" />
			            </td>
			        </tr>
			        <tr>
			            <td>내용</td>
			            <td class="left">
			                <textarea name="content" style="width: 90%; height: 100px;" class="form-control"></textarea>
			            </td>
			        </tr>
			        <tr>
			            <td>첨부파일</td>
			            <td>
			            	<input type="file" name="ofile"  class="form-control" />
			            </td>
			        </tr>
			        <tr>
			            <td colspan="2" align="center">
			                <button type="submit" class="btn btn-outline-primary">작성 완료</button>
			                <button type="reset" class="btn btn-outline-primary">RESET</button>
			                <button type="button" onclick="location.href='../mvcboard/list.do';" class="btn btn-outline-primary">
			                    목록 바로가기</button>
			            </td>
			        </tr>
			    </table>
			</form>
			</div>	
		</div>
	</body>
</html>