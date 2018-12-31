package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.service.IBannersService;
import com.shopping.util.Utileria;
import com.shopping.model.Banner;

@Controller
@RequestMapping(value="/banners")
public class BannerController {
	
	@Autowired
	private IBannersService serviceBanner;
	
	
	@GetMapping(value="/paginate")
	public String index (Model model, Pageable page) {
		Page<Banner> banners = serviceBanner.getAll(page);
		model.addAttribute("banners", banners);
		return "banners/listBanners";
	}
	
	@GetMapping(value="/create")
	public String create (@ModelAttribute Banner banner) {
		return "banners/formBanner";
	}
	
	@PostMapping(value="/save")
	public String store (@ModelAttribute Banner banner, BindingResult br, RedirectAttributes ra, @RequestParam("bannerImagen") MultipartFile multipartBanner) {
		if (br.hasErrors()) {
			System.out.println("Error al crear un banner");
			return "banners/formBanner";
		}
		
		if (!multipartBanner.isEmpty()) {
			String name = Utileria.getNameImage(multipartBanner);
			String archivo = Utileria.guardarImagen(multipartBanner);
			banner.setName_file(name);
			banner.setArchivo(archivo);
		}
		
		serviceBanner.save(banner);
		
		ra.addFlashAttribute("success", "Banner guardado !!");
		return "redirect:/banners/paginate";
	}
	
	
	@GetMapping(value="/edit/{id}")
	public String edit (@PathVariable("id") int id, Model model) {
		Banner banner = serviceBanner.findById(id);
		model.addAttribute("banner", banner);
		return "banners/formBanner";
	}
	
	@GetMapping(value="/destroy/{id}")
	public String destroy(@PathVariable("id") int id, RedirectAttributes ra) {
		try {
			Banner banner = serviceBanner.findById(id);
			Utileria.borrarImagen("/" + banner.getName_file());
			serviceBanner.delete(id);
			
			ra.addFlashAttribute("success", "Se ha eliminado el Banner");	
			return "redirect:/banners/paginate";
		} catch (Exception e) {
			System.out.println("Error al borrar el recurso: " + e.getMessage());
			return "banners/listBanners";
		}
	}
	
}
