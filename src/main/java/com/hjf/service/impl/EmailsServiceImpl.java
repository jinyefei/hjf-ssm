package com.hjf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjf.mapper.EmailsMapper;
import com.hjf.pojo.po.Emails;
import com.hjf.service.IEmailsService;

@Service
@Transactional
public class EmailsServiceImpl implements IEmailsService {

	@Autowired
	EmailsMapper eMapper;
	@Override
	public void insertEmails(Emails emails) {
		
		eMapper.insertEmails(emails);
	}
	@Override
	public List<Emails> findAllEmails(Emails emails) {
		
		return eMapper.findAllEmails(emails);
	}
	@Override
	public void deleteByEid(Emails emails) {
		eMapper.delteteByEid(emails);
	}
	@Override
	public List<Emails> findTrashEmails(Emails emails) {
		return eMapper.findTrashEmails(emails);
	}
	@Override
	public void deleteByEidReal(Emails emails) {
		eMapper.deleteByEidReal(emails);
	}
	@Override
	public void updateByEid(Emails emails) {
		eMapper.updateByEid(emails);
	}
	@Override
	public void updateByEidRead(Emails emails) {
		eMapper.updateByEidRead(emails);
	}
	@Override
	public Emails findEmailsByEid(Emails emails) {
		return eMapper.findEmailsByEid(emails);
	}

}
