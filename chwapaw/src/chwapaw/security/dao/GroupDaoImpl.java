package chwapaw.security.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import chwapaw.security.Group;
import chwapaw.security.Menu;

@Repository("groupDao")
public class GroupDaoImpl implements GroupDao {

	@Autowired
	private SessionFactory sf;
	
	public Group getDefaultGroup(){
		Criteria cr = sf.getCurrentSession().createCriteria(Group.class);
		cr.add(Restrictions.eq("code", "default"));
		return (Group)(cr.list().size()>0?cr.list().get(0):null);	
	}
	
	@SuppressWarnings("unchecked")
	public List<Menu> getAllMenus(){
		Criteria cr = sf.getCurrentSession().createCriteria(Menu.class).addOrder(Order.desc("position"));
		return (List<Menu>) cr.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Menu> getMenusByGroup(Group group){
		Query q = sf.getCurrentSession().createQuery("select m from Menu m join m.groups g where g.id =:id order by m.position asc");
		q.setInteger("id", group.getId());
		return (List<Menu>)q.list();
	}
	
	public List<Menu> getMenuNullParentByGroup(Group group){
		List<Menu> menus = new ArrayList<Menu>();
		for(Menu m : getMenusByGroup(group)){
			if(m.getParent()==null)
				menus.add(m);
		}
		return menus;
	}
	
	@SuppressWarnings("unchecked")
	public List<Menu> getChildrenByParent(Menu menu){
		Query q = sf.getCurrentSession().createQuery("from Menu m where parent_id=:parent order by m.position desc");
		q.setInteger("parent", menu.getId());
		return (List<Menu>)q.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getGroups(){
		Criteria cr = sf.getCurrentSession().createCriteria(Group.class).addOrder(Order.desc("id"));
		cr.add(Restrictions.ne("code", "default"));		
		return (List<Object>) cr.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> searchGroup(String name, String code){
		String str = " from Group g where 1=1";
		if(!name.isEmpty())
			str += " and g.name like '%"+name.replace("'", "''")+"%'";
		if(!code.isEmpty())
			str += " and g.code like '%"+code.replace("'", "''")+"%'";
		str += " order by id desc";
		Query q = sf.getCurrentSession().createQuery(str);
		return (List<Object>)q.list();
	}
	
	public Group getGroupById(Integer id){
		return (Group)sf.getCurrentSession().get(Group.class, id);
	}
	
	public void saveGroup(Group group) throws HibernateException {
		try {
			if(group.getId()==null){
				group.setUuid(UUID.randomUUID().toString());
				sf.getCurrentSession().saveOrUpdate(group);
			} else {
				Query q = sf.getCurrentSession().createQuery("update Group set " +
					"name =:name, " +
					"code =:code, " +
					"viewer =:viewer, " +
					"limit =:limit, " +
					"description =:description " +
					"where id =:id");
				q.setString("name", group.getName()); 
				q.setString("code", group.getCode());
				q.setString("viewer", group.getViewer());
				q.setParameter("limit", group.getLimit());
				q.setString("description", group.getDescription());
				q.setInteger("id", group.getId());
				q.executeUpdate();
			}
		} catch(HibernateException he){
			throw he;
		}
	}
	
	@Transactional
	public void insertGroupMenu(List<Integer> menuIds, Group group) throws HibernateException{
		for(Integer i : menuIds){
			Menu m = getMenuById(i);
			group.getMenus().add(m);
		}
		sf.getCurrentSession().saveOrUpdate(group);
	}
	
	public void removeGroupById(Integer id) throws HibernateException {
		Query query = sf.getCurrentSession().createQuery("delete Group where id =:id");
		query.setParameter("id", id);
		query.executeUpdate();	
	}

	public Group getGroupByCode(String code){
		Criteria cr = sf.getCurrentSession().createCriteria(Group.class);
		cr.add(Restrictions.eq("code", code));
		return (Group) (cr.list().size()>0?cr.list().get(0):null);
	}

	public Group getGroupByName(String name){
		Criteria cr = sf.getCurrentSession().createCriteria(Group.class);
		cr.add(Restrictions.eq("name", name));
		return (Group) (cr.list().size()>0?cr.list().get(0):null);
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getMenus(){
		Criteria cr = sf.getCurrentSession().createCriteria(Menu.class).addOrder(Order.asc("position")).addOrder(Order.desc("id"));	
		return (List<Object>) cr.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> searchMenu(String code, String url){
		String str = " from Menu m where 1=1";
		if(!code.isEmpty())
			str += " and m.code like '%"+code.replace("'", "''")+"%'";
		if(!url.isEmpty())
			str += " and m.url like '%"+url.replace("'", "''")+"%'";
		str += " order by id desc";
		Query q = sf.getCurrentSession().createQuery(str);
		return (List<Object>)q.list();
	}
	
	public Menu getMenuById(Integer id){
		return (Menu)sf.getCurrentSession().get(Menu.class, id);
	}
	
	public List<Object> getMenusByParent(){
		List<Object> menus = new ArrayList<Object>();
		for(Object obj : getMenus()){
			if(((Menu) obj).getParent()==null)
				menus.add(obj);
		}
		return menus;
	}
	public void saveMenu(Menu menu) throws HibernateException {
		try {
			if(menu.getId()==null){
				menu.setUuid(UUID.randomUUID().toString());
				sf.getCurrentSession().saveOrUpdate(menu);
			} else {
				Query q = sf.getCurrentSession().createQuery("update Menu set " +
					"code =:code, " +
					"position =:position, " +
					"url =:url, " +
					"path =:path, " +
					"parent_id =:parent_id " +
					"where id =:id");
				q.setString("code", menu.getCode()); 
				q.setInteger("position", menu.getPosition());
				q.setString("url", menu.getUrl());
				q.setString("path", menu.getPath());
				q.setInteger("parent_id", menu.getParent().getId());
				q.setInteger("id", menu.getId());
				q.executeUpdate();
			}
		} catch(HibernateException he){
			throw he;
		}
	}
	
	public void removeMenuById(Integer id) throws HibernateException {
		Query query = sf.getCurrentSession().createQuery("delete Menu where id =:id");
		query.setParameter("id", id);
		query.executeUpdate();	
	}

	public Menu getMenuByCode(String code){
		Criteria cr = sf.getCurrentSession().createCriteria(Menu.class);
		cr.add(Restrictions.eq("code", code));
		return (Menu) (cr.list().size()>0?cr.list().get(0):null);
	}

	public Menu getMenuByUrl(String url){
		Criteria cr = sf.getCurrentSession().createCriteria(Menu.class);
		cr.add(Restrictions.eq("url", url));
		return (Menu) (cr.list().size()>0?cr.list().get(0):null);
	}


}
