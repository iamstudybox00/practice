<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원제 게시판</title>
		<script type="text/javascript">
			function validateForm(form){
				if(form.name.value == ""){
					alert("작성자를 입력하세요.");
					form.name.focus();
					return false;
				}
				if(form.title.value == ""){
					alert("제목을 입력하세요.");
					form.title.focus();
					return false;
				}
				if(form.content.value == ""){
					alert("내용을 입력하세요.");
					form.content.focus();
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
		</style>
	</head>
	<body>
<!-- 		<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2> -->
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="javascript:void(0)">Logo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../mvcboard/list.do">게시판 목록 바로가기</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">자료실</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">방명록</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">드롭다운</a>
                            <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">SubMenu1</a></li>
                            <li><a class="dropdown-item" href="#">SubMenu2</a></li>
                            <li><a class="dropdown-item" href="#">SubMenu3</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex me-auto" style="margin-left: 50px;">
                        <input class="form-control" type="text" placeholder="Search">
                        <button class="btn btn-warning" type="button">
                            <i class="bi bi-search"></i>
                        </button>
                    </form>
                    <ul class="navbar-nav" >
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)"> <i class="bi bi-person-plus-fill"></i>회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)"><i class="bi bi-person-lines-fill"></i>회원정보수정</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)"><i class="bi bi-box-arrow-in-right"></i>로그인</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)"><i class="bi bi-box-arrow-right"></i>로그아웃</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
		<div class="container row">
            <div class="col-sm-3">
               <div class="bg-secondary sm-8" style="border-radius: 5px; height: 70px; text-align: center; line-height: 70px; color: white; margin: 10px 0; font-size: large;">웹사이트 제작</div>
               <ul class="list-group list-group-flush">
                   <li class="list-group-item"><a href="../mvcboard/list.do">게시판 목록 바로가기</a></li>
                   <li class="list-group-item">자료실</li>
                   <li class="list-group-item">방명록</li>
                   <div class="dropdown dropend">
                       <a class="list-group-item dropdown-toggle text-primary" href="#" role="button" data-bs-toggle="dropdown">드롭다운</a>
                       <ul class="dropdown-menu">
                           <li><a class="dropdown-item" href="#">SubMenu1</a></li>
                           <li><a class="dropdown-item" href="#">SubMenu2</a></li>
                           <li><a class="dropdown-item" href="#">SubMenu3</a></li>
                       </ul>
                   </div>
               </ul>
            </div>
	        <div class="col-sm-9">
	        	<form name="writeFrm" method="post" enctype="multipart/form-data"
					action="../mvcboard/edit.do" onsubmit="return validateForm(this);">
					<input type="hidden" name="idx" value="${ dto.idx }" /> <br/>
					<input type="hidden" name="prevOfile" value="${ dto.ofile }" />
					<input type="hidden" name="prevSfile" value="${ dto.sfile }" />
					
					<table border="1" class="table table-spacing table-bordered text-primary border-primary rounded-3 text-center align-middle w-100 p-4">
						<tr>
							<td>작성자</td>
							<td>
								<input type="text" name="name" style="width: 150px;" value="${ dto.name }"  class="form-control" />
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="title" style="width: 90%;" value="${ dto.title }" class="form-control" />
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" name="name" style="width: 90%; height: 100px;" class="form-control" >${ dto.content }</textarea>
							</td>
						</tr>
						<tr>
							<td>첨부 파일</td>
							<td>
								<input type="file" name="ofile" class="form-control"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<button type="submit" class="btn btn-outline-primary">작성 완료</button>
								<button type="reset" class="btn btn-outline-primary">RESET</button>
								<button type="button" onclick="location.href='../mvcboard/list.do';" class="btn btn-outline-primary">
									목록 바로가기
								</button>
							</td>
						</tr>
					</table>
		 		</form>
	        </div>
	    </div>
	</body>
</html>