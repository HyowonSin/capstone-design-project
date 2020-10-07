package com.capstone.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;

@Entity
@Table(schema = "Data")
@AllArgsConstructor
@Data
public class Vedio {
	
	
	@Id
	private int id;
	
	@Column(length = 50)
	private String name;
	
	@Column(length = 100)
	private String title;
	
	@Column(length = 30)
	private String uploader;
	
	@Column(length = 500)
	private String URL;
	
	@Column (nullable = false)
	@Enumerated(EnumType.STRING)
	private enum training_purpose{
		Weightloss,
		Muscleaugmentation,
		Bodytypecorrection
	}
}
