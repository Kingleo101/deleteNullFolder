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
<title>商品详情</title>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>商品详情</h1>
			</div>
		</div>
		<!-- 展示商品 -->
		<div class="row" id="show_item_div">
			<form class="form-horizontal">
				<div class="form-group">
					<label class="col-sm-2 control-label">商品名称</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_name_p"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品价格</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_price_p"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品库存</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_quantity_p"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">图片</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_picture_p">
							<img src='images/Tuz3qKKGw2.jpg' alt='加载图片中' style='width: 100px; height: 100px'>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品sku</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_sku_p"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品类别</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_category_p"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品描述</label>
					<div class="col-sm-10">
						<p class="form-control-static" id="show_describes_p"></p>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
			//获取路径带过来的参数
			(function($) {
				$.getUrlParam = function(name) {
					var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
					var r = window.location.search.substr(1).match(reg);
					if (r != null)
						return unescape(r[2]);
					return null;
				}
			})(jQuery);
			$(function() {
				alert(window.location.href);
				alert($.getUrlParam('itemId'));
				var itemId = $.getUrlParam('itemId');
				$.ajax({
					url : "${APP_PATH}/getItem/" + itemId,
					type : "GET",
					success : function(result) {
						var pic = result.extend.item.picture.split("-");
						alert(pic[0]);
						//打印商品数据
						console.log(result);
						$("#show_name_p").text(result.extend.item.name);
						$("#show_price_p").text(result.extend.item.price);
						$("#show_quantity_p").text(result.extend.item.quantity);
						$("#show_picture_p img").attr("src","/img/"+pic[0]);
						$("#show_sku_p").text(result.extend.item.sku);
						$("#show_category_p").text(result.extend.item.describes);
						$("#show_describes_p").text(result.extend.item.category.name);
					}
				});
			});
		</script>
</body>
</html>