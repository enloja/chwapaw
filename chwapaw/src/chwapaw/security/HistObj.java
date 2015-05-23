package chwapaw.security;

import java.io.Serializable;
import java.text.ParseException;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import chwapaw.security.User;

@MappedSuperclass
public class HistObj extends IDUUID implements Serializable {

	private static final long serialVersionUID = 449362033672495493L;
	
	@ManyToOne
	@JoinColumn(name="created_by", nullable=false)
	private User createdBy;
	
	@Column(name="created_date", length=19, nullable=false)
	private Date createdDate;
	

	public User getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() throws ParseException {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

}
