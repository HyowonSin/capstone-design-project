package com.capstone;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaMain {
	
	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("capstone");
	
		EntityManager em = emf.createEntityManager();
		
		//code
		
		em.close();
		
		emf.close();
	
		
	}
}
