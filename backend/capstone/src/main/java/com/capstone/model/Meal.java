package com.capstone.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Table(name = "meal", catalog = "data")
public class Meal {
	
	@Id
	private int id;
	
	private String name;

	private String serving;
	
	private String calory;
	
	private String carbohydrate;
	
	private String protein;
	
	private String fat;
	
	private String goal;
}
