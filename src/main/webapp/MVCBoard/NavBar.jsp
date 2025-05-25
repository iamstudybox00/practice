<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
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
	                	<% if(session.getAttribute("Id") == null) {%>
	                    <li class="nav-item">
	                        <a class="nav-link" href="javascript:void(0)"> <i class="bi bi-person-plus-fill"></i>회원가입</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="../MVCMember/LoginForm.jsp"><i class="bi bi-box-arrow-in-right"></i>로그인</a>
	                    </li>
	                    <% } else { %>
	                    <li class="navbar-text">
	                    	<span style="color: white;"><%= session.getAttribute("Name") %></span>&nbsp;&nbsp;&nbsp; 
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="../MVCMember/Logout.jsp"><i class="bi bi-box-arrow-right"></i>로그아웃</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="javascript:void(0)"><i class="bi bi-person-lines-fill"></i>회원정보수정</a>
	                    </li>
	                    <% } %>
	                </ul>
	            </div>
	        </div>
	    </nav>
	</body>
</html>