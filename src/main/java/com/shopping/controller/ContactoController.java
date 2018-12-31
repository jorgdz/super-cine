package com.shopping.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.shopping.model.Contacto;
import com.shopping.service.IPeliculasService;

@Controller
public class ContactoController {
	
	@Autowired
	private IPeliculasService servicePeliculas;
	
	@GetMapping(value="/contacto")
	public String index (@ModelAttribute Contacto contacto, Model model) {
		model.addAttribute("generos", servicePeliculas.getGeneros());
		model.addAttribute("tipos", this.getTipos());
		return "formContacto";
	}
	
	
	@PostMapping(value="/contacto")
	public String store(@ModelAttribute Contacto contacto) {		
		System.out.println(contacto);
		return "redirect:/contacto";
	}
	
	
	public List<String> getTipos() {
		List<String> lista = new LinkedList<String>();
		lista.add("Estrenos");
		lista.add("Promociones");
		lista.add("Noticias");
		lista.add("Preventas");
		return lista;
	}
}
