package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.shopping.model.Usuario;
import com.shopping.repository.UsuariosRepository;

@Service
public class UsuariosServiceJPA implements IUsuariosService{
	
	@Autowired
	private UsuariosRepository usuariosRepo;
	
	public void save(Usuario usuario) {
		usuariosRepo.save(usuario);
	}

	public Page<Usuario> findAll(Pageable page) {
		return usuariosRepo.findAll(PageRequest.of(page.getPageNumber(), 4, Sort.by("id").descending()));
	}

	public void delete(int id) {
		usuariosRepo.deleteById(id);
	}

}
