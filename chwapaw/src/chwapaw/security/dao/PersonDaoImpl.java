package chwapaw.security.dao;

import java.util.UUID;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import chwapaw.common.Person;

@Repository("personDao")
public class PersonDaoImpl implements PersonDao {
	
	@Autowired
	private SessionFactory sf;
	
	public Person savePerson(Person person) throws HibernateException {
		if(person.getId()==null){
			person.setUuid(UUID.randomUUID().toString());
		sf.getCurrentSession().saveOrUpdate(person);
		}
		return person;
	}
	
	public void removePerson(Person person) throws HibernateException {
		sf.getCurrentSession().delete(person);
	}

}
