package com.diegoasmat.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.diegoasmat.modelos.Libro;

@Repository
public interface BookRepository extends CrudRepository<Libro, Long>{

	public List<Libro> findAll();
	
}
