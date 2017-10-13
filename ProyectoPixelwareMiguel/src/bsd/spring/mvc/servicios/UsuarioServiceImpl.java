package bsd.spring.mvc.servicios;

import java.util.ArrayList;
import java.util.List;

import bsd.spring.mvc.modelo.UsuarioForm;

public class UsuarioServiceImpl implements UsuarioService {

	private static List<UsuarioForm> usuarios = new ArrayList<>();
	@Override
	public void add(UsuarioForm usuario) {
		usuarios.add(usuario);

	}

	@Override
	public List<UsuarioForm> get() {
		return usuarios;
	}

}
