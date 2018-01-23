<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

</head>

<body>
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/Images/logo.gif"
				class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			${sessionUser.nickname },你好！欢迎访问办公管理系统！&nbsp;<a  href="#" onclick="location.href='${pageContext.request.contextPath}/user/loginOut.action'">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<form id="myForm" name="myForm" action="${pageContext.request.contextPath}/user/saveVacation.action"
		method="post">
		<input type="hidden" name="u.id" value="26" /> <input type="hidden"
			name="u.sex" value="2" id="u_sex" /> <input type="hidden"
			name="u.supper" value="0" id="u_supper" />
		<div class="main">
			<div class="global-width">


				<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>

<body>
	<div class="nav" id="nav">
		<div class="t"></div>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
			</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/toindex.do"
					target="_self">个人信息</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				邮件管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/mailWrite.action" target="_self">写邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath}/user/mailReceive!receive.action" target="_self">收邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath}/user/mailGarage!garage.action" target="_self">垃圾邮件</a>
			</dd>
		</dl>
		<dl>
			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				考勤管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/leave.action" target="_self">休假</a>
			</dd>
		</dl>

		<dl>

			<dt
				onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
				权限管理</dt>
			<dd>
				<a href="${pageContext.request.contextPath}/user/userInfo!singleAccountData.action" target="_self">个人账户</a>
			</dd>
			<c:if test="${sessionUser.ismanage eq '管理员'}">
				<dd>
				<a href="${pageContext.request.contextPath}/user/userInfo!manageAccountData.action" target="_self">管理账户</a>
				</dd>
			</c:if>
		</dl>
	</div>
</body>
				</html>

				<div class="action">
					<div class="t">申请休假</div>
					<div class="pages">
						<table width="90%" height="150px" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td align="right" width="30%">姓名：</td>
								<td align="left"><input type="text" name="applyername"
									value="${sessionUser.uname }" id="uname" /> <span
									id="uname_span"></span></td>
							</tr>
							<tr>
								<td align="right" width="30%" name="starttime">开始时间：</td>
								<td align="left">
										<div class="right">
											<select id="startyear" onchange="nianyue(this.value)" name="startyear">
												<script>
													for (i = 2018; i < 2118; i++) {
														document
																.write("<option value='"+i+"'>"
																		+ i
																		+ "</option>")
													}
												</script>
											</select> 年 <select id="startmonth" onchange="yueri(this.value)"
												name="startmonth">
												<script>
													for (i = 1; i <= 12; i++) {
														document
																.write("<option value='"+i+"'>"
																		+ i
																		+ "</option>")
													}
												</script>
											</select> 月 <select id="startday" name="startday">
												<script>
													for (i = 1; i <= 31; i++) {
														document
																.write("<option value='"+i+"'>"
																		+ i
																		+ "</option>")
													}
												</script>
											</select> 日
										</div>
										</td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left">
										<div class="right" id="endtime">
											<select id="endyear" onchange="nianyue(this.value)" name="endyear">
												<script>
													for (i = 2018; i < 2118; i++) {
														document
																.write("<option value='"+i+"'>"
																		+ i
																		+ "</option>")
													}
												</script>
											</select> 年 <select id="endmonth" onchange="yueri(this.value)"
												name="endmonth">
												<script>
													for (i = 1; i <= 12; i++) {
														document
																.write("<option value='"+i+"'>"
																		+ i
																		+ "</option>")
													}
												</script>
											</select> 月 <select id="endday" name="endday">
												<script>
													for (i = 1; i <= 31; i++) {
														document
																.write("<option value='"+i+"'>"
																		+ i
																		+ "</option>")
													}
												</script>
											</select> 日
										</div> 
										</td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td align="left"></td>
							</tr>
							<tr>
								<td align="right" width="30%">请假原因：</td>
								<td align="left">
									 <textarea  name="resons" id="resons"
									  style="resize:none;"></textarea>
									 <span	id="resons_span"></span></td>
							</tr>
							<tr>
								<td align="right" width="30%">审核人：</td>
								
								<td align="left">
								<select name="agreemanid">
								<c:forEach items="${managerList}" var="agreman">
									<c:if test="${sessionUser.uid != agreman.uid}">	
									<option value="${agreman.uid }">${agreman.uname}</option>				
									</c:if>
								</c:forEach>						
								</select>
								</td>
							</tr>
							<tr>
								<td align="left" style="padding-left: 242px;" colspan="2"><br />
									<input type="hidden" name="applyerid" value="${sessionUser.uid}">
									<input type="button" id="save" value="提交申请"
									onclick="return check()" /> <input type="button" id="back"
									value="返回" onclick="location='${pageContext.request.contextPath}/user/leave.action' " /></td>
							</tr>

						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>
<script>
	function check() {
		var r1 = checkName('uname', '昵称不能为空');
		
		if (r1) {
			document.forms[0].submit();
			return true;
		} else {
			return false;
		}
	}
	function checkName(id, info) {
		var span = document.getElementById(id + "_span");
		span.innerHTML = "";
		var ele = document.getElementById(id);
		if (ele.value == "") {
			span.innerHTML = "<font style='color:red;font-size:12px;'>" + info
					+ "</font>";
			return false;
		}
		return true;
	}
</script>
<script>
			var num;
			function nianyue(val){
				num=val;
			}
			function yueri(nval){
				var day=document.getElementById("startday");
				day.length=0;
				var daylist=new Array();
				if(nval==1||nval==3||nval==5||nval==7||nval==8||nval==10||nval==12){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31);
				}
				if(nval==4||nval==6||nval==9||nval==11){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30);
				}
				if(nval==2){
					if((num%4===0&&num%100!==0)||num%400===0){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29);
					}else{
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28);
					}	
				}
				for(var i=0;i<daylist[nval].length;i++){
					var textNode = document.createTextNode(daylist[nval][i]);
					var optNode = document.createElement("option");
					optNode.appendChild(textNode);
					day.appendChild(optNode);
				}
			}
		</script>
<script>
			var num;
			function nianyue(val){
				num=val;
			}
			function yueri(nval){
				var day=document.getElementById("endday");
				day.length=0;
				var daylist=new Array();
				if(nval==1||nval==3||nval==5||nval==7||nval==8||nval==10||nval==12){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31);
				}
				if(nval==4||nval==6||nval==9||nval==11){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30);
				}
				if(nval==2){
					if((num%4===0&&num%100!==0)||num%400===0){
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29);
					}else{
					daylist[nval]=new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28);
					}	
				}
				for(var i=0;i<daylist[nval].length;i++){
					var textNode = document.createTextNode(daylist[nval][i]);
					var optNode = document.createElement("option");
					optNode.appendChild(textNode);
					day.appendChild(optNode);
				}
			}
		</script>
</html>