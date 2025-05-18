<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 첨부형 게시판</title>
		<style>a{text-decoration: none;}</style>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="javascript:void(0)">Logo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">자료게시판</a>
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
		
			<table border="1" width="90%">
				<tr>
					
				</tr>
			</table>
			
		</form>
<!-- 		<table border="1" width="90%"> -->
			
<!-- 		</table> -->
<!-- 		<table border="1" width="90%"> -->
<!-- 		<tr align="center"> -->
<!-- 			<td> -->
<%-- 				${ map.pagingImg } --%>
<!-- 			</td> -->
<!-- 			<td width="100"><button type="button" onclick="location.href='../mvcboard/write.do';">글쓰기</button></td> -->
<!-- 		</tr> -->
<!-- 		</table> -->
<!-- 	///////////////////////////////////////////////////////////////////////////// -->
	<div class="row">
           <div class="col-sm-3">
               <div class="bg-secondary sm-8" style="border-radius: 5px; height: 70px; text-align: center; line-height: 70px; color: white; margin: 10px 0; font-size: large;">웹사이트 제작</div>
               <ul class="list-group list-group-flush">
                   <li class="list-group-item active">자유게시판</li>
                   <li class="list-group-item text-primary">자료실</li>
                   <li class="list-group-item text-primary">방명록</li>
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
           <div class="col-sm-8">
               <p class="h2" style="margin-top: 10px; float: left;">게시판 목록 -&nbsp;</p>
               <p class="h3" style="margin-top: 10px;">자유게시판</p>
               <div class="container row">
               <div class="input-group ">
               		<form method="get">
	                    <select name="searchField" class="form-select form row-4">
	                       <option value="title" selected>제목</option>
	                       <option value="user">작성자</option>
	                       <option value="content" >내용</option>
	                    </select>
	                    <input type="text" name="searchWord" class="form-control col-4">
	                    <button class="btn btn-warning col-4" type="submit">
	                        <i class="bi bi-search"></i>
	                    </button>
	                </form>
               </div>
               </div>
            <div class="container mt-3">      
               <table class="table table-bordered table-striped ">
                   <thead class="table-secondary border-top border-dark border-bottom">
                       <tr>
                           <th>번호</th>
                           <th>제목</th>
                           <th>작성자</th>
                           <th>작성일</th>
                           <th>조회수</th>
                           <th>첨부</th>
                       </tr>
                	</thead>
                  	<tbody>
						<c:choose>
							<c:when test="${ empty boardLists }">
								<tr>
									<td colspan="5" align="center">
										등록된 게시물이 없습니다^^*
									</td>
								</tr>
							</c:when>		
							<c:otherwise>
								<c:forEach items="${ boardLists }" var="row" varStatus="loop">
								<tr align="center">	
									<td>${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
									<td align="left">
										<a href="../mvcboard/view.do?idx=${ row.idx }">${ row.title }</a>
									</td>
									<td>${ row.name }</td>
									<td>${ row.visitCount }</td>
									<td>${ row.postDate }</td>
									<td>
									<c:if test="${ not empty row.ofile }">
										<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
									</c:if>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
             	</table>
            </div>
        </div>
    </div>
	</body>
</html>