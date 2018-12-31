package com.shopping.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.shopping.model.Horario;

@Repository
public interface HorariosRepository extends JpaRepository<Horario, Integer> {
	
	List<Horario> findByPelicula_IdAndFechaOrderByHora(int id, Date fecha);
	
	List<Horario> findByPelicula_IdAndPelicula_ClasificacionAndFechaOrderByHora(int id, String clasificacion, Date fecha);
		
	/*
	 * 	select p.id, p.titulo, p.duracion, p.clasificacion, p.genero, p.imagen, 
		p.fecha_estreno from horarios h join peliculas p on h.id_pelicula=p.id 
		where p.estado='Activa' and h.fecha='2018-12-21' 
		group by p.id order by p.id desc;
	 * */
	
	@Query("SELECT h.pelicula.id, h.pelicula.titulo, h.pelicula.duracion, h.pelicula.clasificacion, h.pelicula.genero, h.pelicula.imagen, "
			+ "h.pelicula.estado FROM Horario h where h.fecha = :fecha_horario and pelicula.estado='Activa' GROUP BY h.pelicula.id, "
			+ "h.pelicula.titulo, h.pelicula.duracion, h.pelicula.clasificacion, h.pelicula.genero, h.pelicula.imagen, h.pelicula.estado "
			+ "ORDER BY pelicula.id DESC")
	List<Horario> getAllPeliculasByFecha(@Param("fecha_horario") Date fecha);
	
	
	List<Horario> findByFechaContaining(Date fecha, Pageable page);
	
	List<Horario> findByHoraContaining(String hora, Pageable page);
	
	List<Horario> findBySalaContaining(String sala, Pageable page);
	
	List<Horario> findByPrecioContaining(double precio, Pageable page);	
	
	List<Horario> findByPelicula_TituloContaining(String titulo, Pageable page);
	
	List<Horario> findByPelicula_IdLike(int pelicula_id, Pageable page);
	
	Page<Horario> findByFechaLikeOrHoraLikeOrSalaLikeOrPrecioLikeOrPelicula_TituloLike(Date fecha, String hora, String sala, double precio, String titulo, Pageable page);
}
