package com.hjf.service;



import java.util.List;

import com.hjf.pojo.po.Emails;


public interface IEmailsService {
	
	void insertEmails(Emails emails);

	List<Emails> findAllEmails(Emails emails);

	void deleteByEid(Emails emails);

	List<Emails> findTrashEmails(Emails emails);

	void deleteByEidReal(Emails emails);

	void updateByEid(Emails emails);

	void updateByEidRead(Emails emails);

	Emails findEmailsByEid(Emails emails);


	List<Emails> findAllEmailsBox(Emails emails);

    void updateByEidInBox(Emails emails);

    List<Emails> findAllEmailsNotBox(Emails emails);
}
