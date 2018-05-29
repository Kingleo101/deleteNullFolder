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
	src="${APP_PATH}/static/js/jquery-2.2.4.min.js"></script>
<!-- 引入样式文件 -->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js">
	
</script>
<title>商品添加</title>
</head>
<body>
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>商品上传</h1>
			</div>
		</div>
		<!-- 添加商品表单 -->
		<div class="table-responsive">
			<form enctype="multipart/form-data" id="add_item_form">
				<div class="form-group">
					<label for="add_item_input">商品名称</label> <input type="text"
						class="form-control" name="name" id="add_item_input"
						placeholder="商品名称">
				</div>
				<div class="form-group">
					<label for="add_price_input">商品价格</label> <input type="text"
						class="form-control" name="price" id="add_price_input"
						placeholder="商品价格">
				</div>
				<div class="form-group">
					<label for="add_quantity_input">商品库存</label> <input type="text"
						class="form-control" name="quantity" id="add_quantity_input"
						placeholder="商品库存">
				</div>
				<div class="form-group">
					<label for="add_picture_input">File input</label>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="18%" background="${APP_PATH}/static/images/bg.jpg"
								bgcolor="#FFFFFF">
								<div align="center">
									<span class="STYLE1">上传照片</span>
								</div>
							</td>
							<td bgcolor="#FFFFFF"><input type="hidden" name="picture"
								id="pictureCertificate" value="" /> <input type="file"
								id="uploadfile" name="uploadfile" accept="image/*" /> <input
								type="button" value="上传" onclick="doUpload()"
								class="btn btn-success fileinput-button" /></td>
						</tr>
					</table>
					<div class="row">
						<div class="col-sm-6 col-md-4" id="show_picture_view"></div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品SKU</label><br> <input
						type="text" class="form-control hide" name="sku"
						id="itemSKU_add_input">
					<p class="help-block" id="show_sku_p">系统随机生成</p>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">商品类别</label>
					<div class="col-sm-4">

						<label class="radio-inline"> <input type="radio"
							name="cid" id="category1_add_input" checked="checked"
							value="162967 "> 古董》亚洲古董》中国》毛笔盆
						</label> <label class="radio-inline"> <input type="radio"
							name="cid" id="category2_add_input" value="162140">
							硬币和纸币》纸币:美国》复制品和复制品
						</label> <label class="radio-inline"> <input type="radio"
							name="cid" id="category3_add_input" value="234">
							玩具和爱好》游戏》其他游戏
						</label> <label class="radio-inline"> <input type="radio"
							name="cid" id="category4_add_input" value="357">
							艺术》民间艺术与本土艺术
						</label> <label class="radio-inline"> <input type="radio"
							name="cid" id="category4_add_input" value="121836">
							家庭与花园》家庭装修》家庭安全》保险箱
						</label>
					</div>
				</div>
				<div class="form-group">
					<label for="message-text" class="control-labe">商品描述:</label>
					<textarea class="form-control" id="message-text" name="describes"></textarea>
				</div>
		</div>
		<button type="button" class="btn btn-primary" id="product_add__btn">提交</button>
		</form>
	</div>
	</div>

	<script type="text/javascript">
		// 获取长度为len的随机字符串  
		function _getRandomString(len) {
			len = len || 32;
			var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'; // 默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1  
			var maxPos = $chars.length;
			var pwd = '';
			for (i = 0; i < len; i++) {
				pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
			}
			return pwd;
		}

		$("#product_add__btn").click(function() {
			var randomsku = _getRandomString(20);
			$("#itemSKU_add_input").val(randomsku);
			$.ajax({
				url : "${APP_PATH}/products",
				data : $("#add_item_form").serialize(),
				type : "POST",
				success : function(result) {
					var sku = result.extend.pageInfo;
					$("#show_sku_p").text(sku);
					alert("添加成功");
					location.href="${APP_PATH}/Itemview.jsp";
				}
			});
		});
		//上传图片
		function doUpload() {
			/*var formData = new FormData();
			formData.append("uploadfile", document.getElementById("uploadfile").files[0]);*/
			var formData = document.getElementById("uploadfile").files[0]; // js 获取文件对象
			var pictureSrc = $("#pictureCertificate").val();
			alert(pictureSrc);
			if (typeof (formData) == "undefined" || formData.size <= 0) {
				alert("请选择图片!");
				return;
			} else {
				var formData = new FormData();
				formData.append("uploadfile", document
						.getElementById("uploadfile").files[0]);
			}
			//var formData = new FormData($( "#uploadForm" )[0]);
			//alert(formData);
			$
					.ajax({
						url : '${APP_PATH}/fileUpload.do',
						type : 'POST',
						data : formData,
						async : false,
						cache : false,
						contentType : false,
						processData : false,
						success : function(returndata) {
							console.log(returndata);
							//$("#pictureCertificate").val(returndata);
							if (returndata.code == "3") {
								alert("上传图片格式不正确！");
							} else if (returndata.code == "0") {
								alert("上传文件不得大于500k！");
							} else if (returndata.code == "404"
									|| returndata.code == "1") {
								alert("上传凭证失败！");
							} else {
								alert("上传凭证成功！");
								if (pictureSrc == '')
									$("#pictureCertificate").val(
											returndata.path);
								else
									$("#pictureCertificate").val(
											pictureSrc + "-" + returndata.path);
								/*  <img src="..." alt="..." style="width: 100px; height: 100px"/> */
								$("#show_picture_view")
										.append(
												$(
														"<img alt='加载图片中' src='' style='width: 100px; height: 100px'/>")
														.attr("src",
																"/img/"+returndata.path))
								console.log(returndata.path);
							}

						},
						error : function(returndata) {
							alert("上传凭证失败！");
						}
					});
		}
	</script>
</body>
</html>