package com.shopping.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="banners")
public class Banner {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String titulo;
	
	private String archivo;
	
	private Date fecha;
	
	private String estado;
	
	private String name_file;
	
	public String getName_file() {
		return name_file;
	}

	public void setName_file(String name_file) {
		this.name_file = name_file;
	}

	public Banner () {
		this.fecha = new Date();
		this.estado = "Activo";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getArchivo() {
		return archivo;
	}

	public void setArchivo(String archivo) {
		this.archivo = archivo;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Banner [id=" + id + ", titulo=" + titulo + ", archivo=" + archivo + ", fecha=" + fecha + ", estado="
				+ estado + ", name_file=" + name_file + "]";
	}	

}
