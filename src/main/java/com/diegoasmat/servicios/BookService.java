package com.diegoasmat.servicios;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diegoasmat.modelos.Libro;
import com.diegoasmat.repositorios.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
	public List<Libro> getAllBooks() {
		return bookRepository.findAll();
	}
	
	public Libro getBookById(Long id) {
		Optional<Libro> libro = bookRepository.findById(id);
		if(libro.isPresent()) {
			return libro.get();
		}
		return null;
	}
	
	public Libro registerBook(Libro libro) {
		return bookRepository.save(libro);
	}
	
	public Libro updateBook(Libro libro) {
		Libro libroObtenido = getBookById(libro.getId());
		if(libroObtenido!=null) {
			return bookRepository.save(libro);
		}
		return null;
	}
	
	public void deleteBook(Long id) {
		bookRepository.deleteById(id);
	}
}
