package chwapaw.common.dao;

import org.hibernate.HibernateException;

import chwapaw.common.Image;

public interface ImageDao {
	
	public Image saveImage(Image image) throws HibernateException;
	
	public void removeImage(Image image) throws HibernateException;

}
