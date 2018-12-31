package com.shopping.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.shopping.model.Horario;

public interface IHorariosService {

	void save (Horario horario);
	
	Page<Horario> findAll(Pageable page);
	
	List<Horario> findByIdPelicula (int id, Date fecha);
	
	Horario findById(int id);
	
	void delete(int id);
	
	
	Page<Horario> search(Date fecha, String hora, String sala, double precio, String titulo, Pageable page);
}
