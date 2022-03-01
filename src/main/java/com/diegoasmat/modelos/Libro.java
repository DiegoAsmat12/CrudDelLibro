package com.diegoasmat.modelos;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "libros")
public class Libro {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "El titulo no puede estar vacío")
	@Size(min = 3,max = 100,message = "El titulo debe tener mínimo 3 caracteres y máximo 100")
	private String titulo;
	
	@NotBlank(message = "El autor no puede estar vacío")
	@Size(min = 3,max = 100,message = "El autor debe tener mínimo 3 caracteres y máximo 100")
	private String autor;
	
	@NotBlank(message = "El pensamiento no puede estar vacío")
	@Lob
	@Size(min = 5,message = "El pensamiento debe tener mínimo 5 caracteres")
	private String pensamiento;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user;
	
	public Libro() {
		
	}
	
	public Libro(String titulo, String autor, String pensamiento) {
		this.titulo=titulo;
		this.autor=autor;
		this.pensamiento=pensamiento;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getPensamiento() {
		return pensamiento;
	}

	public void setPensamiento(String pensamiento) {
		this.pensamiento = pensamiento;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
