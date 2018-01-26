package com.hjf.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hjf.mapper.UserMapper;
import com.hjf.pojo.po.User;
import com.hjf.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService{
	@Autowired
	UserMapper mapper;
	@Override
	public User findByName(User user){
		return mapper.findByName(user);
	}

	@Override
	public User findByNameOwn(User user) {
		return mapper.findByNameOwn(user);
	}

	@Override
	public void updateUser(User user) {
		mapper.update(user);
	}

	@Override
	public List<User> findAllUser() {
		return mapper.findAllUser();
	}

	@Override
	public User findByUid(User user) {
		return mapper.findByUid(user);
	}

	@Override
	public List<User> findAllManager() {
		return mapper.findAllManager();
	}

	@Override
	public void updateUserAccount(User user) {
		mapper.updateUserAccount(user);
	}

	@Override
	public List<User> findAllAccount() {
		return mapper.findAllAccount();
	}

	@Override
	public void insertUserAccount(User user) {
		mapper.insertUserAccount(user);
	}

	@Override
	public void deleteByUid(User user) {
		mapper.deleteByUid(user);
	}


}
