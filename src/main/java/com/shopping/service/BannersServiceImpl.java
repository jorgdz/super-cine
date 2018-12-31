package com.shopping.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shopping.model.Banner;

public class BannersServiceImpl implements IBannersService{
	
	private List<Banner> banners = null;
	
	public BannersServiceImpl () {
		try {
			banners = new LinkedList<Banner>();
			
			Banner b1 = new Banner();
			b1.setId(1);
			b1.setTitulo("Logan");
			b1.setArchivo("slide1.jpg");
			
			Banner b2 = new Banner();
			b2.setId(2);
			b2.setTitulo("La bella y la Bestia");
			b2.setArchivo("slide2.jpg");
			
			Banner b3 = new Banner();
			b3.setId(3);
			b3.setTitulo("Spiderman HomeComing");
			b3.setArchivo("slide3.jpg");
			
			banners.add(b1);	
			banners.add(b2);
			banners.add(b3);
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public void save(Banner banner) {
		this.banners.add(banner);
	}

	public Page<Banner> getAll(Pageable page) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Banner> getBannersMain() {
		return this.banners;
	}

	public Banner findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

}
