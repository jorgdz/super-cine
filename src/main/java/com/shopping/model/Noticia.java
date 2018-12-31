package com.shopping.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="noticias")
public class Noticia {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="titulo",length=255,nullable=false)
	private String titulo;
	
	private Date fecha;
	
	private String detalle;
	
	private String estado;
	
	public Noticia() {
		this.fecha = new Date();
		this.estado = "Activa";
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

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getDetalle() {
		return detalle;
	}

	public void setDetalle(String detalle) {
		System.out.println("Set Detalle");
		this.detalle = detalle;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		System.out.println("Set Status");
		this.estado = estado;
	}

	@Override
	public String toString() {
		return "Noticia [id=" + id + ", titulo=" + titulo + ", fecha=" + fecha + ", detalle=" + detalle + ", estado="
				+ estado + "]";
	}
	
}
