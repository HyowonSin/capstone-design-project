package com.capstone.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;



@Entity
@Table(schema = "Information")
public class Challenge {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (updatable = false, nullable = false, columnDefinition = "INT(11)", unique = true)
	private Long id;
	
	@Column (nullable = false)
	private Long member_id;
	
	@Column (nullable = false)
	@Enumerated(EnumType.STRING)
	private enum training_purpose{
		Weightloss,
		Muscleaugmentation,
		Bodytypecorrection
	}
	
	@Column (length = 100)
	private String challenge_goal;
	
	@Column (length = 100)
	private String training_to_do;
	
	@Column
	private Date start_date;
	
	@Column
	private Date end_date;
	
	@Enumerated(EnumType.STRING)
	private enum certification_day{
		Mon, Tue, Wed, Thu, Fri, Sat, Sun
	}
	
}
