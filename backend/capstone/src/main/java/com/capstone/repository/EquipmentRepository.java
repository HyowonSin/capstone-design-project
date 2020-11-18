package com.capstone.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.capstone.model.Equipment;

@Repository
public interface EquipmentRepository extends JpaRepository<Equipment, Integer> {

	List<Equipment> findAllByGoal(String goal);
	
}
 