package net.andrews.FrontEnd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.andrews.BackEnd.dao.CategoryDAO;
import net.andrews.BackEnd.dto.Category;

@Controller
public class PageController {

	@Autowired
	private CategoryDAO categoryDAO;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");

		// Passing the list of Categories
		mv.addObject("categories", categoryDAO.list());

		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = { "/about" })
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = { "/contact" })
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact Us");
		mv.addObject("userClickContact", true);
		return mv;
	}

	/*
	 * Methods to load all the Products and based on Category
	 */

	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All products");

		// Passing the list of Categories
		mv.addObject("categories", categoryDAO.list());

		mv.addObject("userClickAllProducts", true);
		return mv;
	}

	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");

		// CategoryDAO to Fetch Single category
		Category category = null;
		category = categoryDAO.get(id);

		mv.addObject("title", category.getName());

		// Passing the list of Categories
		mv.addObject("categories", categoryDAO.list());

		// Passing the single category object
		mv.addObject("category", category);

		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}

	/* @RequestParam */
	// @RequestMapping(value="/test")
	// public ModelAndView test(@RequestParam(value="greeting",required=false)String
	// greeting) {
	// if(greeting == null)
	// {
	// greeting = "Welcome to Project";
	// }
	// ModelAndView mv=new ModelAndView("page");
	// mv.addObject("greeting",greeting);
	// return mv;

	// }

	/* @PathVariable */
	// @RequestMapping(value="/test/{greeting}")
	// public ModelAndView test(@PathVariable("greeting")String greeting) {
	// if(greeting == null)
	// {
	// greeting = "Welocome to Project";
	// }
	// ModelAndView mv=new ModelAndView("page");
	// mv.addObject("greeting",greeting);
	// return mv;

	// }
}
