package chwapaw.security.dao;

import org.hibernate.HibernateException;

import chwapaw.common.Person;

public interface PersonDao {
	
	public Person savePerson(Person person) throws HibernateException;
	
	public void removePerson(Person person) throws HibernateException;

}
