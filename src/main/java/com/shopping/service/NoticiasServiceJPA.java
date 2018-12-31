package com.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import com.shopping.model.Noticia;
import com.shopping.repository.NoticiasRepository;

@Service
public class NoticiasServiceJPA implements INoticiasService{
	
	@Autowired
	private NoticiasRepository noticiasRepo;
	
	public void save(Noticia noticia) {
		noticiasRepo.save(noticia);
	}

	public List<Noticia> findNewNoticias() {		
		return noticiasRepo.findTop4ByEstadoOrderByFechaDesc("Activa");
	}

	public Page<Noticia> findAll(Pageable page) {
		return noticiasRepo.findAll(PageRequest.of(page.getPageNumber(), 7, Sort.by("fecha").descending()));
	}

	public Noticia findById(int id) {
		Optional<Noticia> noticia = noticiasRepo.findById(id);
		if (noticia.isPresent()) {
			return noticia.get();
		}
		return null;
	}

	public void delete(int id) {
		noticiasRepo.deleteById(id);
	}
	
}
