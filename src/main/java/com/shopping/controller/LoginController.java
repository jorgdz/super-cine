package com.shopping.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/admin")
public class LoginController {
	
	@GetMapping(value="/index")
	public String home(Authentication auth) {
		System.out.println("Username: " + auth.getName());
		for(GrantedAuthority rol : auth.getAuthorities()){
			System.out.println("ROL: " + rol.getAuthority());
		}
		return "admin";
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request){
		SecurityContextLogoutHandler logoutHandler = new SecurityContextLogoutHandler();
		logoutHandler.logout(request, null, null);
		return "redirect:/login-form";
	}
	
}
