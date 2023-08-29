package br.com.urlencurtador.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.com.urlencurtador.domain.Url;
import br.com.urlencurtador.service.UrlService;

@Controller
public class UrlController {
 
	
	@Autowired
	private UrlService urlService;

	@GetMapping(value = "/")
	public String telaIndex(Model model) {
		
		model.addAttribute("urls", urlService.obterLista());
		
		return "index";
	}	
	
	@PostMapping(value = "/url/incluir")
	public String incluir(Url url) {
		
		urlService.incluir(url);
		
		return "redirect:/";
	}
		
	@GetMapping(value = "/url/excluir/{id}")
	public String excluir(@PathVariable Long id) {

		urlService.excluir(id);

		return "redirect:/";
	}
}