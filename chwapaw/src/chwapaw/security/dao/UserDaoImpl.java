package chwapaw.security.dao;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Repository;

import chwapaw.common.Image;
import chwapaw.common.Person;
import chwapaw.common.Status;
import chwapaw.common.dao.ImageDao;
import chwapaw.security.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sf;

	@Autowired
	private PasswordEncoder pe;

	@Autowired
	private GroupDao gd;

	@Autowired
	private PersonDao pd;

	@Autowired
	private ImageDao id;

	public User getUserByUsername(String username) {
		Criteria cr = sf.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.eq("username", username));
		return (User) (cr.list().size() > 0 ? cr.list().get(0) : null);
	}

	public User getUserById(Integer id) {
		return (User) sf.getCurrentSession().get(User.class, id);
	}

	
	public User getUserByUuId(String uuid) {
		Criteria cr = sf.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.eq("uuid", uuid));
		return (User) (cr.list().size() > 0 ? cr.list().get(0) : null);
	}

	@SuppressWarnings("unchecked")
	public List<User> getUsers() {
		Query q = sf.getCurrentSession().createQuery(
				"select u from User u where u.status <:status");
		q.setInteger("status", 2);
		return (List<User>) q.list();
	}
	
	public void removeUserByUuid(String uuid) throws HibernateException{
		try {
				Query q = sf.getCurrentSession().createQuery("update User set " +
					"status =:status " +
					"where uuid =:uuid");
				q.setInteger("status", Status.remove);
				q.setString("uuid",uuid);
				q.executeUpdate();			
		} catch(HibernateException he){
			throw he;
		}
		
	}

	public User saveUser(User user) throws HibernateException {

		try {
			if (user.getId() == null) {// register user
				Image image = id.saveImage(user.getImage());
				Person person = pd.savePerson(user.getPerson());
				user.setPassword(pe.encodePassword(user.getPassword(),
						user.getUsername()));
				user.setGroup(gd.getDefaultGroup());
				user.setAuthetifiactionTime(new Date());
				user.setImage(image);
				user.setStatus(Status.inactif);
				user.setDate(new Date());
				user.setUserkey(UUID.randomUUID().toString());
				user.setIp("192.168.0.101");
				user.setPort(1515);
				user.setCreatedBy(getUserById(Status.superAdmin));
				user.setCreatedDate(new Date());
				user.setUuid(UUID.randomUUID().toString());
				user.setPerson(person);
				sf.getCurrentSession().saveOrUpdate(user);
			} else {
				Query q = sf.getCurrentSession().createQuery(
						"update Person SET " + "firstname =:firstname, "
								+ "lastname =:lastname, " + "gender =:gender, "
								+ "where id=:id");
				q.setString("firstname", user.getPerson().getFirstname());
				q.setString("lastname", user.getPerson().getLastname());
				q.setString("gender", user.getPerson().getGender());
				q.setInteger("id", user.getPerson().getId());
				q.executeUpdate();

				q = sf.getCurrentSession().createQuery(
						"update User set " + "email =:email, "
								+ "language =:language " + "where id =:id");
				q.setString("email", user.getEmail());
				q.setString("language", user.getLanguage());
				q.setInteger("id", user.getId());
				q.executeUpdate();
			}
		} catch (Exception e) {
			// pd.removePerson(person);
			throw e;
		}
		return user;
	}

}
