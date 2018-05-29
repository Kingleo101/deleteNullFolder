<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 引入jQuery -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-1.11.1.min.js"></script>
<!-- 引入样式文件 -->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js">
	
</script>
<title>商品展示</title>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>商品展示</h1>
			</div>
		</div>
		<!-- 搜索框 -->
		<div class="row">
			<div class="col-md-6 col-md-offset-6">
				商品搜索：<input type="text" id="Item_Search_input">
			</div>
		</div>
		<!-- 展示商品 -->
		<div class="row" id="show_items_div"></div>
		<script type="text/javascript">
			//1.页面加载完成以后，直接发送一个ajax请求。
			$(function() {
				$.ajax({
					url : "${APP_PATH}/getItems",
					type : "GET",
					success : function(result) {
						alert("获取商品!!");
						console.log(result);
						var items = result.extend.items;
						$.each(items, function() {
							var pics = this.picture;
							var pic = pics.split("-");
							var itemsView = $("<div></div>")
								.addClass("col-xs-6 col-md-3")
								.append($("<a></a>")
										.addClass("thumbnail")
										.attr("href","${APP_PATH}/showItem.jsp?itemId="+this.id+"")
										.append( $("<img src='' alt='加载图片中' style='width: 100px; height: 100px'>")
												.attr("src","/img/"+pic[0])))
										.append($("<div></div>")
										.addClass("caption")
										.append($("<h4></h4>")
												.text(this.name)))
								.appendTo($("#show_items_div"));
							
/* <div class="caption">
      <h3>Thumbnail label</h3>
     <p>...</p>
      */

						}); 
					}

				});
			});
		</script>
</body>
</html>