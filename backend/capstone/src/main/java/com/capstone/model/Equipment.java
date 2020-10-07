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
public class Equipment {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (updatable = false, nullable = false, columnDefinition = "INT(11)", unique = true)
	private Long id;
	
	@Column (nullable = false, length = 100)
	private String name;
	
	@Column (nullable = false, length = 15)
	private String price;
	
	@Column (length = 15, default = "free")
	private String shipping_charge;
	
	@Column (length = 30)
	private String seller;
	
	@Column (nullable = false, length = 500)
	private String URL;

	@Column (nullable = false)
	@Enumerated(EnumType.STRING)
	private enum training_purpose{
		Weightloss,
		Muscleaugmentation,
		Bodytypecorrection
	}
}
