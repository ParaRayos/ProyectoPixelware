package bsd.spring.mvc.controladores;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bsd.spring.mvc.modelo.UsuarioForm;
import bsd.spring.mvc.servicios.PaisesService;
import bsd.spring.mvc.servicios.PaisesServiceImpl;
import bsd.spring.mvc.servicios.UsuarioService;
import bsd.spring.mvc.servicios.UsuarioServiceImpl;

@Controller
public class FrontController {

	private static UsuarioService userService = new UsuarioServiceImpl();
	private static UsuarioForm userActual;
	private static PaisesService paisesService = new PaisesServiceImpl();

	public static UsuarioForm getUserActual() {
		return userActual;
	}

	/*
	 * Método de negocio asociado a peticiones /inicio.html con envio GET.
	 * 
	 * Devolvemos el nombre logico de la vista (login) y un atributo de peticion
	 * "usuario" de tipo UsuarioForm
	 */
	@RequestMapping(value = "/inicio.html", method = RequestMethod.GET)
	public ModelAndView generarLogin() {
		userActual = null;
		return new ModelAndView("login", "usuario", new UsuarioForm());
	}

	/*
	 * Método de negocio asociado a peticiones /verificarLogin.html con envio POST.
	 * 
	 * Enlazamos el atributo del modelo asociado al formulario usuario con el
	 * parámetro usuario del método
	 * 
	 * Devolvemos el nombre logico de la consulta del tiempo y un atributo de
	 * peticion "usuario" de tipo UsuarioForm si el usuario esta registrado
	 */
	@RequestMapping(value = "/consultaTiempo.html", method = RequestMethod.POST)
	public ModelAndView verificar(@ModelAttribute("usuario") UsuarioForm user) {
			if (user.getEmail().equals("") || user.getPass().equals("")) {
				return new ModelAndView("login", "mensaje", "Campos obligatorios no introducidos");
			}
			List<UsuarioForm> usu = userService.get();
			if (usu.isEmpty()) {
				return new ModelAndView("login", "mensaje", "No hay usuarios registrados, registre uno.");
			} else {
				for (UsuarioForm usuario : usu) {
					if (user.getEmail().equalsIgnoreCase(usuario.getEmail())
							&& user.getPass().equals(usuario.getPass())) {

						ModelAndView modelAndView = new ModelAndView("consulta");

						userActual = usuario;

						return modelAndView;
					}
				}
			}
			return new ModelAndView("login", "mensaje", "Credenciales introducidas incorrectas");
		}

	@RequestMapping(value = "/nuevoUsuario.html", method = RequestMethod.GET)
	public ModelAndView invRegForm() {

		ModelAndView modelAndView = new ModelAndView("usuarios", "usuarioForm", new UsuarioForm());

		modelAndView.addObject("paises", paisesService.obtenLista());

		return modelAndView;
	}

	@RequestMapping(value = "/registrar.html", method = RequestMethod.POST)
	public ModelAndView registraUser(@ModelAttribute("usuarioForm") UsuarioForm user) {
		if (user.getPass().equals(user.getConfirmPass())) {
			List<UsuarioForm> usu = userService.get();
			if (!usu.isEmpty()) {
				for (UsuarioForm usuario : usu) {
					if (user.getEmail().equalsIgnoreCase(usuario.getEmail())) {

						ModelAndView modelAndView = new ModelAndView("usuarios", "mensaje",
								"Error: el email introducido ya está registrado.");

						modelAndView.addObject("paises", paisesService.obtenLista());

						return modelAndView;
					}
				}
			}
		} else {
			ModelAndView modelAndView = new ModelAndView("usuarios", "mensaje",
					"Error: las contraseñas introducidas no coinciden.");

			modelAndView.addObject("paises", paisesService.obtenLista());

			return modelAndView;
		}
		userService.add(user);
		ModelAndView modelAndView = new ModelAndView("login", "usuario", new UsuarioForm());
		modelAndView.addObject("mensaje", "El registro del usuario ha finalizado correctamente.");
		return modelAndView;
	}

}
