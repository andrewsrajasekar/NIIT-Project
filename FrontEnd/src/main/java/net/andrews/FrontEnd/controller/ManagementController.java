package net.andrews.FrontEnd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.andrews.BackEnd.dao.CategoryDAO;
import net.andrews.BackEnd.dao.ProductDAO;
import net.andrews.BackEnd.dto.Category;
import net.andrews.BackEnd.dto.Product;
import net.andrews.FrontEnd.util.FileUploadUtility;
import net.andrews.FrontEnd.validator.ProductValidator;

@Controller
@RequestMapping("/manage")
public class ManagementController {

	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name="operation",required=false) String operation) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Manage Products");
		Product nproduct = new Product();

		// set few of the fields
		nproduct.setSupplierId(1);
		nproduct.setActive(true);

		mv.addObject("product", nproduct);
		if(operation!=null) {
			if(operation.equals("product")) {
				mv.addObject("message","Project Submitted Successfully!");
			}
			else if(operation.equals("category")) {
				mv.addObject("message","Category Submitted Successfully!");
			}
		}

		return mv;
	}
	
	@RequestMapping(value="/{id}/product",method=RequestMethod.GET)
	public ModelAndView showEditProduct(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Manage Products");
		//fetch product from the database
		Product nproduct = productDAO.get(id);
		//set the product fetch from database 
    	mv.addObject("product", nproduct);
		return mv;
	}	
	
	
	
	
	//handling product Submission
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mproduct,BindingResult results,Model model,
 			HttpServletRequest request) {
		//handle Image Validation for New Products
		if(mproduct.getId() == 0) {
		new ProductValidator().validate(mproduct,results);
		}
		else {
			if(!mproduct.getFile().getOriginalFilename().equals("")) {
				new ProductValidator().validate(mproduct,results); 
			}
		}
		
		
		//check if there are any Errors
		if(results.hasErrors()) {
			
			model.addAttribute("userClickManageProducts", true);
			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validation failed for Product Submission!");
			
			return "page";
		}
		
		logger.info(mproduct.toString());
		
		
		if(mproduct.getId() == 0) {
			//Create a new Product Record if id is 0
			productDAO.add(mproduct);
		}
		else {
			//update the Product if id is not 0
			productDAO.update(mproduct);
		}
		
		
		if(!mproduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request,mproduct.getFile(),mproduct.getCode());
		}
		
		return "redirect:/manage/products?operation=product";
	}

	@RequestMapping(value = "/product/{id}/activation",method=RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {
		//is going to fetch Product from Database
		Product product = productDAO.get(id);
		boolean isActive = product.isActive();
		//activating and deactivating based on the value of active field
		product.setActive(!product.isActive());
		//updating the product
		productDAO.update(product);
		
		
		return (isActive)? "You have Successfully Deactivated the product with id" + product.getId() 
		                   : "You have Successfully activated the product with id" + product.getId();
	}
	
	//to handle category submission
	@RequestMapping(value="/category", method=RequestMethod.POST)
	public String handleCategorySubmission(@ModelAttribute Category category) {
		//add the new Category
		categoryDAO.add(category);
		
		return "redirect:/manage/products?operation=category";
	}
	
	
	//Returning Categories for all the Request Mapping
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		return categoryDAO.list();
	}
	
	@ModelAttribute("category")
	public Category getCategory() {
		return new Category();
	}

}
