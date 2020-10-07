package com.capstone.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.capstone.dao.UserDao;
import com.capstone.model.Member;
import com.sun.jndi.toolkit.url.Uri;

@RestController
public class UserController {

	@Autowired
	private UserDao userDao; 
	
	
	@GetMapping("admin/user/{id}")
	@ResponseBody
	public Member findUserData(@RequestParam String id) {
		Member one = userDao.findByID(id);
		if(one == null) {
			throw new UserNotFoundException(String.format("ID[%s] not found", id));
		}
		
		return one;
	} 
	
	@GetMapping("admin/user")
	public List<Member> retrieveAllUser(){
		return userDao.findAllUser();
	}

	
	@DeleteMapping("admin/user/delete/{id}")
	public void deleteUserData(@RequestParam String id) {
		userDao.deleteUser(id);
	}

}
