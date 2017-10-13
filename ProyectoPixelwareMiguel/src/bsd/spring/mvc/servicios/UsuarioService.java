package bsd.spring.mvc.servicios;

import java.util.List;

import bsd.spring.mvc.modelo.UsuarioForm;

public interface UsuarioService {

	void add(UsuarioForm usuario);
	
	List<UsuarioForm> get();
	
}
