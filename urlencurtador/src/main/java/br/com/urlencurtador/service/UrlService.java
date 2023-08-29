package br.com.urlencurtador.service;

import java.util.Collection;
import java.util.Random;

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
	
    public String generateRandomChars(int length) {
        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder randomChars = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(chars.length());
            randomChars.append(chars.charAt(index));
        }
        
        return randomChars.toString();
    }
    
    public String obterUrlOriginalPorShortUrl(String shortUrl) {
        Url url = urlRepository.findByShortUrl(shortUrl);
        
        if (url != null) {
            url.setAccessCount(url.getAccessCount() + 1);
            urlRepository.save(url);
            return url.getOriginalUrl();
        }
        
        return null;
    } 
}
