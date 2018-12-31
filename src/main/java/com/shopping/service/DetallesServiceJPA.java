package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.model.Detalle;
import com.shopping.repository.DetallesRepository;

@Service
public class DetallesServiceJPA implements IDetalleService{
	
	@Autowired
	private DetallesRepository detallesRepo;
	
	
	public void save(Detalle detalle) {
		detallesRepo.save(detalle);
	}


	public void delete(int id) {
		detallesRepo.deleteById(id);
	}

}
