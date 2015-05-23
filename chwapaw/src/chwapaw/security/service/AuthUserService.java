package chwapaw.security.service;

//import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import chwapaw.security.User;
import chwapaw.security.dao.UserDao;

@Service
@Transactional(readOnly=true)
public class AuthUserService implements UserDetailsService {
	
	@Autowired
	private UserDao ud;	

	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {
		User usr = ud.getUserByUsername(username);
		//throw new HibernateException(usr.getPassword());
		return usr;
	}

}
