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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="menu")
public class Menu extends IDUUID implements Serializable {

	private static final long serialVersionUID = 4704255620800523506L;
	
	@Column(name="code", length=100, nullable=false, unique=true)
	private String code;
	
	@Column(name="url", length=200)
	private String url;
	
	@Column(name="path", length=100)
	private String path;
	
	@Column(name="position", length=5, nullable=false)
	private Integer position;
	
	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="parent_id")
	private Menu parent;
	
	@OneToMany(mappedBy="parent")
    private Set<Menu> children = new HashSet<Menu>();
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(name="group_menu", joinColumns={@JoinColumn(name="menu_id")}, 
	           inverseJoinColumns={@JoinColumn(name="group_id")})
	private Set<Group> groups = new HashSet<Group>();

	public Set<Group> getGroups() {
		return groups;
	}

	public void setGroups(Set<Group> groups) {
		this.groups = groups;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Menu getParent() {
		return parent;
	}

	public void setParent(Menu parent) {
		this.parent = parent;
	}

	public Set<Menu> getChildren() {
		return children;
	}

	public void setChildren(Set<Menu> children) {
		this.children = children;
	}

}
