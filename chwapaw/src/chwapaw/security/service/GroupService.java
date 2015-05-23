package chwapaw.security.service;

import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.springframework.transaction.annotation.Transactional;

import chwapaw.security.Group;
import chwapaw.security.Menu;

@Transactional
public interface GroupService {
	
	public List<Menu> getAllMenus();
	
	public List<Menu> getMenusByGroup(Group group);
	
	public Map<String, Object> getToolBar(String str, List<Object> objs);
	
	public List<Menu> getMenuNullParentByGroup(Group group);
	
	public List<Menu> getChildrenByParent(Menu menu);
	
	public List<Object> getGroups();
	
	public List<Object> searchGroup(String name, String code);
	
	public Map<String, Object> getToolBar(String str);
	
	public Group getGroupById(Integer id);
	
	public void saveGroup(Group group) throws HibernateException;
	
	public void removeGroupById(Integer id) throws HibernateException; 
	
	public Group getGroupByCode(String code);
	
	public Group getGroupByName(String name);
	
	public List<Object> getMenus();

	public List<Object> searchMenu(String code, String url);

	public Menu getMenuById(Integer id);
	
	public List<Object> getMenusByParent();

	public void saveMenu(Menu menu) throws HibernateException;

	public void removeMenuById(Integer id) throws HibernateException;

	public Menu getMenuByCode(String code);

	public Menu getMenuByUrl(String url);

	public void insertGroupMenu(List<Integer> menuIds, Group group) throws HibernateException;
}
