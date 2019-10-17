<%@page import="util.DefineUtil"%>
<%@page import="model.bean.Song"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp"%>
<div class="content_resize">
	<div class="mainbar">
		<%
			if (request.getAttribute("listSong") != null) {
				@SuppressWarnings("unchecked")
				ArrayList<Song> listSong = (ArrayList<Song>) request.getAttribute("listSong");
				if (listSong.size() > 0) {
					int i = 1;
					for (Song objSong : listSong) {
						String urlSlug = request.getContextPath() + "/chi-tiet/"
								+ StringUtil.makeSlug(objSong.getSongName()) + "-" + objSong.getSongId();
		%>
		<div class="article">
			<h2 style="font-size: 27px; font-family: cursive;"
				class="btn btn-light">
				<a href="<%=urlSlug%>" title="<%=objSong.getSongName()%>"><%=objSong.getSongName()%></a>
			</h2>
			<p class="infopost">
				<span class="badge badge-light">Ngày đăng:<%=objSong.getSongDateCreate()%>.Lượt
					xem: <%=objSong.getSongCouter()%></span> <a href="<%=urlSlug%>"
					class="com"><span><%=i%></span></a>
			</p>
			<%
				if (!objSong.getSongPicture().isEmpty()) {
			%>
			<div class="img">
				<img class="img-thumbnail"
					src="<%=request.getContextPath()%>/files/<%=objSong.getSongPicture()%>"
					width="300" height="260" align="center"
					alt="<%=objSong.getSongName()%>" class="fl" />
			</div>
			<%
				} else {
			%>
			<div class="img">
				<img class="img-thumbnail"
					src="<%=request.getContextPath()%>/templates/public/images/images.png"
					width="400" height="260" align="center" alt="Không có hình ảnh%>"
					class="fl" />
			</div>
			<%
				}
			%>
			<div class="clr"></div>
			<div class="prewiew">
				<%
					if (objSong.getSongPreview().length() >= 100) {
						out.print(objSong.getSongPreview().substring(0, 100) + "...");
					} else {
						out.print(objSong.getSongPreview());
					}
				%>
			</div>
			<div class="post_content">
				<p class="spec">
					<a href="<%=urlSlug%>" class="rm"><span
						class="badge badge-success">Chi tiết &raquo;</span></a>
				</p>
			</div>
		</div>
		<div class="clr"></div>
		<%
									i++;
								}
							}
						} else {
		%>
		<div class="post_content">
			<p style="font-family: cursive;">Không có dữ liệu</p>
		</div>
		<%
			}
		%>
		<div class="clr"></div>
		<%
			int numberOfPage = (Integer) request.getAttribute("numberOfPage");
			int currentPage = (Integer) request.getAttribute("currentPage");
			if (request.getAttribute("listSong") != null) {
				@SuppressWarnings("unchecked")
				ArrayList<Song> listSong = (ArrayList<Song>) request.getAttribute("listSong");
				if (listSong.size() > 0) {
		%>

		<div class="phantrang">
			<p class="pages">
				<small>Trang <%=currentPage%> của <%=numberOfPage%></small>
			</p>
			<ul class="pagination">
				<li
					class="page-item <%if (currentPage == 1)
						out.print("disabled");%>"><a
					href="<%=request.getContextPath()%>/trang-chu/<%if (currentPage - 1 < 1)
						out.print(1);
					else
						out.print(currentPage - 1);%>">&laquo;</a></li>
				<%
					String active = "";
							for (int i = 1; i <= numberOfPage; i++) {
								String urlSlug = request.getContextPath() + "/trang-chu/" + i;
								if (currentPage == i) {
									active = "active";
								} else {
									active = "";
								}
				%>
				<li class="page-item <%=active%>"><a href="<%=urlSlug%>"><%=i%></a></li>
				<%
					}
				%>
				<li
					class="page-item <%if (currentPage == numberOfPage)
						out.print("disabled");%>"><a
					href="<%=request.getContextPath()%>/trang-chu/<%if (currentPage + 1 > numberOfPage)
						out.print(numberOfPage);
					else
						out.print(currentPage + 1);%>">&raquo;</a></li>
			</ul>
		</div>
		<%
			}
			}
		%>
	</div>
	<div class="sidebar">
		<%@ include file="/templates/public/inc/leftbar.jsp"%>
	</div>
	<div class="clr"></div>
</div>

<%@ include file="/templates/public/inc/footer.jsp"%>
<script>
	document.getElementById("trangchu").classList.add('active-menu');
</script>
