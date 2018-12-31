package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shopping.model.Perfil;
import com.shopping.model.Usuario;
import com.shopping.service.IPerfilesService;
import com.shopping.service.IUsuariosService;

@Controller
@RequestMapping(value="/usuarios")
public class UsuariosController {
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Autowired
	private IUsuariosService serviceUsuarios;
	
	@Autowired
	private IPerfilesService servicePerfiles;
	
	@GetMapping(value="/index")
	public String index (Model model, Pageable page) {
		Page<Usuario> usuarios = serviceUsuarios.findAll(page);
		model.addAttribute("usuarios", usuarios);
		return "usuarios/listUsuarios";
	}

	@GetMapping(value="/create")
	public String create (@ModelAttribute Usuario usuario) {
		return "usuarios/formUsuario";
	}
	
	@PostMapping(value="/save")
	public String save (@ModelAttribute Usuario usuario, BindingResult br, @RequestParam("perfil") String perfil, RedirectAttributes ra) {
		
		if (br.hasErrors()) {
			return "usuarios/formUsuario";
		}
		
		String tmpPass = usuario.getPwd();
		String encriptado = encoder.encode(tmpPass);
		usuario.setPwd(encriptado);
		usuario.setActivo(true);
		
		serviceUsuarios.save(usuario);
		
		Perfil perfilTmp = new Perfil();
		perfilTmp.setCuenta(usuario.getCuenta());
		perfilTmp.setPerfil(perfil);
		servicePerfiles.save(perfilTmp);
		
		ra.addFlashAttribute("success", "Usuario creado !!");
		return "redirect:/usuarios/index";
	}
	
	@GetMapping(value="/destroy/{id}")
	public String destroy(@PathVariable("id") int id, RedirectAttributes ra) {
		serviceUsuarios.delete(id);
		
		ra.addFlashAttribute("success", "Usuario eliminado !!");
		return "redirect:/usuarios/index";
	}
	
}
