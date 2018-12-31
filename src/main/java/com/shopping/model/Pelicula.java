package com.shopping.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="peliculas")
public class Pelicula {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String titulo;
	
	private int duracion=100;
	
	private String clasificacion="B";
	
	private String genero;
	
	private String imagen = "https://dl.dropboxusercontent.com/s/xpktn5unq1g93d9/cinema.png?dl=0"; //imagen por default
	
	private String name_image = "cinema.png";
	
	@Column(name="fecha_estreno")
	private Date fechaEstreno;
	
	private String estado = "Activa";
	
	//@Transient  //Ignora este atributo durante la persistencia
	@OneToOne
	@JoinColumn(name="id_detalle")
	private Detalle detalle;
	
	@OneToMany(mappedBy="pelicula", fetch=FetchType.EAGER)
	private List<Horario> horarios;
	
	
	public Pelicula() {	}
	
	public Detalle getDetalle() {
		return detalle;
	}

	public void setDetalle(Detalle detalle) {
		this.detalle = detalle;
	}

	public int getId() {
		return id;
	}
	
	public String getName_image() {
		return name_image;
	}

	public void setName_image(String name_image) {
		this.name_image = name_image;
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

	public int getDuracion() {
		return duracion;
	}

	public void setDuracion(int duracion) {
		this.duracion = duracion;
	}

	public String getClasificacion() {
		return clasificacion;
	}

	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public Date getFechaEstreno() {
		return fechaEstreno;
	}

	public void setFechaEstreno(Date fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	
	public List<Horario> getHorarios() {
		return horarios;
	}

	public void setHorarios(List<Horario> horarios) {
		this.horarios = horarios;
	}

	@Override
	public String toString() {
		return "Pelicula [id=" + id + ", titulo=" + titulo + ", duracion=" + duracion + ", clasificacion="
				+ clasificacion + ", genero=" + genero + ", imagen=" + imagen + ", name_image=" + name_image
				+ ", fechaEstreno=" + fechaEstreno + ", estado=" + estado + ", detalle=" + detalle + "]";
	}
	
}
