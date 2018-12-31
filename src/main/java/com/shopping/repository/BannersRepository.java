package com.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopping.model.Banner;

@Repository
public interface BannersRepository extends JpaRepository<Banner, Integer> {
	
	List<Banner> findByEstado(String estado);
}
