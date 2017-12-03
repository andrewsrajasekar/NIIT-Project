package net.andrews.BackEnd.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.andrews.BackEnd.dao.CategoryDAO;
import net.andrews.BackEnd.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.andrews.BackEnd");
		context.refresh();
		
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	}
	
	
	
	/*@Test
	public void testAddCategory() {
		category = new Category();
		category.setName("Mobile Phones");
		category.setDescription("This is the Description For Mobile Phones");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Category Added Inside the Table Successfully!",true,categoryDAO.add(category));
		
		
	}*/
/*	@Test
	public void testGetCategory() {
		
		category = categoryDAO.get(1);
		assertEquals("Fetched a Single Category From the Table Successfully!","Mobile Phones",category.getName());
	}
	*/
/*		@Test
	public void testUpdateCategory() {
		
		category = categoryDAO.get(1);
		category.setName("Mobiles");
		assertEquals("Updated a Single Category in the Table Successfully!",true,categoryDAO.update(category));
	}
*/
/*		@Test
	public void testDeleteCategory() {
		
		category = categoryDAO.get(1);
		assertEquals("Deleted a Single Category in the Table Successfully!",true,categoryDAO.delete(category));
	}
*/
/*		@Test
	public void testListCategory() {
		
		assertEquals("Fetched a list of Categories from the Table Successfully!",0,categoryDAO.list().size());
	}
*/
	@Test
	public void testCRUDCategory() { 
		//add Operation
		category = new Category();
		category.setName("Mobile Phones");
		category.setDescription("This is the Description For Mobile Phones");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Category Added Inside the Table Successfully!",true,categoryDAO.add(category));
		category = new Category();
		category.setName("Mobile Phone Accessories");
		category.setDescription("This is the Description For Mobile Phone Accessories");
		category.setImageURL("CAT_2.png");
		
		assertEquals("Category Added Inside the Table Successfully!",true,categoryDAO.add(category));
		
		//Fetching and Updating the Category
		category = categoryDAO.get(2);
		category.setName("Mobiles");
		assertEquals("Updated a Single Category in the Table Successfully!",true,categoryDAO.update(category));
		
	    //delete the Category
		assertEquals("Deleted a Single Category in the Table Successfully!",true,categoryDAO.delete(category));
	
	    //Fetching The list of Categories
		assertEquals("Fetched a list of Categories from the Table Successfully!",1,categoryDAO.list().size());
	
	
	
	}
	
	
	
	
	
	
	
	}


	
	
	
	

