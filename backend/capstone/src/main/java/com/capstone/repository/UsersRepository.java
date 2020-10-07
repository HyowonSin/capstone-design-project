package com.capstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.capstone.model.Member;

public interface UsersRepository extends JpaRepository<Member,String>{

}
