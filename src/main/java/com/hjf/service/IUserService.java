package com.hjf.service;


import java.util.List;

import com.hjf.pojo.po.User;

public interface IUserService {
	User findByName(User user);

	void updateUser(User user);

	List<User> findAllUser();

	User findByUid(User findUser);

	List<User> findAllManager();

	void updateUserAccount(User user);

	List<User> findAllAccount();

	void insertUserAccount(User user);

}
