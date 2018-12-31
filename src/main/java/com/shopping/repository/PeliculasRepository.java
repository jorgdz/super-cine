package com.shopping.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopping.model.Pelicula;

@Repository
public interface PeliculasRepository extends JpaRepository<Pelicula, Integer> {
	
	List<Pelicula> findByEstadoOrderByIdDesc (String estado);
	
}
