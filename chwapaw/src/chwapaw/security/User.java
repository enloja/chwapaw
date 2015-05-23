package chwapaw.security;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import chwapaw.common.Image;
import chwapaw.common.Person;
import chwapaw.common.Status;

@Entity
@Table(name="users")
public class User extends HistObj implements Serializable, UserDetails {

	private static final long serialVersionUID = 1L;
	
	@Column(name="username", length=45, unique=true, nullable=false)
	private String username;
	
	@Column(name="password", length=45, nullable=false)
	private String password;
	
	@ManyToOne
	@JoinColumn(name="person_id")
	private Person person;		

	@ManyToOne
	@JoinColumn(name="groups_id")
	private Group group;
	
	@ManyToOne
	@JoinColumn(name="image")
	private Image image;
	
	@Column(name="date", nullable=false)
	private Date date;
	
	@Column(name="authentificationtime", nullable=false)
	private Date authentifiactionTime;
	
	@Column(name="userkey", length=45, nullable=false)
	private String userkey;
	
	@Column(name="ip", length=45, nullable=false)
	private String ip;
	
	@Column(name="port", length=11, nullable=false)
	private Integer port;
	
	@Column(name="status")
	private Integer status; //user status may be active, pending or inactive managed by the ehis

	
	@Column(name="email", length=45, unique=true, nullable=false)
	private String email;	
	
	@Column(name="language", length=2)
	private String language; 	
	
	@Transient
	private String preferredLanguage;
		

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Person getPerson() {
		return person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	

	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getAuthentifiactionTime() {
		return authentifiactionTime;
	}

	public void setAuthetifiactionTime(Date authentifiactionTime) {
		this.authentifiactionTime = authentifiactionTime;
	}

	public String getUserkey() {
		return userkey;
	}

	public void setUserkey(String userkey) {
		this.userkey = userkey;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Integer getPort() {
		return port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
	public String getPreferredLanguage(){
		if("en".equals(language))
			return "English";
		else if("fr".equals(language))
			return "Francais";
		else
			return "Kreyol";
	}
	


	public Collection<GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> ga = new ArrayList<GrantedAuthority>(); 
		ga.add(group);
		return ga;
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		boolean b = false;
		if(Status.actif.equals(status))
			b = true;
		return b;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		boolean b = false;
		Integer defaultGroup = 2; //no pending user will access the system
		if(!defaultGroup.equals(group.getId()))
			b  = true;
		return b;
	}

}
