package com.capstone.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.capstone.model.Member;
import com.capstone.repository.UsersRepository;

@Component
public class UserDao {

	@Autowired
	private UsersRepository userRepo;
	
	public List<Member> findAllUser(){
		return null;
	}
	
	public Member findByID(String ID) {
		return null;
	}

	public boolean deleteUser(String ID) {
		return false;
	}
}
