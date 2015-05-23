package chwapaw.security;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class IDUUID extends UUID implements Serializable {

	private static final long serialVersionUID = -8403402389531614710L;
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
