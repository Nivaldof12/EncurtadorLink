package br.com.urlencurtador.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

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
        if (url.getShortUrl() == null || url.getShortUrl().isEmpty()) {
            // Gera uma string aleatória de 6 caracteres
            String randomChars = urlService.generateRandomChars(6);
            url.setShortUrl("http://localhost:8080/" + randomChars);
        } else {
            url.setShortUrl("http://localhost:8080/" + url.getShortUrl());
        }
        
        urlService.incluir(url);
        
        return "redirect:/";
    }
		
	@GetMapping(value = "/url/excluir/{id}")
	public String excluir(@PathVariable Long id) {

		urlService.excluir(id);

		return "redirect:/";
	}
	
    @GetMapping(value = "/{shortUrl}")
    public String redirecionar(@PathVariable String shortUrl, HttpServletResponse response) throws IOException {
        String originalUrl = urlService.obterUrlOriginalPorShortUrl("http://localhost:8080/" + shortUrl);

        if (originalUrl != null) {

            response.sendRedirect(originalUrl);
            return null;
        } else {
            return "redirect:/";
        }
    }
	
}