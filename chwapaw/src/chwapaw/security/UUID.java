package chwapaw.security;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class UUID implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="uuid", nullable=false)
	private String uuid;

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	
}
