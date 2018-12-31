package com.shopping.service;


import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.shopping.model.Horario;
import com.shopping.model.Pelicula;
import com.shopping.repository.HorariosRepository;
import com.shopping.repository.PeliculasRepository;

@Service
public class PeliculasServiceJPA implements IPeliculasService{
	
	@Autowired
	private PeliculasRepository peliculasRepo;
	
	@Autowired
	private HorariosRepository horarioRepo;
	
	public void insertar(Pelicula pelicula) {
		peliculasRepo.save(pelicula);
	}

	public List<Pelicula> buscarTodas() {
		return peliculasRepo.findAll();
	}

	public Pelicula buscarPorId(int id) {
		Optional<Pelicula> pelicula = peliculasRepo.findById(id);
		if (pelicula.isPresent()) {
			return pelicula.get();
		}
		return null;
	}
	
	
	public List<String> getGeneros() {
		List<String> generos = new LinkedList<String>();
		generos.add("Accion");
		generos.add("Aventura");
		generos.add("Clasicas");
		generos.add("Comedia Romantica");
		generos.add("Drama");
		generos.add("Terror");
		generos.add("Infantil");
		generos.add("Accion y Aventura");
		generos.add("Romantica");		
		return generos;
	}

	
	public void delete(int id) {
		peliculasRepo.deleteById(id);
	}

	
	public Page<Pelicula> buscarTodas(Pageable page) {
		return peliculasRepo.findAll(PageRequest.of(page.getPageNumber(), 5, Sort.by("id").descending()));
	}

	
	public List<Pelicula> getAllByFecha(Date fecha) {
		List<Pelicula> peliculas = new LinkedList<Pelicula>();
		try {
			List<Horario> horarios = horarioRepo.getAllPeliculasByFecha(fecha);		
			
			Iterator it = horarios.iterator();	
			while(it.hasNext()) {
				Object[] data = (Object[]) it.next();
				
				Pelicula pelicula = new Pelicula();
				pelicula.setId(Integer.parseInt(String.valueOf(data[0])));
				pelicula.setTitulo(String.valueOf(data[1]));
				pelicula.setDuracion(Integer.parseInt(String.valueOf(data[2])));
				pelicula.setClasificacion(String.valueOf(data[3]));
				pelicula.setGenero(String.valueOf(data[4]));
				pelicula.setImagen(String.valueOf(data[5]));
				pelicula.setEstado(String.valueOf(data[6]));
				
				peliculas.add(pelicula);
			}
			
		} catch (Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
		return peliculas;
	}

	
	public List<Pelicula> getPeliculaActiva() {		
		return peliculasRepo.findByEstadoOrderByIdDesc("Activa");
	}
	
}
