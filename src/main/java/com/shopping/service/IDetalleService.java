package com.shopping.service;

import com.shopping.model.Detalle;

public interface IDetalleService {
	
	void save (Detalle detalle);
	
	void delete(int id);
}
