<%@page import="util.StringUtil"%>
<%@page import="model.bean.Song"%>
<%@page import="model.dao.SongDao"%>
<%@page import="model.bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<div class="searchform">
  <form id="formsearch" name="formsearch" method="get" action="<%=request.getContextPath()%>/public/search">
    <span>
    <%
    	String search = "";
    	if(request.getAttribute("search") != null){
    		search = (String)request.getAttribute("search");
    	}
    %>
    <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="<%=search %>" placeholder="Tìm kiếm bài hát" type="text" />
    </span>
    <input name="button_search" src="<%=request.getContextPath() %>/templates/public/images/search.jpg" class="button_search" type="image" />
  </form>
</div>
<script language="javascript">
	$(document).ready(function(){
		$('#formsearch').validate({
			rules:{
				editbox_search:{
					required: true,
				}
			},
			messages:{
				editbox_search:{
					required: 'Vui lòng nhập!',
				}
			},
		});
	});
</script>
<div class="clr"></div>
<div class="gadget">
  <h2 class="star" style="font-family: cursive;">Danh mục bài hát</h2>
  <div class="clr"></div>
  <ul class="sb_menu">
  	<%
  		CatDao catDao = new CatDao();
  		ArrayList<Category> listCat = catDao.getItems();
  		if(listCat.size() > 0){
  			for(Category objCat : listCat){
  	%>
  	<li><a href="<%=request.getContextPath()%>/public/cat?id=<%=objCat.getCatId()%>&page=<%=1%>"><%=objCat.getCatName() %></a></li>
  	<%}} %>
  </ul>
</div>

<div class="gadget">
  <h2 class="star"><span style="font-family: cursive;">Bài hát mới</span></h2>
  <div class="clr"></div>
  <ul class="ex_menu">
  	<%
  		SongDao songDao = new SongDao();
  		ArrayList<Song> listSong = songDao.getItems(5);
  		if(listSong.size() > 0){
  			for(Song objSong : listSong){
  				String urlSlug = request.getContextPath() + "/chi-tiet/" + StringUtil.makeSlug(objSong.getSongName()) + "-" + objSong.getSongId();
  	%>
  	<li><a href="<%=urlSlug%>"><span style="font-size:17px;font-family: cursive; font-weight: bolder;"><%if(objSong.getSongName().length() > 20) out.print(objSong.getSongName().substring(0, 20) + "..."); else out.print(objSong.getSongName()); %></span></a><br />
     <% if(objSong.getSongPreview().length() > 30) out.print(objSong.getSongPreview().substring(0, 30) + "..."); else out.print(objSong.getSongPreview()); %></li>
  	<%}} %>
  </ul>
</div>