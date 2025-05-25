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
	        	<table class="table table-spacing table-bordered text-primary border-primary rounded-3 text-center align-middle w-100 m-4 p-4">
				    <colgroup>
				        <col width="15%"/> <col width="35%"/>
				        <col width="15%"/> <col width="*"/>
				    </colgroup>
					
					<!-- 게시글 정보 -->
				    <tr>
				        <td>번호</td> <td>${ dto.board_idx }</td>
				        <td>작성자</td> <td>${ dto.name }</td>
				    </tr>
				    <tr>
				        <td>작성일</td> <td>${ dto.postDate }</td>
				        <td>조회수</td> <td>${ dto.visitCount }</td>
				    </tr>
				    <tr>
				        <td>제목</td>
				        <td colspan="3" class="left">${ dto.title }</td>
				    </tr>
				    <tr>
				    	<!-- 첨부 파일이 있으면 이미지 경로로 이미지 가져오기 -->
				        <td>내용</td>
				        <td colspan="3" height="100" class="left">
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
				            <button type="button" onclick="location.href='../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&board_idx=${ dto.board_idx }';" class="btn btn-outline-primary">다운로드</button>
				            </c:if>
				        </td>
				        <td>다운로드수</td>
				        <td>${ dto.downCount }</td>
				    </tr>
				
				    <tr>
				        <td colspan="4" align="center">
				        	<% if(request.getAttribute("permission").equals("havePer")){ %>
				            <button type="button" onclick="location.href='../mvcboard/edit.do?board_idx=${ param.board_idx }';" class="btn btn-outline-primary">
				                수정하기
				            </button>
				            <button type="button" onclick="location.href='../mvcboard/delete.do?board_idx=${ param.board_idx }';" class="btn btn-outline-primary">
				                삭제하기
				            </button>
				            <% } %>
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
