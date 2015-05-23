package chwapaw.security;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.security.core.GrantedAuthority;

import chwapaw.security.Menu;

@Entity
@Table(name="groups")
public class Group extends Obj implements Serializable, GrantedAuthority {

	private static final long serialVersionUID = 1L;
	
	@Column(name="code", length=45, nullable=false)
	private String code;
	
	@Column(name="pass_exp_limit", length=3)
	private Integer limit;
	 
	@Column(name="default_page", length=200, nullable=false)
	private String viewer;
	
	@ManyToMany(cascade=CascadeType.ALL)
	@LazyCollection(LazyCollectionOption.FALSE)
	@JoinTable(name="group_menu", joinColumns={@JoinColumn(name="group_id")}, 
	           inverseJoinColumns={@JoinColumn(name="menu_id")})
	private Set<Menu> menus = new HashSet<Menu>();

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public String getViewer() {
		return viewer;
	}

	public void setViewer(String viewer) {
		this.viewer = viewer;
	}

	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}	

	public String getAuthority() {
		return code;
	}	

}
