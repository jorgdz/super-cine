package com.shopping.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.model.Pelicula;
import com.shopping.service.IDetalleService;
import com.shopping.service.IPeliculasService;
import com.shopping.util.Utileria;

@Controller
@RequestMapping(value="/peliculas")
public class PeliculasController {
	
	@Autowired
	private IPeliculasService servicePeliculas;
	
	@Autowired
	private IDetalleService serviceDetalles;
	
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	
	
	/**Configuracion de formato de fecha para que acepte este formato y no el de mi SO**/
	/**Esto solo debo hacerlo cuando quiero aniadir fechas desde formularios**/
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	/**********************************************************************************/
	
	

	
	
	@GetMapping(value="/paginate")
	public String indexPaginate(Model model, Pageable page) {
		Page<Pelicula> peliculas = servicePeliculas.buscarTodas(page);
		model.addAttribute("peliculas", peliculas);
		return "peliculas/listPeliculas";
	}
	
	@GetMapping(value="/create")
	public String create (@ModelAttribute Pelicula pelicula, Model model) {
		return "peliculas/formPelicula";
	}	
	
	@PostMapping(value="/save")
	public String store (@ModelAttribute Pelicula pelicula, BindingResult result, RedirectAttributes ra, @RequestParam("archivoImagen") MultipartFile mpImagen) {
		/*for(ObjectError error : result.getAllErrors()) {
			System.out.println(error.getDefaultMessage());
		}*/
		if (result.hasErrors()) {
			System.out.println("Existieron errores");
			return "peliculas/formPelicula";
		}
		
		if(!mpImagen.isEmpty()) {
			String name = Utileria.getNameImage(mpImagen);
			String nombreImagen = Utileria.guardarImagen(mpImagen);
			pelicula.setName_image(name);
			pelicula.setImagen(nombreImagen);
		}
		
		serviceDetalles.save(pelicula.getDetalle());
		servicePeliculas.insertar(pelicula);
		
		ra.addFlashAttribute("success", "Pelicula guardada !!");
		
		//return "peliculas/formPelicula";
		return "redirect:/peliculas/paginate";
	}	
	
	@GetMapping(value="/edit/{id}")
	public String edit(@PathVariable("id") int id, Model model) {
		Pelicula pelicula = servicePeliculas.buscarPorId(id);
		model.addAttribute("pelicula", pelicula);
		return "peliculas/formPelicula";
	}
	
	@GetMapping(value="/destroy/{id}")
	public String destroy (@PathVariable("id") int id, RedirectAttributes ra) {
		Pelicula p = servicePeliculas.buscarPorId(id);
		
		servicePeliculas.delete(id);
		serviceDetalles.delete(p.getDetalle().getId());
		
		ra.addFlashAttribute("success", "Pelicula eliminada");
		return "redirect:/peliculas/paginate";
	}
	
	@ModelAttribute("generos")
	public List<String> getGeneros () {
		return servicePeliculas.getGeneros();
	}
}
