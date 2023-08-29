package br.com.urlencurtador.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.urlencurtador.domain.Url;
import br.com.urlencurtador.repository.UrlRepository;

@Service
public class UrlService {

	@Autowired
	private UrlRepository urlRepository;

	public Url incluir(Url url) {
		return urlRepository.save(url);
	}
	
	public void excluir(Long id) {
		urlRepository.deleteById(id);
	}
	
	public Collection<Url> obterLista(){
		return (Collection<Url>) urlRepository.findAll();
	}
}
