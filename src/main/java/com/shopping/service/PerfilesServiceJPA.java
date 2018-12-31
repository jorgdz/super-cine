package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.model.Perfil;
import com.shopping.repository.PerfilesRepository;

@Service
public class PerfilesServiceJPA implements IPerfilesService{

	@Autowired
	private PerfilesRepository perfilesRepo;
	
	public void save(Perfil perfil) {
		perfilesRepo.save(perfil);
	}

}
