<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 첨부형 게시판</title>
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
<!-- 		<h2>파일 첨부형 게시판 - 상세 보기(View)</h2> -->
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
	        	<table class="table table-spacing table-bordered text-primary border-primary rounded-3 text-center align-middle w-100 m-4 p-4">
				    <colgroup>
				        <col width="15%"/> <col width="35%"/>
				        <col width="15%"/> <col width="*"/>
				    </colgroup>
					
					<!-- 게시글 정보 -->
				    <tr>
				        <td>번호</td> <td>${ dto.idx }</td>
				        <td>작성자</td> <td>${ dto.name }</td>
				    </tr>
				    <tr>
				        <td>작성일</td> <td>${ dto.postDate }</td>
				        <td>조회수</td> <td>${ dto.visitCount }</td>
				    </tr>
				    <tr>
				        <td>제목</td>
				        <td colspan="3">${ dto.title }</td>
				    </tr>
				    <tr>
				    	<!-- 첨부 파일이 있으면 이미지 경로로 이미지 가져오기 -->
				        <td>내용</td>
				        <td colspan="3" height="100">
				        	${ dto.content }
				        	<c:if test="${ not empty dto.ofile and isImage eq true }">
				        		<br><img src="../Uploads/${ dto.sfile }" style="max-width:100%;"/>
				        	</c:if>
				        </td>
				    </tr>
				
					<!-- 첨부파일 -->
				    <tr>
				        <td>첨부파일</td>
				        <td>
				            <c:if test="${ not empty dto.ofile }">
				            ${ dto.ofile }
				            <button type="button" onclick="location.href='../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&idx=${ dto.idx }';" class="btn btn-outline-primary">다운로드</button>
				            </c:if>
				        </td>
				        <td>다운로드수</td>
				        <td>${ dto.downCount }</td>
				    </tr>
				
				    <tr>
				        <td colspan="4" align="center">
				            <button type="button" onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${ param.idx }';" class="btn btn-outline-primary">
				                수정하기
				            </button>
				            <button type="button" onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${ param.idx }';" class="btn btn-outline-primary">
				                삭제하기
				            </button>
				            <button type="button" onclick="location.href='../mvcboard/list.do';" class="btn btn-outline-primary">
				                목록 바로가기
				            </button>
				        </td>
				    </tr>
				</table>
	        </div>
	    </div>
	</body>
</html>
