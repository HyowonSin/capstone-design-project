package com.capstone.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;

@Entity
@Table(schema = "Data")
@AllArgsConstructor
@Data
public class Meal {
	
	
	
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (updatable = false, nullable = false, columnDefinition = "INT(11)", unique = true)
	private Long id;
	
	@Column (nullable = false, length = 50)
	private String name;
	
	@Column (length = 10)
	private String serving_size;
	
	@Column (length = 10)
	private String calory;
	
	@Column (length = 10)
	private String carbohydrate;
	
	@Column (length = 10)
	private String protein;
	
	@Column (length = 10)
	private String fat;
	
	@Column (nullable = false)
	@Enumerated(EnumType.STRING)
	private enum training_purpose{
		Weightloss,
		Muscleaugmentation,
		Bodytypecorrection
	}
}
