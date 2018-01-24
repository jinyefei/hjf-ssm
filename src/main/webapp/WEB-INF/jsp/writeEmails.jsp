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
			${sessionUser.nickname },你好！欢迎访问办公管理系统！&nbsp;<a  href="#" onclick="location.href='${pageContext.request.contextPath}/user/loginOut.action'";>注销</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<form id="myForm" name="myForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/user/sendEmails.action"
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
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>
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
					<div class="t">写邮件</div>
					<div class="pages">
						<table width="90%" height="150px" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td align="right" width="30%">收件人：</td>
								
								<td align="left">
								<select name="reciverid">
								<c:forEach items="${userList}" var="user">
									<c:if test="${sessionUser.uid != user.uid}">	
									<option value="${user.uid }">${user.uname}</option>				
									</c:if>
								</c:forEach>						
								</select>
								</td>
                        
							</tr>
							<tr>
								<td align="right" width="30%">邮件标题：</td>
								<td align="left"><input type="text" name="etitle"
									 id="etitle" />
									 </td>
							</tr>
							<tr>
								<td align="right" width="30%"  >邮件内容：</td>
								<td align="left"><textarea  name="econtext" id="econtext"
									  style="resize:none;"></textarea>
									  </td>
							</tr>
							<tr>
								<td align="right" width="30%">附件名：</td>
								<td align="left">
									<input type="text"  width="50px"  id="enclosure" name="enclosure" />
								<input type="file" style="color: transparent;" name="file" id="file" onchange="handleFile()" />
								<font style="float:left;color:black;font-size:12px;">(附件不能大于9M)</font>
								</td>
							</tr>
							<tr>
								<td   align="left" style="padding-left:242px;"  colspan="2"><br />
								 <input type="hidden" name="senderid" value="${sessionUser.uid}"> 
								 <input type="hidden" name="uname" value="${sessionUser.uname}">
									<input type="submit" id="save" value="发送邮件"/>
									&nbsp;
									<input type="button" id="back" value="取消编写"  onclick="location='${pageContext.request.contextPath}/user/toindex.do' " />
								</td>

							</tr>

						</table>

					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>

</body>

<script type="text/javascript">
    $(function() {
        $("#myForm").validate({
            rules : {
                etitle : "required",
                econtext : "required"
            },
            messages : {
                etitle : "标题不能为空",
                econtext : "内容不能为空"
            }
        });
    })

</script>

<script >
    var file = document.getElementById("file");
    var fileName = document.getElementById("enclosure");
    function handleFile(){
        fileName.value = file.value;
    }
</script>
</html>