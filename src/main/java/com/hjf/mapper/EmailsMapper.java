package com.hjf.mapper;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.hjf.pojo.po.Emails;

@Repository(value="emailsMapper")
public interface EmailsMapper {
	
	

	void insertEmails(Emails emails);

	List<Emails> findAllEmails(Emails emails);

	void delteteByEid(Emails emails);

	List<Emails> findTrashEmails(Emails emails);

	void deleteByEidReal(Emails emails);

	void updateByEid(Emails emails);

	void updateByEidRead(Emails emails);

	Emails findEmailsByEid(Emails emails);
}
