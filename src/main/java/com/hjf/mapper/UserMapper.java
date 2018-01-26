package com.hjf.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hjf.pojo.po.User;

@Repository(value="userMapper")
public interface UserMapper {
	User findByName(User user);
	User findByNameOwn(User user);
	void update(User user);

	List<User> findAllUser();

	User findByUid(User user);

	List<User> findAllManager();

	void updateUserAccount(User user);

	//选取所有普通账户列表
	List<User> findAllAccount();

	void insertUserAccount(User user);

    void deleteByUid(User user);


}
