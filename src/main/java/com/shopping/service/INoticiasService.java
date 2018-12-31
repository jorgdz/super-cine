package com.shopping.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shopping.model.Noticia;

public interface INoticiasService {
	
	Page<Noticia> findAll(Pageable page);
	
	void save (Noticia noticia); 
	
	Noticia findById(int id);
	
	void delete (int id);
	
	List<Noticia> findNewNoticias();
	
}
