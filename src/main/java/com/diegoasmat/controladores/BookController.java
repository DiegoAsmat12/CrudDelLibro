package com.diegoasmat.controladores;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.diegoasmat.modelos.Libro;
import com.diegoasmat.servicios.BookService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	
	@GetMapping("/new")
	public String renderNewBookForm(@ModelAttribute("libro") Libro libro, HttpSession session) {
		if(session.getAttribute("id")!=null) {
			return "newBook.jsp";
		}
		return "redirect:/";
	}
	
	@PostMapping("") //El binding result debe estar pegado a libro!!
	public String registerBook(@Valid @ModelAttribute("libro")Libro libro, BindingResult result, HttpSession session) {
		if(session.getAttribute("id")!=null) {
			if(result.hasErrors()) {
				return "newBook.jsp";
			}
			bookService.registerBook(libro);
			return "redirect:/books";
		}
		return "redirect:/";
	}
	
	@GetMapping("/{libro_id}")
	public String showBook(Model model, HttpSession session, @PathVariable("libro_id")Long id) {
		if(session.getAttribute("id")!=null) {
			
			Libro libro = bookService.getBookById(id);
			model.addAttribute("libro", libro);

			return "book.jsp";
		}
		return "redirect:/";
	}
	
	@GetMapping("/{libro_id}/edit")
	public String renderEditBookForm(Model model, HttpSession session, @PathVariable("libro_id")Long id) {
		if(session.getAttribute("id")!=null) {
			Libro libro = bookService.getBookById(id);
			if(libro.getUser().getId()!= session.getAttribute("id")) {
				return "redirect:/books";
			}
			model.addAttribute("libro", libro);
			
			return "editBook.jsp";
		}
		return "redirect:/";
	}
	
	@PutMapping("/{libro_id}")
	public String editBook(Model model, HttpSession session, @Valid @ModelAttribute("libro") Libro libro, BindingResult result) {
		if(session.getAttribute("id")!=null) {
			if(result.hasErrors()) {
				return "editBook.jsp";
			}
			bookService.updateBook(libro);
			return "redirect:/books";
		}
		return "redirect:/";
	}
}
