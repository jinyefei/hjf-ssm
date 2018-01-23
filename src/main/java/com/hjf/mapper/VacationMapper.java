package com.hjf.mapper;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.hjf.pojo.po.Vacation;



@Repository(value="vacationMapper")
public interface VacationMapper {

	List<Vacation> findAllVacation(Vacation vacation);

	void insertVacation(Vacation vacation);

	List<Vacation> findAllVacationReal();

	List<Vacation> findAllVacationCheck(Integer agreemanid);

	void updateVacationByVid(Integer vid);

	Vacation findVacationByVid(Integer vid);

	void updateVacationAllowByVid(Integer vid);

	void updateVacationRefuseByVid(Integer vid);
	
}
