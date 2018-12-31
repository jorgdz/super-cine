package com.shopping.service;

import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;
import org.springframework.data.domain.Page;

import com.shopping.model.Pelicula;

public interface IPeliculasService {
	
	void insertar(Pelicula pelicula);
	
	List<Pelicula> buscarTodas();
	
	List<Pelicula> getPeliculaActiva();
	
	Page<Pelicula> buscarTodas(Pageable page);
	
	Pelicula buscarPorId (int id);
	
	List<String> getGeneros ();
	
	void delete(int id);
	
	List<Pelicula> getAllByFecha(Date fecha);
}
