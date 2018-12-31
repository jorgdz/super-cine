package com.shopping.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.model.Banner;
import com.shopping.model.Horario;
import com.shopping.model.Noticia;
import com.shopping.model.Pelicula;
import com.shopping.service.IBannersService;
import com.shopping.service.IHorariosService;
import com.shopping.service.INoticiasService;
import com.shopping.service.IPeliculasService;
import com.shopping.util.Utileria;

@Controller
public class HomeController {
		
	@Autowired
	private IPeliculasService servicePeliculas;
	
	@Autowired
	private IBannersService serviceBanner;
	
	@Autowired
	private IHorariosService serviceHorarios;
	
	@Autowired
	private INoticiasService serviceNoticias;
	
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {		
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	/*************************************************************************************/
	
	
	
	private static Log log = LogFactory.getLog(HomeController.class);
	
	
	
	@PostMapping(value="/search")
	public String buscar(@RequestParam("fecha") Date fecha, Model model) {
		List<String> listaFechas = Utileria.getNextDays(4);
		
		List<Pelicula> peliculas = servicePeliculas.getAllByFecha(fecha);
		
		model.addAttribute("fechas", listaFechas);
		model.addAttribute("fechaBusqueda", dateFormat.format(fecha));
		model.addAttribute("peliculas", peliculas);
		
		return "index";
	}
	
	@GetMapping(value="/")
	public String mostrarPrincipal (Model model) {	
		try {
			Date fechaSinHora = dateFormat.parse(dateFormat.format(new Date()));
			List<String> listaFechas = Utileria.getNextDays(4);
			
			//Devuelveme peliculas activas con horarios para el valor de fechaSinHora
			List<Pelicula> peliculas = servicePeliculas.getAllByFecha(fechaSinHora);
			
			log.info("doing something in HomeController / ");
			
			model.addAttribute("fechas", listaFechas);
			model.addAttribute("fechaBusqueda", dateFormat.format(new Date()));
			model.addAttribute("peliculas", peliculas);
		} catch (ParseException e) {
			System.out.println("Error en HomeController.mostraPrincipal: " + e.getMessage());
		}
		return "index";
	}
	
	
	//@GetMapping(value="/detail")
	//public String mostrarDetalle (@RequestParam("id") int idPelicula, @RequestParam("fecha") String fecha, Model model) {
	@GetMapping(value="/detail/{id}/{fecha}")
	public String mostrarDetalle (@PathVariable("id") int idPelicula, @PathVariable("fecha") Date fecha, Model model) {
		List<Horario> horarios = serviceHorarios.findByIdPelicula(idPelicula, fecha);
		
		model.addAttribute("horarios", horarios);
		model.addAttribute("fecha", dateFormat.format(fecha));
		model.addAttribute("pelicula", servicePeliculas.buscarPorId(idPelicula));
		
		return "detalle";
	}
	
	@GetMapping(value="/acerca")
	public String goAbout () {
		return "about";
	}
	
	@GetMapping(value="/login-form")
	public String login() {
		return "formLogin";
	}
	
	
	
	@ModelAttribute("noticias")
	public List<Noticia> getNoticias () {
		List<Noticia> noticias = serviceNoticias.findNewNoticias();
		return noticias;
	}	
	
	@ModelAttribute("banners")
	public List<Banner> getBanners () {
		List<Banner> banners = serviceBanner.getBannersMain();
		return banners;
	}
}
