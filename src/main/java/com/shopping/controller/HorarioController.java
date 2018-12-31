package com.shopping.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.model.Horario;
import com.shopping.model.Pelicula;
import com.shopping.service.IHorariosService;
import com.shopping.service.IPeliculasService;

@Controller
@RequestMapping(value="/horarios")
public class HorarioController {
	
	@Autowired
	private IPeliculasService servicePelicula;
		
	@Autowired
	private IHorariosService serviceHorario;
	
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	
	
	/**
	 * Personalizamos el Data Binding para todas las propiedades de tipo Date
	 * @param binder
	 */
	@InitBinder("horario")
	public void initBinder(WebDataBinder binder) {		
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	/************************************************************************/
	
	
	@GetMapping(value="/paginate")
	public String index (Pageable page, Model model) {	
		model.addAttribute("horarios", serviceHorario.findAll(page));
		return "horarios/listHorarios";	
	}
	
	
	@GetMapping(value="/create")
	public String create (@ModelAttribute Horario horario, Model model) {
		return "horarios/formHorario";
	}
	
	@PostMapping(value="/save")
	public String store (@ModelAttribute Horario horario, BindingResult br, Model model, RedirectAttributes ra) {
		if (br.hasErrors()) {
			return "horarios/formHorario";
		}
		
		serviceHorario.save(horario);
		ra.addFlashAttribute("success", "Horario guardado !!");
		
		return "redirect:/horarios/paginate";
	}
	
	@GetMapping(value="/edit/{id}")
	public String edit (@PathVariable("id") int id, Model model) {
		Horario horario = serviceHorario.findById(id);

		model.addAttribute("horario", horario);
		return "horarios/formHorario";
	}
	
	@GetMapping(value="/destroy/{id}")
	public String destroy(@PathVariable("id") int id, RedirectAttributes ra) {
		serviceHorario.delete(id);
		
		ra.addFlashAttribute("success", "Horario eliminado !!");
		return "redirect:/horarios/paginate";
	}
	
	/*@PostMapping(value="/search")
	public String search(@RequestParam("titulo") String titulo, @RequestParam("fecha") Date fecha, @RequestParam("hora") String hora, @RequestParam("sala") String sala, @RequestParam("precio") double precio, Model model, Pageable page) {
		model.addAttribute("horarios", serviceHorario.search(fecha, hora, sala, precio, titulo, page));
		return "horarios/listHorarios";
	}*/
	
	@ModelAttribute("peliculas")
	public List<Pelicula> getPeliculas (){
		List<Pelicula> peliculas = servicePelicula.getPeliculaActiva();
		return peliculas;
	}
	
	@ModelAttribute("salas")
	public List<String> getSalas () {
		List<String> lista = new LinkedList<String>();
		lista.add("Sala Premium");
		lista.add("Sala 1");
		lista.add("Sala 2");
		lista.add("Sala 3");
		return lista;
	}
}
