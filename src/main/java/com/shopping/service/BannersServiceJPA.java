package com.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.shopping.model.Banner;
import com.shopping.repository.BannersRepository;

@Service
public class BannersServiceJPA implements IBannersService{

	@Autowired
	private BannersRepository bannerRepo;
	
	public List<Banner> getBannersMain () {
		return bannerRepo.findByEstado("Activo");
	}
	
	public Page<Banner> getAll(Pageable page) {
		return bannerRepo.findAll(PageRequest.of(page.getPageNumber(), 5, Sort.by("id").descending()));
	}

	public void save(Banner banner) {
		bannerRepo.save(banner);
	}

	public Banner findById(int id) {
		Optional<Banner> banner = bannerRepo.findById(id);
		if (banner.isPresent()) {
			return banner.get();
		}
		return null;
	}

	public void delete(int id) {
		bannerRepo.deleteById(id);
	}

}
