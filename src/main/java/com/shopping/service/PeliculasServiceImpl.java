package com.shopping.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.data.domain.Page;

import com.shopping.model.Pelicula;

public class PeliculasServiceImpl implements IPeliculasService{
	
	private List<Pelicula> peliculas = null;
	
	public PeliculasServiceImpl () {
		//System.out.println("Creando una instancia de la clase PeliculasServiceImpl");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");	
		try {
			peliculas = new LinkedList<Pelicula>();
			Pelicula p1 = new Pelicula();
			p1.setId(1);
			p1.setTitulo("Power Rangers");
			p1.setDuracion(120);
			p1.setClasificacion("B");
			p1.setGenero("Aventura");
			p1.setFechaEstreno(dateFormat.parse("02-05-2017"));
			
			Pelicula p2 = new Pelicula();
			p2.setId(2);
			p2.setTitulo("La bella y la bestia");
			p2.setDuracion(132);
			p2.setClasificacion("A");
			p2.setGenero("Infantil");
			p2.setFechaEstreno(dateFormat.parse("20-05-2017"));
			p2.setImagen("estreno6.png");
			
			Pelicula p3 = new Pelicula();
			p3.setId(3);
			p3.setTitulo("ContraTiempo");
			p3.setDuracion(106);
			p3.setClasificacion("B");
			p3.setGenero("Thriller");
			p3.setFechaEstreno(dateFormat.parse("28-05-2017"));
			p3.setImagen("estreno3.png");
			
			Pelicula p4 = new Pelicula();
			p4.setId(4);
			p4.setTitulo("Kong La Isla Calavera");
			p4.setDuracion(118);
			p4.setClasificacion("B");
			p4.setGenero("Accion y Aventura");
			p4.setFechaEstreno(dateFormat.parse("06-06-2017"));
			p4.setImagen("estreno4.png");
			p4.setEstado("Inactiva");
			
			Pelicula p5 = new Pelicula();
			p5.setId(5);
			p5.setTitulo("Vida inteligente");
			p5.setDuracion(104);
			p5.setClasificacion("B");
			p5.setGenero("Drama");
			p5.setFechaEstreno(dateFormat.parse("10-06-2017"));
			p5.setImagen("estreno5.png");
			p5.setEstado("Inactiva");
			
			peliculas.add(p1);
			peliculas.add(p2);
			peliculas.add(p3);
			peliculas.add(p4);
			peliculas.add(p5);
			
		}catch(ParseException ex) {
			System.out.println("Error "+ ex.getMessage());
		}
	}
	
	
	public List<Pelicula> buscarTodas() {
		return this.peliculas;
	}


	public Pelicula buscarPorId(int id) {
		Pelicula pelicula = null;
		for (Pelicula p : peliculas) {
			if (p.getId() == id) {
				pelicula = p;
			}
		}
		return pelicula;
	}


	public void insertar(Pelicula pelicula) {
		this.peliculas.add(pelicula);
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
		// TODO Auto-generated method stub
		
	}


	public Page<Pelicula> buscarTodas(org.springframework.data.domain.Pageable page) {
		// TODO Auto-generated method stub
		return null;
	}


	public List<Pelicula> getAllByFecha(Date fecha) {
		// TODO Auto-generated method stub
		return null;
	}


	public List<Pelicula> getPeliculaActiva() {
		// TODO Auto-generated method stub
		return null;
	}


	

}
