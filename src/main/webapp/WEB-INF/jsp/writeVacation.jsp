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

	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
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
	<form id="myForm" name="myForm"
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
					<div class="t">申请休假</div>
					<div class="pages">
						<table width="90%" height="150px" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<td align="right" width="30%">姓名：</td>
								<td align="left"><input type="text" name="applyername"
								readonly="readonly"	value="${sessionUser.uname }" id="uname" /> <span
									id="uname_span"></span></td>
							</tr>
							<script src="${pageContext.request.contextPath}/laydate/laydate.js"></script>
							<script>
                                lay('#version').html('-v'+ laydate.v);

                                //执行一个laydate实例
                                laydate.render({
                                    elem: '#starttime' //指定元素
                                });
							</script>
							<script>
                                lay('#version').html('-v'+ laydate.v);

                                //执行一个laydate实例
                                laydate.render({
                                    elem: '#endtime' //指定元素
                                });
							</script>
							<tr>
								<td align="right" width="30%" >开始时间：</td>
								<td align="left">
									<input type="text"  id="starttime" name="starttime"><font color="red">*</font>
									<span id="starttime_span" name="starttime_span"></span>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">结束时间：</td>
								<td align="left">
									<input type="text"  id="endtime" name="endtime"><font color="red">*</font>
									<span id="endtime_span" name="endtime_span"></span>
								</td>
							</tr>
							<tr>
								<td align="right" width="30%">请假天数：</td>
								<td align="left">
									<input type="text"  id="totalday" name="totalday"><font color="red">*</font>
									<span id="totalday_span" name="totalday_span"></span>
								</td>
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
									<input type="submit" id="save" value="提交申请"/>
									<input type="button" id="back"
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

<script type="text/javascript">
    $(function() {
        $("#myForm").validate({
            rules : {
                uname : "required",
                starttime : "required",
                endtime : "required",
				totalday: "required"
            },
            messages : {
                uname : "姓名不能为空",
                starttime : "开始日期不能为空",
                endtime : "结束日期不能为空",
                totalday : "请假天数不能为空"
            },
            submitHandler : function() {
                //提交Ajax
                $.ajax({
                    data : $("#myForm").serialize(),
                    dataType : "text",
                    type : "post",
                    url : "${pageContext.request.contextPath}/user/saveVacation.action",
                    success : function(rec) {
                        if(rec=="1"){
                            location.href = "${pageContext.request.contextPath}/user/leave.action"
                        }else if(rec=="0"){
                            $("#endtime_span").html("结束日期不能早于开始日期！");
                        }else if(rec=="2"){
                            $("#starttime_span").html("开始日期不能早于今天！");
						}else if(rec=="3"){
                            $("#starttime_span").html("开始日期不能早于今天！");
                            $("#endtime_span").html("结束日期不能早于今天！");
						}else{
                            $("#totalday_span").html("请假总计天数输入有误！");
						}
                    },
					error:function () {
						alert('服务器已断开！')
                    }
                });
            }
        });
    })

</script>

</html>