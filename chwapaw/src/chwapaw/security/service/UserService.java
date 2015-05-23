package chwapaw.security.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import chwapaw.security.User;

@Transactional
public interface UserService {

	public User getUserByUsername(String username);

	public User saveUser(User user);

	public List<User> getUsers();
	
	public void removeUserByUuid(String uuid);

	public User getUserById(Integer id);
	
	public User getUserByUuId(String uuid);

}
