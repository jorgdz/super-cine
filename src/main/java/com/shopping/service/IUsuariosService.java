package com.shopping.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shopping.model.Usuario;

public interface IUsuariosService {
	
	void save(Usuario usuario);
	
	Page<Usuario> findAll(Pageable page);
	
	void delete(int id);
}
