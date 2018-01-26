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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/messages_zh.js"></script>

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
				${sessionUser.nickname },
			你好！欢迎访问办公管理系统！&nbsp;<a href="#" onclick="location.href='${pageContext.request.contextPath}/user/loginOut.action'">注销</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<form id="myForm" name="myForm"  action= "${pageContext.request.contextPath}/user/changeAccountByUid.action"
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
					<div class="t">账户信息</div>
					<div class="pages">
						<table width="90%" height="150px" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td align="right" width="30%">用户名：</td>
								<td align="left"><input type="text" name="uname"
								 id="uname" value="${updateUser.uname}" /><span
										id="mess"></span>
								</td>
                        
							</tr>
							<tr>
								<td align="right" width="30%">密码：</td>
								<td align="left"><input type="password" name="password"
								value="${updateUser.password}"	 id="password" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">昵称：</td>
								<td align="left"><input type="text" name="nickname"
								 id="nickname"  value="${updateUser.nickname}" />
								</td>
                        
							</tr>
							<tr>
								<td align="right" width="30%">年龄：</td>
								<td align="left"><input type="text" name="uage"
								 id="uage" value="${updateUser.uage}" />
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">性别：</td>
								<td align="left">
									<c:if test="${updateUser.ugender eq '男'}">
										<input type="radio" value="男" name="ugender" checked="checked"> 男
										<input type="radio" value="女" name="ugender"> 女
									</c:if>
									<c:if test="${updateUser.ugender eq '女'}">
										<input type="radio" value="男" name="ugender"> 男
										<input type="radio" value="女" name="ugender" checked="checked"> 女
									</c:if>
									<c:if test="${updateUser.ugender eq '待补充'}">
										<input type="radio" value="男" name="ugender"> 男
										<input type="radio" value="女" name="ugender"> 女
									</c:if>

								</td>
							</tr>
							<tr>
								<td align="right" width="30%">手机：</td>
								<td align="left"><input type="text" name="uphone"
								 id="uphone" value="${updateUser.uphone}" /> <span
									id="uphone_span"></span></td>
							</tr>
							<tr>
								<td align="right" width="30%">地址：</td>
								<td align="left"><input type="text" name="uaddr"
								 id="uaddr" value="${updateUser.uaddr}" /></td>
							</tr>
							<tr>
								<td align="right" width="30%">权限：</td>
								<td align="left">
									<c:if test="${updateUser.ismanage eq '管理员'}">
										<input type="radio" value="管理员" name="ismanage" checked="checked"> 管理员
										<input type="radio" value="普通员工" name="ismanage"> 普通员工
									</c:if>
									<c:if test="${updateUser.ismanage eq '普通员工'}">
										<input type="radio" value="管理员" name="ismanage"> 管理员
										<input type="radio" value="普通员工" name="ismanage" checked="checked"> 普通员工
									</c:if>
								</td>
							</tr>
							<tr>
								<td align="left" style="padding-left: 242px;" colspan="2"><br />
									<input type="hidden" name="uid"
										   id="uid"  value="${updateUser.uid}" />
									<input type="submit" id="save" value="保存数据" onclick="check()"
									 /> <input type="button" id="back"
									value="返回" onclick="location='${pageContext.request.contextPath}/user/userInfo!manageAccountData.action' " /></td>

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
		var r1 = checkphone('uphone', '手机号码格式有误');
		
		if (r1) {
			return true;
		} else {
			return false;
		}
	}

	function checkphone(id, info) {
		var ele = document.getElementById(id);
		var span = document.getElementById(id + "_span");
		span.innerHTML = "";
		var regex = /^1[3|4|5|7|8][0-9]{9}$/;
		var res = regex.test(ele.value);
		if (!res) {
			span.innerHTML = "<font style='color:black;font-size:12px;'>"
					+ info + "</font>";
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">

    //表单校验
    $(function() {
        $("#myForm").validate({
            rules : {
                uname : "required",
                password : "required",
				nickname : "required"
            },
            messages : {
                uname : "用户名不能为空",
                password : "密码不能为空",
                nickname : "昵称不能为空"
            },
            submitHandler : function() {
                //提交Ajax
                $.ajax({
                    data : $("#myForm").serialize(),
                    dataType : "text",
                    type : "post",
                    url : "${pageContext.request.contextPath}/user/checkUnameUsed.action",
                    success : function(rec) {
                        if(rec=="0"){
                            $("#mess").html("用户名已被注册");
                        }else{
                            document.forms[0].submit();
                        }
                    }
                });



            }
        });
    })

</script>
</html>