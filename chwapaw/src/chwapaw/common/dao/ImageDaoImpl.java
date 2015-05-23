package chwapaw.common.dao;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import chwapaw.common.Image;

@Repository("imageDao")
public class ImageDaoImpl implements ImageDao {

	@Autowired
	private SessionFactory sf;

	@Override
	public Image saveImage(Image image) throws HibernateException {
		if(image.getId()==null){
		sf.getCurrentSession().saveOrUpdate(image);
		}
		return image;
	}

	@Override
	public void removeImage(Image image) throws HibernateException {
		sf.getCurrentSession().delete(image);

	}

}
