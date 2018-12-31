package com.shopping.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shopping.model.Banner;

public interface IBannersService {
	
	List<Banner> getBannersMain();
	
	Page<Banner> getAll(Pageable page);
	
	void save(Banner banner);
	
	Banner findById (int id);
	
	void delete(int id);
}
