package com.hjf.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hjf.pojo.po.User;
import com.hjf.pojo.po.Emails;
import com.hjf.service.IEmailsService;
import com.hjf.service.IUserService;

@Controller
@RequestMapping(value="/user")
public class EmailsAction {
	@Autowired
	IUserService ser;
	@Autowired
	IEmailsService eser;
	/*
	 * 转到编辑邮件页
	 */
	@RequestMapping("/mailWrite.action")
	public String Emails(HttpSession session){
		List<User> userList=ser.findAllUser();
		session.setAttribute("userList", userList);
		return "writeEmails";
	}
	
	/*
	 * 发送邮件
	 */
	@RequestMapping(value="/sendEmails.action",produces="plain/text;charset=UTF-8")
	/*@ResponseBody 上传下载文件可用*/
	public String doEmail(Emails emails,User user,HttpSession session){
		//手动封装默认的剩余属性
		Date sendtime=new Date();
		emails.setSendtime(sendtime);
		emails.setIstrash("not");
		emails.setIsread("未读");
		eser.insertEmails(emails);
		
		ser.updateUser(user);
		User findUser = ser.findByName(user);
		session.setAttribute("sessionUser", findUser);
		return "redirect:/user/toindex.do";
	}
	/*
	 * 转到展示个人邮件页
	 */
	@RequestMapping(value="/mailReceive!receive.action")
	public String showEmails(HttpSession session){
		User findUser=(User) session.getAttribute("sessionUser");
		if(findUser!=null){
			Integer reciverid=findUser.getUid();
			Emails emails=new Emails();
			emails.setReciverid(reciverid);
			List<Emails> emailsList=eser.findAllEmails(emails);
			session.setAttribute("emailsList", emailsList);
		}
		return "showEmails";
	}
	/*
	 * 指定邮件移入垃圾箱
	 */
	@RequestMapping("/mailsDelete.action/{eid}")
	public String EmailsTrash(@PathVariable(value = "eid") Integer eid){
		Emails emails=new Emails();
		emails.setEid(eid);
		eser.deleteByEid(emails);
		return "redirect:/user/mailReceive!receive.action";
	}
	/**************************************/
	/*
	 * 转到展示个人垃圾邮件页
	 */
	@RequestMapping(value="/mailGarage!garage.action")
	public String showTrashEmails(HttpSession session){
		User findUser=(User) session.getAttribute("sessionUser");
		if(findUser!=null){
			Integer reciverid=findUser.getUid();
			Emails emails=new Emails();
			emails.setReciverid(reciverid);
			List<Emails> emailsList=eser.findTrashEmails(emails);
			session.setAttribute("emailsList", emailsList);
		}
		return "showTrashEmails";
	}
	/*
	 * 还原指定垃圾邮件
	 */
	@RequestMapping("/mailsRollBack.action/{eid}")
	public String EmailsBack(@PathVariable(value = "eid") Integer eid){
		Emails emails=new Emails();
		emails.setEid(eid);
		eser.updateByEid(emails);
		return "redirect:/user/mailGarage!garage.action";
	}
	/*
	 * 删除指定垃圾邮件
	 */
	@RequestMapping("/mailsDeleteReal.action/{eid}")
	public String EmailsDel(@PathVariable(value = "eid") Integer eid){
		Emails emails=new Emails();
		emails.setEid(eid);
		eser.deleteByEidReal(emails);
		return "redirect:/user/mailGarage!garage.action";
	}
	
	
	/*
	 * 阅读指定邮件
	 */
	@RequestMapping("/mailsRead.action/{eid}")
	public String EmailsRead(@PathVariable(value = "eid") Integer eid,HttpSession session){
		Emails emails=new Emails();
		emails.setEid(eid);
		eser.updateByEidRead(emails);
		emails=eser.findEmailsByEid(emails);
		if(emails!=null){
			User findUser=new User();
			findUser.setUid(emails.getSenderid());
			findUser=ser.findByUid(findUser);
			session.setAttribute("findUser", findUser);
			session.setAttribute("emails", emails);
		}
		
		return "readEmails1";
	}
	/*
	 * 阅读指定垃圾邮件
	 */
	@RequestMapping("/mailsReadTrash.action/{eid}")
	public String EmailsReadTrash(@PathVariable(value = "eid") Integer eid,HttpSession session){
		Emails emails=new Emails();
		emails.setEid(eid);
		eser.updateByEidRead(emails);
		emails=eser.findEmailsByEid(emails);
		if(emails!=null){
			User findUser=new User();
			findUser.setUid(emails.getSenderid());
			findUser=ser.findByUid(findUser);
			session.setAttribute("findUser", findUser);
			session.setAttribute("emails", emails);
		}
		return "readEmails2";
	}
}
