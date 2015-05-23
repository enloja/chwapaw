package chwapaw.security;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class Obj extends IDUUID implements Serializable {

	private static final long serialVersionUID = 3884534838050777508L;

	@Column(name="name", length=45, unique=true, nullable=false)
	private String name;
	
	@Column(name="description", length=200)
	private String description;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
