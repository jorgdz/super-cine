package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.model.Noticia;
import com.shopping.service.INoticiasService;

@Controller
@RequestMapping(value="/noticias")
public class NoticiasController {
	
	@Autowired
	private INoticiasService serviceNoticias;
	
	
	@GetMapping(value="/paginate")
	public String index (Model model, Pageable page) {
		model.addAttribute("noticias", serviceNoticias.findAll(page));
		return "noticias/listNoticias";
	}
	
	@GetMapping(value="/create")
	public String create (@ModelAttribute Noticia noticia) {
		return "noticias/formNoticia";
	}
	
	@GetMapping(value="/edit/{id}")
	public String edit(@PathVariable("id")int id, Model model) {
		Noticia noticia = serviceNoticias.findById(id);
		model.addAttribute("noticia", noticia);
		return "noticias/formNoticia";
	}
	
	@PostMapping(value="/save")
	public String save (@ModelAttribute Noticia noticia, BindingResult br, RedirectAttributes ra) {	
		if (br.hasErrors()) {
			return "noticias/formNoticia";
		}
		
		serviceNoticias.save(noticia);	
		ra.addFlashAttribute("success", "Noticia guardada !!");
		
		return "redirect:/noticias/paginate";
	}
	
	@GetMapping(value="/destroy/{id}")
	public String destroy(@PathVariable("id") int id, RedirectAttributes ra) {
		serviceNoticias.delete(id);
		ra.addFlashAttribute("success", "Noticia borrada !!");
		return "redirect:/noticias/paginate";
	}
}
