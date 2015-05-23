package chwapaw.security.dao;

import java.util.List;

import org.hibernate.HibernateException;

import chwapaw.security.User;

public interface UserDao {
		
	public User getUserByUsername(String username);
	
	public User saveUser(User user) throws HibernateException;
	
	public User getUserById(Integer id);
	
	public User getUserByUuId(String uuid);
	
	public void removeUserByUuid(String uuid) throws HibernateException;
	
	public List<User> getUsers();
	
}
