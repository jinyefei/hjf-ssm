package com.hjf.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hjf.pojo.po.Emails;
import com.hjf.pojo.po.User;
import com.hjf.pojo.po.Vacation;
import com.hjf.service.IUserService;
import com.hjf.service.IVacationService;
@Controller
@RequestMapping(value="/user")
public class VacationAction {
	@Autowired
	IUserService ser;
	@Autowired
	IVacationService vser;

	//转到展示假期记录的控制器
	@RequestMapping(value="/leave.action")
	public String toLeave(HttpSession session){
		User findUser=(User) session.getAttribute("sessionUser");
		if(findUser!=null){
			List<Vacation> vacationList1=new ArrayList();
			if(findUser.getIsmanage().equals("管理员")){
				Integer agreemanid=findUser.getUid();
				vacationList1=vser.findAllVacationCheck(agreemanid);
			}
				Integer applyerid=findUser.getUid();
				Vacation vacation=new Vacation();
				vacation.setApplyerid(applyerid);
				List<Vacation> vacationList=vser.findAllVacation(vacation);				
				vacationList.addAll(vacationList1);
				session.setAttribute("vacationList", vacationList);				
		}
		return "showApply";
	}
		//转到申请假期页面
		@RequestMapping(value="/applyVacation.action")
		public String toWrite(HttpSession session){
			List<User> managerList=ser.findAllManager();
			session.setAttribute("managerList", managerList);
			return "writeVacation";
		}
		
		/*
		 *发送申请假期报告
		 */
		@RequestMapping(value="/saveVacation.action",produces="plain/text;charset=UTF-8")
		/*@ResponseBody 上传下载文件可用*/
		public String doSaveVacation(Vacation vacation,HttpSession session){
			//手动封装默认的剩余属性
			Date sendtime1=new Date();
			Date sendtime2=new Date();
			vacation.setStarttime(sendtime1);
			vacation.setEndtime(sendtime2);
			vacation.setIsagree("未审核");
			//计算总天数
			final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				sendtime1 = sdf.parse(sdf.format(sendtime1));
				sendtime2 = sdf.parse(sdf.format(sendtime2));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
	        final Calendar cal = Calendar.getInstance();
	        cal.setTime(sendtime1);
	        final long time1 = cal.getTimeInMillis();
	        cal.setTime(sendtime2);
	        final long time2 = cal.getTimeInMillis();
	        final long between_days = (time2 - time1) / (1000 * 3600 * 24);
	        Integer totalday=Integer.parseInt(String.valueOf(between_days));
	        vacation.setTotalday(totalday);
	        
	        vser.insertVacation(vacation);
			return "redirect:/user/leave.action";
		}
		
		/*
		 * 审核指定请假申请
		 */
		@RequestMapping("/checkVacation.action/{vid}")
		public String VacationRead(@PathVariable(value = "vid") Integer vid,HttpSession session){
			vser.updateVacationByVid(vid);
			Vacation findVacation=vser.findVacationByVid(vid);
			session.setAttribute("findVacation", findVacation);		
			return "showVacation";
		}
		/*
		 * 批准指定请假申请
		 */
		@RequestMapping("/allow.action/{vid}")
		public String VacationAllow(@PathVariable(value = "vid") Integer vid,HttpSession session){
			vser.updateVacationAllowByVid(vid);
			Vacation findVacation=vser.findVacationByVid(vid);	
			return "forward:/user/leave.action";
		}
		/*
		 * 拒绝指定请假申请
		 */
		@RequestMapping("/refuse.action/{vid}")
		public String EmailsRead(@PathVariable(value = "vid") Integer vid,HttpSession session){
			vser.updateVacationRefuseByVid(vid);
			Vacation findVacation=vser.findVacationByVid(vid);	
			return "forward:/user/leave.action";
		}
}

















