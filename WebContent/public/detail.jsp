<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <%
    	if(request.getAttribute("detailSongById") != null){
    		Song objSong = (Song)request.getAttribute("detailSongById");
    %>
    	<h1 class="tieude"><strong class="alert alert-light" style="font-size: 40px; font-family: cursive;"><%=objSong.getSongCat().getCatName() %></strong></h1>
    <div class="article">
      <h2 class="tieude"><strong class="alert alert-light" style="font-size: 30px; font-family: cursive;"><%=objSong.getSongName()%></strong></h2>
      <div class="clr"></div>
      <p>Ngày đăng: <%=objSong.getSongDateCreate() %>. Lượt xem: <%=objSong.getSongCouter() %></p>
      <div class="clr"></div>
	    <%
	    	if(!objSong.getSongPicture().isEmpty()){
	    %>
    		<div class="img"><img class="img-thumbnail" src="<%=request.getContextPath() %>/files/<%=objSong.getSongPicture() %>" width="300" height="260" align="center" alt="<%=objSong.getSongName() %>" class="fl" /></div>
	    <%}else{ %>
	    	<div class="img"><img class="img-thumbnail" src="<%=request.getContextPath() %>/templates/public/images/images.png" width="400" height="260" align="center" alt="Không có hình ảnh%>" class="fl" /></div>
	    <%} %>
	   <div class="clr"></div>
	    <h4><span class="alert alert-light" style="font-weight: bold;font-family: cursive;">Lời bài hát</span></h4>
	   <div class="clr"></div>
      <div class="lyrics">
      	<%=objSong.getSongDetail() %>
      </div>
    </div>
    <%
    	}else{
    %>
    <div class="vnecontent">
      	<p style="font-family: cursive;">Không có dữ liệu</p>
    </div>
    <%	} %>
    <div class="article">
    	 <h3 class="tieude"><strong class="alert alert-light" style="font-size: 27px; font-family: cursive;">Bài viết liên quan</strong></h3>
     </div>
    <%
    	if(request.getAttribute("listSongById") != null){
    		ArrayList<Song> listSong = (ArrayList<Song>)request.getAttribute("listSongById");
    		if(listSong.size() > 0){
    			for(Song objSong : listSong){
    				String urlSlug = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getSongName()) + "-" + objSong.getSongId();
    		
    %>
      <div class="article">
      <div class="clr"></div>
      <%
      	if(!objSong.getSongPicture().isEmpty()){
      %>
      <div class="comment"> <a href="<%=urlSlug%>"><img src="<%=request.getContextPath() %>/files/<%=objSong.getSongPicture() %>" width="120" height="120" alt="<%=objSong.getSongName() %>" class="userpic" /></a></div>
      <%}else{ %>
      <div class="comment"> <a href="<%=urlSlug%>"><img src="<%=request.getContextPath() %>/templates/public/images/images.png" width="120" height="120" alt="Không có hình ảnh" class="userpic" /></a></div>
      <%} %>
        <h2 style="font-family: cursive;"><a class="alert alert-light" href="<%=urlSlug%>"><%=objSong.getSongName() %></a></h2>
        <div><% if(objSong.getSongPreview().length() > 70) out.print(objSong.getSongPreview().substring(0, 70) + "..."); else out.print(objSong.getSongPreview()); %></div>
    </div>
    <%}}else{ %>
    <div class="article">
	 <h2 class="alert alert-light"><strong style="font-size: 20px; font-family: cursive;">Không có bài hát nào liên quan!</strong> </h2>
	</div>
	 <%}}%>
    </div>
    <div class="sidebar">
 	 <%@ include file="/templates/public/inc/leftbar.jsp" %>
  	</div>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
