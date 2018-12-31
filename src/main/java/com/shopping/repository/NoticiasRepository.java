package com.shopping.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shopping.model.Noticia;

@Repository
public interface NoticiasRepository extends JpaRepository<Noticia, Integer> {
	//Por default el nombre del bean repository extrae el nombre de la interface en camelCase
	
	List<Noticia> findByEstado(String estado);
	
	List<Noticia> findByFecha(Date fecha);
	
	List<Noticia> findByEstadoAndFecha(String estado, Date fecha);
	
	List<Noticia> findByEstadoOrFecha(String estado, Date fecha);
	
	//where fecha between ? and ?
	List<Noticia> findByFechaBetween(Date fecha1, Date fecha2);
	
	//Metodo implementado en la Home Page
	List<Noticia> findTop4ByEstadoOrderByFechaDesc(String estado);
}
