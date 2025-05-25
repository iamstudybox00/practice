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
	<style>
		a{
			text-decoration: none;
		}
	</style>
	<body>
	<header>
		<%@ include file="NavBar.jsp"%>
	</header>  
	<div class="container row">
           <%@ include file="LeftBar.jsp"%>
           <div class="col-sm-9">
               <p class="h2" style="margin-top: 10px; float: left;">게시판 목록 -&nbsp;</p>
               <p class="h3" style="margin-top: 10px;">자유게시판</p>
					<form method="get" class="input-group sm-8" > 
					    <select class="form-select" name="searchField">
					      <option value="title" selected>제목</option>
					      <option value="name">작성자</option>
					      <option value="content">내용</option>
					    </select>
					    <input type="text" name="searchWord" class="form-control w-75">
					    <button class="btn btn-warning" type="submit">
	                        <i class="bi bi-search"></i>
	                    </button>
	                </form>
               <table class="table table-bordered table-striped mt-3">
                   <thead class="table-secondary border-top border-dark border-bottom text-center">
                       <tr>
                           <th>번호</th>
                           <th class="w-50">제목</th>
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
									<td colspan="6" align="center">
										등록된 게시물이 없습니다^^*
									</td>
								</tr>
							</c:when>		
							<c:otherwise>
								<c:forEach items="${ boardLists }" var="row" varStatus="loop">
								<tr align="center">	
									<td>${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
									<td align="left">
										<a href="../mvcboard/view.do?board_idx=${ row.board_idx }">${ row.title }</a>
									</td>
									<td>${ row.name }</td>
									<td>${ row.postDate }</td>
									<td>${ row.visitCount }</td>
									<td>
									<c:if test="${ not empty row.ofile }">
<%-- 										<a href="../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a> --%>
											<button type="button" onclick="location.href='../mvcboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&board_idx=${ row.board_idx }';" class="btn btn-outline-primary btn-sm">다운</button>
									</c:if>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
             	</table>
             	<div class="container">
             		<div class="text-center">
						${ map.pagingImg }
					</div>
					<div class="text-end">							
						<button type="button" onclick="location.href='../mvcboard/write.do';" class="btn btn-outline-primary">글쓰기</button>
					</div>
				</div>
            </div>
        </div>
	</body>
</html>