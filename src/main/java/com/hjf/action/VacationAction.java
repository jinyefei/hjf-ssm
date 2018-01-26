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

import com.hjf.pojo.po.User;
import com.hjf.pojo.po.Vacation;
import com.hjf.service.IUserService;
import com.hjf.service.IVacationService;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/user")
public class VacationAction {
	@Autowired
	IUserService ser;
	@Autowired
	IVacationService vser;

	//转到展示假期记录的控制器   vacationListOther  vacationListOwn
	@RequestMapping(value="/leave.action")
	public String toLeave(HttpSession session){
		User findUser=(User) session.getAttribute("sessionUser");
		if(findUser!=null){
			List<Vacation> vacationListOther=new ArrayList();
			if(findUser.getIsmanage().equals("管理员")){
				Integer agreemanid=findUser.getUid();
				vacationListOther=vser.findAllVacationCheck(agreemanid);
				session.setAttribute("vacationListOther", vacationListOther);
			}
				Integer applyerid=findUser.getUid();
				Vacation vacation=new Vacation();
				vacation.setApplyerid(applyerid);
				List<Vacation> vacationListOwn=vser.findAllVacation(vacation);
				session.setAttribute("vacationListOwn", vacationListOwn);
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
		@ResponseBody
		public String doSaveVacation(Vacation vacation,HttpSession session){
			//手动封装默认的剩余属性
			Date sendtime1;
			Date sendtime2;
			Date timenow=new Date();
			Integer totalday=0;
			vacation.setIsagree("未审核");
			//计算总天数
			final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {

				sendtime1 = sdf.parse(vacation.getStarttime());
				sendtime2 = sdf.parse(vacation.getEndtime());
				timenow=sdf.parse(sdf.format(timenow));

				final Calendar cal = Calendar.getInstance();

				cal.setTime(sendtime1);
				final long time1 = cal.getTimeInMillis();
				cal.setTime(sendtime2);
				final long time2 = cal.getTimeInMillis();
				cal.setTime(timenow);
				final long time3 = cal.getTimeInMillis();
				if(time1<time3){
					if(time2<time3){
						return "3";//开始、结束日期有误！
					}
					return "2";//开始日期有误！
				}
				final long between_days = (time2 - time1) / (1000 * 3600 * 24);
				totalday=Integer.parseInt(String.valueOf(between_days))+1;

			} catch (ParseException e) {
				e.printStackTrace();
			}
			Integer vtotalday=vacation.getTotalday();
			if(totalday == vtotalday){
				if(totalday>0){
					vacation.setTotalday(totalday);
					vser.insertVacation(vacation);
					return "1";//请求通过
				}else{
					return "0";//结束日期不能大于开始日期！
				}
			}else{
				return "4";//请假天数输入有误！
			}
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

















