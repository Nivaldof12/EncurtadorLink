package br.com.urlencurtador.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.com.urlencurtador.domain.Url;

@Repository
public interface UrlRepository extends CrudRepository<Url, Long> {

}

