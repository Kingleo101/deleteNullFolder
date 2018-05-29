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
<title>商品刊登</title>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>商品上传</h1>
			</div>
		</div>
		<!-- 展示商品 -->
		<div class="row">
			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<a href="#" class="thumbnail"> <img src="..." alt="...">
						</a>
						<div class="caption">
							<h3>Thumbnail label</h3>
							<p>...</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 商品添加模态框 -->
	<div class="modal fade" id="Add_item_model" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">商品添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" ">
						<div class="form-group">
							<label for="name_add_input" class="col-sm-2 control-label">商品名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="name"
									id="name_add_input" placeholder="itmeName" /> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="price_add_input" class="col-sm-2 control-label">商品价格</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="price"
									id="price_add_input" placeholder="itmePrice" /> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="quantity_add_input" class="col-sm-2 control-label">商品库存</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="quantity"
									id="quantity_add_input" placeholder="itmeQuantity" /> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="picture_input_file" class="col-sm-2 control-label">商品图片</label> 
							<div class="col-sm-10">
							<input
								type="file" id="picture_input_file">
							<span class="help-block">请选择您的商品图片</span>
							</div>
						</div>
						<div class="form-group">
							<label for="itemSKU_add_input" class="col-sm-2 control-label">商品SKU</label>
							<div class="col-sm-10">
								<p class="form-control-static col-sm-offset-2" id="itemSKU_add_input">系统随机生成</p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">商品类别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="cid" id="category1_add_input" checked="checked"
									value="162967 "> Antiques > Asian Antiques > China >
									Brush Pots
								</label> <label class="radio-inline"> <input type="radio"
									name="cid" id="category2_add_input" value="162140">
									Coins & Paper Money > Paper Money: US > Replicas &
									Reproductions
								</label> </label> <label class="radio-inline"> <input type="radio"
									name="cid" id="category3_add_input" value="234"> Toys &
									Hobbies > Games > Other Games
								</label> </label> <label class="radio-inline"> <input type="radio"
									name="cid" id="category4_add_input" value="357"> Art >
									Folk Art & Indigenous Art
								</label> </label> <label class="radio-inline"> <input type="radio"
									name="cid" id="category4_add_input" value="121836">
									Home & Garden > Home Improvement > Home Security > Safes
								</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">上传</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<script type="text/javascript">
		$("#add_item_btn").click(function() {
			$('#Add_item_model').modal({
				backdrop : "static"
			});
		});
	</script>
</body>
</html>