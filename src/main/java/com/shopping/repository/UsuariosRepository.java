package com.shopping.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shopping.model.Usuario;

public interface UsuariosRepository extends JpaRepository<Usuario, Integer> {

}
