package com.shopping.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.shopping.model.Horario;
import com.shopping.repository.HorariosRepository;

@Service
public class HorariosServiceImpl implements IHorariosService{
	
	@Autowired
	private HorariosRepository horarioRepo;
	
	public void save(Horario horario) {
		horarioRepo.save(horario);
	}

	public List<Horario> findByIdPelicula(int id, Date fecha) {
		return horarioRepo.findByPelicula_IdAndFechaOrderByHora(id, fecha);
		//return horarioRepo.findByPelicula_IdAndPelicula_ClasificacionAndFechaOrderByHora(id, "B", fecha);
	}

	public Page<Horario> findAll(Pageable page) {
		return horarioRepo.findAll(PageRequest.of(page.getPageNumber(), 5, Sort.by("fecha").descending()));
	}

	public Horario findById(int id) {
		Optional<Horario> horario = horarioRepo.findById(id);
		if (horario.isPresent()) {
			return horario.get();
		}
		return null;
	}

	public void delete(int id) {
		horarioRepo.deleteById(id);
	}

	public Page<Horario> search(Date fecha, String hora, String sala, double precio, String titulo, Pageable page) {
		return horarioRepo.findByFechaLikeOrHoraLikeOrSalaLikeOrPrecioLikeOrPelicula_TituloLike(fecha, hora, 
				sala, precio, titulo, PageRequest.of(page.getPageNumber(), 5, Sort.by("fecha").descending()));
	}

}
