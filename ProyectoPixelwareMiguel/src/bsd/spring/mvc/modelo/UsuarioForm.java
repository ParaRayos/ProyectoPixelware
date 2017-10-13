package bsd.spring.mvc.modelo;

public class UsuarioForm {

	private String email;
	private String pass;
	private String confirmPass;
	private String pais;
	private String fecha;

	public UsuarioForm() {
		this.email = "";
		this.pass = "";
		this.confirmPass = "";
		this.pais = "";
		this.fecha = "";
	}

	public UsuarioForm(String email, String pass, String pais, String confirmPass, String fecha) {
		this.email = email;
		this.pass = pass;
		this.confirmPass = confirmPass;
		this.pais = pais;
		this.fecha = fecha;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getConfirmPass() {
		return confirmPass;
	}

	public void setConfirmPass(String confirmPass) {
		this.confirmPass = confirmPass;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}


}
