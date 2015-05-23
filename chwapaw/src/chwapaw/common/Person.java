package chwapaw.common;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import chwapaw.security.IDUUID;

@Entity
@Table(name="person")
public class Person extends IDUUID implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name="firstname", length=45)
	private String firstname;
	
	@Column(name="lastname", length=45)
	private String lastname;
	
	@Column(name="gender", length=2)
	private String gender;

	
	@Transient
	private String fullname;

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getFullname(){
		return this.firstname+" "+this.lastname;
	}
}
