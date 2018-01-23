package com.hjf.service;

import java.util.List;

import com.hjf.pojo.po.Vacation;

public interface IVacationService {

	List<Vacation> findAllVacation(Vacation vacation);

	void insertVacation(Vacation vacation);

	List<Vacation> findAllVacationCheck(Integer agreemanid);

	void updateVacationByVid(Integer vid);

	Vacation findVacationByVid(Integer vid);

	void updateVacationAllowByVid(Integer vid);

	void updateVacationRefuseByVid(Integer vid);
	
}
