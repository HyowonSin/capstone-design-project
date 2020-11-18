package com.capstone.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "member", catalog = "data")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (updatable = false, nullable = false, columnDefinition = "INT(11)", unique = true)
	private int id;
	
	@Column (nullable = false, length = 50, unique = true)
	private String email;
	
	@Column (nullable = false, length = 30)
	private String name;
	
	@Column (nullable = false, length = 30)
	private String password;
	
	@Column
	private String goal;
	/*
	@OneToMany(mappedBy = "member", targetEntity= Challenge.class)
	private List<Challenge> challenge; // 한명의 멤버가 여러개의 챌린지 저장 : 리스트 사용
	
	public	Member(int id, String email, String name, String password, String goal)	// 생성자?
	{
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.goal = goal;
	}
	*/
}
	//@OneToMany(mappedBy = "member")
	//private List<Challenge> challenge = new ArrayList<Challenge>();
	
	