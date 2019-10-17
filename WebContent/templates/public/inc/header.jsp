<%@page import="model.dao.SlideDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Slide"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<title>BSong</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" type="image/ico" href="/templates/public/images/icon-180x180.png" />
<link href="<%=request.getContextPath() %>/templates/public/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/templates/public/css/coin-slider.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
<link href="<%=request.getContextPath() %>/templates/public/css/custom.css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/templates/public/js/coin-slider.min.js"></script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1 style="font-family: cursive;"><a href="https://vinaenter.edu.vn" target="_blank">BSong <small>Một dự án khóa JAVA tại VinaEnter Edu</small></a></h1>
      </div>
      <div class="menu_nav">
        <a href="<%=request.getContextPath() %>/trang-chu/1" title="Trang chủ"><button id="trangchu" type="button" class="btn btn-light"><span style="font-family: cursive;">Trang chủ</span></button></a>
        <a href="<%=request.getContextPath() %>/lien-he" title="Liên hệ"><button id="lienhe" type="button" class="btn btn-light"><span style="font-family: cursive;">Liên hệ</span></button></a>
        <%
        	if(session.getAttribute("userInfor") != null){
        		User objUser = (User)session.getAttribute("userInfor");
        %>
        <a href="<%=request.getContextPath() %>/admin" title="Đến trang quản trị viên"><button id="lienhe" type="button" class="btn btn-light"><span style="font-family: cursive;">Quản trị viên</span></button></a>
        <a href="<%=request.getContextPath() %>/public/logout" title="Đăng xuất"><button id="lienhe" type="button" class="btn btn-light"><span style="font-family: cursive;"><%=objUser.getFullName() %></span></button></a>
        <%	}else{ %>
        <a href="<%=request.getContextPath() %>/dang-nhap.html"><button id="lienhe" type="button" class="btn btn-light"><span style="font-family: cursive;">Quản trị viên</span></button></a>
        <%	} %>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider">
        	<%
        		SlideDao slideDao = new SlideDao();
        		ArrayList<Slide> listSlide = slideDao.getItems();
        		if(listSlide.size() > 1){
        			for(Slide slide : listSlide){
        	%>
        	<img src="<%=request.getContextPath() %>/files/<%=slide.getImage() %>" width="935" height="307" alt="" />
        	<%}}else{ %>
        	<img src="<%=request.getContextPath() %>/templates/public/images/slide1.jpg" width="935" height="307" alt="" /><img src="<%=request.getContextPath() %>/templates/public/images/slide2.jpg" width="935" height="307" alt="" /><img src="<%=request.getContextPath() %>/templates/public/images/slide3.jpg" width="935" height="307" alt="" />
        	<%} %>
        </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">