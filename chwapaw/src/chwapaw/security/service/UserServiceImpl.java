package chwapaw.security.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import chwapaw.security.User;
import chwapaw.security.dao.GroupDao;
import chwapaw.security.dao.UserDao;

@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao ud;

	@Autowired
	private GroupDao gd;

	@Autowired
	private PasswordEncoder pe;

	@Autowired
	private MessageSource ms;

	public User getUserByUsername(String username) {
		return ud.getUserByUsername(username);
	}

	public List<User> getUsers() {
		return ud.getUsers();
	}

	public User getUserById(Integer id) {
		return ud.getUserById(id);
	}
	
	public User getUserByUuId(String uuid) {
		return ud.getUserByUuId(uuid);
	}


	public void removeUserByUuid(String uuid) {
		ud.removeUserByUuid(uuid);
	}
	
	
	@Override
	public User saveUser(User user) {
		return ud.saveUser(user);
	}

}
