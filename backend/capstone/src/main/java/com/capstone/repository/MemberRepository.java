package com.capstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.capstone.model.Member;

public interface MemberRepository extends JpaRepository<Member,String>{

}
