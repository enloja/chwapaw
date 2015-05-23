package chwapaw.security.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import chwapaw.security.Group;
import chwapaw.security.Menu;
import chwapaw.security.dao.GroupDao;

@Service("groupService")
@Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDao gd;
	
	public List<Menu> getAllMenus() {
		return gd.getAllMenus();
	}
	
	public List<Menu> getMenusByGroup(Group group){
		return gd.getMenusByGroup(group);
	}
	
	public Map<String, Object> getToolBar(String str, List<Object> objs){
		String[] sections = str.split(",");
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("index", 1); //default index
		m.put("pagesize", 10); //default pagesize
		for(int i=0; i<sections.length; i++){
			if(sections[i].startsWith("NAV"))
				m.put("nav", sections[i].substring(4, 10));//NAV[RecordCount, First, Previous, Position, Next, Last]
			if(sections[i].startsWith("MOD"))
				m.put("odm", sections[i].substring(4, 6));//MOD[GoToPage, PageSize]
			if(sections[i].startsWith("CMD"))
				m.put("cmd", sections[i].substring(4, 14)); //CMD[Reset, Initialize, Delete, showHideSearch, Find, Print, Help, Post, Extract]
		}
		if(!objs.isEmpty()){
			m.put("list"+objs.get(0).getClass().getSimpleName(), objs);
			m.put("totalsize", objs.size());
			m.put("position", (int)Math.max(Math.ceil((double)objs.size()/10), 1));
		}
		return m;
	}
	
	public Map<String, Object> getToolBar(String str){
		return getToolBar(str, new ArrayList<Object>());
	}
	
	public List<Menu> getMenuNullParentByGroup(Group group){
		return gd.getMenuNullParentByGroup(group);
	}
	
	public List<Menu> getChildrenByParent(Menu menu){
		return gd.getChildrenByParent(menu);
	}
	
	public List<Object> getGroups(){
		return gd.getGroups();
	}
	
	public List<Object> searchGroup(String name, String code){
		return gd.searchGroup(name, code);
	}
	
	public Group getGroupById(Integer id){
		return gd.getGroupById(id);
	}
	
	public void saveGroup(Group group) throws HibernateException {
		gd.saveGroup(group);
	}
	
	public void removeGroupById(Integer id) throws HibernateException {
		gd.removeGroupById(id);
	}
	
	public Group getGroupByCode(String code){
		return gd.getGroupByCode(code);
	}
	
	public Group getGroupByName(String name){
		return gd.getGroupByName(name);
	}
	
	public List<Object> searchMenu(String code, String url){
		return gd.searchMenu(code, url);
	}
	
	public Menu getMenuById(Integer id){
		return gd.getMenuById(id);
	}
	
	public List<Object> getMenusByParent(){
		return gd.getMenusByParent();
	}
	
	public void saveMenu(Menu menu) throws HibernateException {
		gd.saveMenu(menu);
	}
	
	public void removeMenuById(Integer id) throws HibernateException {
		gd.removeMenuById(id);
	}
	
	public Menu getMenuByCode(String code){
		return gd.getMenuByCode(code);
	}
	
	public Menu getMenuByUrl(String url){
		return gd.getMenuByUrl(url);
	}
	public List<Object> getMenus() {
		return gd.getMenus();
	}
	
	@Transactional
	public void insertGroupMenu(List<Integer> menuIds, Group group) throws HibernateException{
		gd.insertGroupMenu(menuIds, group);
	}




}
