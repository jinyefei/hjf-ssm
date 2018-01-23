package com.hjf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.hjf.mapper.VacationMapper;
import com.hjf.pojo.po.Vacation;
import com.hjf.service.IVacationService;

@Service
@Transactional
public class VacationServiceImpl implements IVacationService{
	@Autowired
	VacationMapper mapper;

	@Override
	public List<Vacation> findAllVacation(Vacation vacation) {
		
		return mapper.findAllVacation(vacation);
	}

	@Override
	public void insertVacation(Vacation vacation) {
		mapper.insertVacation(vacation);
	}

	@Override
	public List<Vacation> findAllVacationCheck(Integer agreemanid) {
		
		return mapper.findAllVacationCheck(agreemanid);
	}

	@Override
	public void updateVacationByVid(Integer vid) {
		mapper.updateVacationByVid(vid);
	}

	@Override
	public Vacation findVacationByVid(Integer vid) {
		return mapper.findVacationByVid(vid);
	}

	@Override
	public void updateVacationAllowByVid(Integer vid) {
		mapper.updateVacationAllowByVid(vid);
	}

	@Override
	public void updateVacationRefuseByVid(Integer vid) {
		mapper.updateVacationRefuseByVid(vid);
	}
	


	
}
