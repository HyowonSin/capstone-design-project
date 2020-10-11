package com.capstone.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.capstone.model.Video;

public interface VideoRepository extends JpaRepository<Video,String>{

}
