package com.capstone.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(schema = "Information")
public class Record {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (updatable = false, nullable = false, columnDefinition = "INT(11)", unique = true)
	private Long id;
	
	@Column (nullable = false)
	private Long challenge_id;
	
	@Column (nullable = false)
	@Temporal(TemporalType.DATE)
	private Date date;
	
	@Column (nullable = false, length = 10)
	private String result;
	
	@Column (nullable = false, length = 100)
	private String journal;

}
