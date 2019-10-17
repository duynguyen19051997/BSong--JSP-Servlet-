<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="/templates/public/inc/header.jsp" %>
<div class="content_resize">
  <div class="mainbar">
    <div class="article">
      <div class="alert alert-light">
        <h1 class="tieude"><strong style="font-size: 40px">Liên hệ</strong></h1>
      </div>
      <div class="clr"></div>
    </div>
    <%
		String msgText = "";
		if(request.getParameter("msg") != null){
			int msg = Integer.parseInt(request.getParameter("msg"));
			switch(msg){
				case 0: msgText = "Có lỗi trong quá trình thực hiện, vui lòng kiểm tra lại !";
						break;
				case 1: msgText = "Thêm thành công !";
						break;
				case 2: msgText = "Sửa thành công !";
						break;
				case 3: msgText = "Xóa thành công !";
						break;
			}
		
			if(msg == 0){
	%>
				<div class="alert alert-danger">
				    <p class="success"><strong><%=msgText %></strong><p>
				</div>
			<%} else {%>
				<div class="alert alert-success">
				  	<p class="success"><strong><%=msgText %></strong><p>
				</div>
	<%}} %>
    <div class="article">
       <h2 class="alert alert-light"><strong style="font-size: 25">Gửi liên hệ đến chúng tôi</strong></h2>
      <div class="clr"></div>
      <form action="" method="post" id="sendemail">
        <ol>
          <li>
            <label for="name">Họ tên:</label>
            <input id="name" value="" name="name" class="text" />
          </li>
          <li>
            <label for="email">Email:</label>
            <input id="email" value="" name="email" class="text" />
          </li>
          <li>
            <label for="website">Website:</label>
            <input id="website" value="" name="website" class="text" />
          </li>
          <li>
            <label for="message">Nội dung:</label>
            <textarea class="ckeditor" id="message" name="message" rows="8" cols="50"></textarea>
          </li>
          <li>
            <input type="image" name="imageField" id="imageField" src="<%=request.getContextPath() %>/templates/public/images/submit.gif" class="send" />
            <div class="clr"></div>
          </li>
        </ol>
      </form>
    </div>
    <script type="text/javascript">
    	document.getElementById("lienhe").classList.add('active-menu');
    	$(document).ready(function(){
    		$('#sendemail').validate({
    			ignore: [],
    			rules:{
    				name:{
    					required: true
    				},
    				email:{
    					required: true,
    					email: true
    				},
    				website:{
    					required: true,
    					url: true
    				},
    				message:{
    					required: true,
    					minlength: '20'
    				}
    			},
    			messages:{
    				name:{
    					required: 'Vui lòng không bỏ trống!'
    				},
    				email:{
    					required: 'Vui lòng không bỏ trống!',
    					email: 'Vui lòng nhập đúng định dạng email!'
    				},
    				website:{
    					required: 'Vui lòng không bỏ trống!',
    					url: 'Vui lòng nhập đúng định dạng url!'
    				},
    				message:{
    					required: 'Vui lòng không bỏ trống!',
    					minlength: 'Vui lòng nhập tối thiểu 20 ký tự!'
    				}
    			}
    		});
    	});
    </script>
  </div>
  <div class="sidebar">
  <%@ include file="/templates/public/inc/leftbar.jsp" %>
  </div>
  <div class="clr"></div>
</div>
<%@ include file="/templates/public/inc/footer.jsp" %>
