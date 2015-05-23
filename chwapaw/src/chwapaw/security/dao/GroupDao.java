package chwapaw.security.dao;

import java.util.List;

import org.hibernate.HibernateException;

import chwapaw.security.Group;
import chwapaw.security.Menu;

public interface GroupDao {

	public Group getDefaultGroup();
	
	public List<Menu> getAllMenus();
	
	public List<Menu> getMenusByGroup(Group group);
	
	public List<Menu> getMenuNullParentByGroup(Group group);
	
	public List<Menu> getChildrenByParent(Menu menu);
	
	public List<Object> getGroups();
	
	public List<Object> searchGroup(String name, String code);
	
	public Group getGroupById(Integer id);
	
	public void saveGroup(Group group) throws HibernateException;
	
	public void removeGroupById(Integer id) throws HibernateException; 
	
	public Group getGroupByCode(String code);
	
	public Group getGroupByName(String name);
	
	public void insertGroupMenu(List<Integer> menuIds, Group group) throws HibernateException;
	
    public List<Object> getMenus();
	
	public List<Object> searchMenu(String code, String url);
	
	public Menu getMenuById(Integer id);
	
	public List<Object> getMenusByParent();
	
	public void saveMenu(Menu menu) throws HibernateException;
	
	public void removeMenuById(Integer id) throws HibernateException; 
	
	public Menu getMenuByCode(String code);
	
	public Menu getMenuByUrl(String url);


}
