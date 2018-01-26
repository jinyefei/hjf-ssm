<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

</head>

<body onload="IniEvent()">
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/Images/logo.gif"
				class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">
			${sessionUser.nickname },你好！欢迎访问办公管理系统！&nbsp;<a  href="#" onclick="location.href='loginOut.action'">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<form id="myForm" name="myForm" action="${pageContext.request.contextPath}/user/sendEmails.action"
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
				<a href="${pageContext.request.contextPath}/user/draftBox.action" target="_self">草稿箱</a>
			</dd>
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
				<a href="${pageContext.request.contextPath}/user/draftBox.action" target="_self">草稿箱</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath}/user/mailWrite.action" target="_self">写邮件</a>
			</dd>
			<dd>
				<a href="${pageContext.request.contextPath}/user/hadSendEmails.action" target="_self">已发邮件</a>
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
					<div class="t">垃圾邮件列表</div>
					<div class="pages">
						<table width="90%" border="0" cellspacing="0" cellpadding="0"
							id="emailstable">
							<tr>
								<td align="center" width="20%" height="20px">邮件标题：</td>
								<td align="center" width="20%" height="20px">邮件内容：</td>
								<td align="center" width="20%" height="20px">是否已读：</td>
								<td align="center" width="20%" height="20px">接收时间：</td>
								<td align="center" width="20%" height="20px">操作：</td>
							</tr>
							<c:forEach items="${emailsList}" var="emails">
								<tr>
									<td align="center" width="20%" height="20px">
									<a href="mailsReadTrash.action/${emails.eid}">
									${emails.etitle}</a>
									</td>
									<td align="center" width="20%" height="20px">${emails.econtext }</td>
									<td align="center" width="20%" height="20px">${emails.isread }</td>
									<td align="center" width="20%" height="20px"><fmt:formatDate
											value="${emails.sendtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td align="center" width="20%" height="20px">
										<a href="${pageContext.request.contextPath}/user/mailsRollBack.action/${emails.eid}"
										onclick="return confirm('确实执行此操作?')">还原|</a>
										<a href="${pageContext.request.contextPath}/user/mailsDeleteReal.action/${emails.eid}"
										onclick="return confirm('确实执行此操作?')">删除</a>
										
									</td>
								</tr>
							</c:forEach>



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
		var r1 = checkTitle('etitle', '标题不能为空');
		var r2 = checkEcontext('econtext', '内容不能为空');

		if (r1 && r2) {
			document.forms[0].submit();
			return true;
		} else {
			return false;
		}
	}
	function checkTitle(id, info) {
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
	function checkEcontext(id, info) {
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
<script type="text/javascript">
	function IniEvent() {
		var tbl = document.getElementById("emailstable");
		var trs = tbl.getElementsByTagName("tr");
		for (var i = 0; i < trs.length; i++) {
			trs[i].onmouseover = Trmouseover;
			trs[i].onmouseout = Trmouseout;
		}
	}
	function Trmouseover() {
		var tbl = document.getElementById("emailstable");
		var trs = tbl.getElementsByTagName("tr");
		for (var i = 0; i < trs.length; i++) {
			if (trs[i] == this) { //判断是不是当前选择的行
				trs[i].style.background = "grey";
			} else {
				trs[i].style.background = "white";
			}
		}
	}
	function Trmouseout() {
		var tbl = document.getElementById("emailstable");
		var trs = tbl.getElementsByTagName("tr");
		for (var i = 0; i < trs.length; i++) {
			trs[i].style.background = "white";
		}
	}
</script>
</html>