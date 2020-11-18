package com.capstone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.capstone.model.Video;

@Repository
public interface VideoRepository extends JpaRepository<Video, Integer>{

	public List<Video> findAllByGoal(String goal);
}
