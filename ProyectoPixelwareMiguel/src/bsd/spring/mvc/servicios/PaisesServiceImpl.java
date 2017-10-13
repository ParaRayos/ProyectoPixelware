package bsd.spring.mvc.servicios;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

public class PaisesServiceImpl implements PaisesService {

	private Map<String, String> listaPaises = creaLista();

	@Override
	public Map<String, String> obtenLista() {
		return listaPaises;
	}

	private Map<String, String> creaLista() {

		String[] locales = Locale.getISOCountries();

		Map<String, String> listaPaises = new TreeMap<>();
		for (String countryCode : locales) {

			Locale obj = new Locale("", countryCode);

			listaPaises.put(obj.getISO3Country(), obj.getDisplayCountry());

		}
		return listaPaises;

	}

}
