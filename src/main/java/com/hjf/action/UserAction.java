package com.hjf.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hjf.pojo.po.Emails;
import com.hjf.pojo.po.User;
import com.hjf.service.IUserService;

@Controller
@RequestMapping(value="/user")
public class UserAction {
	@Autowired
	IUserService ser;

	//转到登录页面的控制器
	@RequestMapping(value="/tologin.do")
	public String toLogin(){
		return "login";
	}
	/*
	 * 登陆
	 */
	@RequestMapping(value="/login.do",produces="plain/text;charset=UTF-8")
	@ResponseBody
	public String doLogin(User user,HttpSession session){
		User findUser = ser.findByName(user);
		if(findUser !=null){
			if(findUser.getPassword().equals(user.getPassword())){
				//允许登录
				session.setAttribute("sessionUser", findUser);
				return "1";
			}else{
				return "0";//校验不通过
			}
		}
		
		return "0";
	}
	
	/*
	 * 退出
	 */
	
	@RequestMapping("/loginOut.action")
	public String loginOut(){
		return "login";
	}
	/*
	 * 转到首页
	 */
	@RequestMapping("/toindex.do")
	public String index(){
		return "index";
	}
	/*
	 * 转到编辑个人信息页
	 */
	@RequestMapping("/userInfo!editData.action")
	public String editor(){
		return "editor";
	}
	
	/*
	 * 个人信息更新
	 */
	@RequestMapping(value="/userInfo!updateData.action",produces="plain/text;charset=UTF-8")
	/*@ResponseBody 上传下载文件可用*/
	public String doUpdate(User user,HttpSession session){
		ser.updateUser(user);
		User findUser = ser.findByName(user);
		session.setAttribute("sessionUser", findUser);
		return "forward:/user/toindex.do";
	}
	
	/*
	 * 转到展示个人账户页面
	 */
	@RequestMapping("/userInfo!singleAccountData.action")
	public String singleAccount(){
		return "editAccount";
	}
	/*
	 * 转到个人账户编辑页面
	 */
	@RequestMapping("/toeditAccount.action")
	public String saveInfoAccount(){
		return "singleAccount";
	}
	/*
	 * 提交更新个人账户信息
	 */
	@RequestMapping(value="/submitAccount.action",produces="plain/text;charset=UTF-8")
	/*@ResponseBody 上传下载文件可用*/
	public String doEditAcount(User user,HttpSession session){
		ser.updateUserAccount(user);
		User findUser = ser.findByName(user);
		session.setAttribute("sessionUser", findUser);
		return "forward:/user/userInfo!singleAccountData.action";
	}
	/*
	 * 转到展示所有账户页
	 */
	@RequestMapping(value="/userInfo!manageAccountData.action")
	public String showEmails(HttpSession session){
			List<User> accountList=ser.findAllAccount();
			session.setAttribute("accountList", accountList);
		return "showAllAccounts";
	}
	
	/*
	 * 转到新增账户页面
	 */
	@RequestMapping("/addAccount.action")
	public String addAccount(){
		return "addAccount";
	}
	/*
	 * 提交新增个人账户信息
	 */
	@RequestMapping(value="/submitAddAccount.action",produces="plain/text;charset=UTF-8")
	public String doAddAcount(User user,HttpSession session){
		user.setIsmanage("普通员工");
		ser.insertUserAccount(user);
		return "forward:/user/userInfo!manageAccountData.action";
	}

	/*
	 *注册账户
	 */
	@RequestMapping(value="/checkUnameUsed.action",produces="plain/text;charset=UTF-8")
	@ResponseBody
	public String doRegister(User user,HttpSession session){
		User findUser = ser.findByName(user);
		if(findUser ==null){
				return "1";
			}else{
				return "0";//校验不通过
			}
	}
}
