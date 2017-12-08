package net.andrews.BackEnd.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.andrews.BackEnd.dao.UserDAO;
import net.andrews.BackEnd.dto.Address;
import net.andrews.BackEnd.dto.Cart;
import net.andrews.BackEnd.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;
	
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.andrews.BackEnd");
		context.refresh();
		
		userDAO = (UserDAO) context.getBean("userDAO");
	}
	

/*	@Test
	public void testAdd() {
		
		user = new User() ;
		user.setFirstName("Ramachandran");
		user.setLastName("Mani");
		user.setEmail("ramamani@gmail.com");
		user.setContactNumber("9167987654");
		user.setRole("USER");
		user.setPassword("123456");
		
		//add the user
		assertEquals("Failed to add user!",true,userDAO.addUser(user));
		
		address = new Address();
		address.setAddressLineOne("Konami Street");
		address.setAddressLineTwo("EA Nagar");
		address.setCity("Chennai");
		address.setState("TamilNadu");
		address.setCountry("India");
		address.setPostalCode("600075");
		address.setBilling(true);
		
		//link the user with the address using user id
		address.setUserId(user.getId());
		
		//add the address
		assertEquals("Failed to add address!",true,userDAO.addAddress(address));
		
		if(user.getRole().equals("USER")) {
			//create a cart for this user
			cart = new Cart();
			cart.setUser(user);
			
			//add the cart
			assertEquals("Failed to add cart!",true,userDAO.addCart(cart));
			
			//add a shipping address for this user
			address = new Address();
			address.setAddressLineOne("Tornado Street");
			address.setAddressLineTwo("Tea Nagar");
			address.setCity("Chennai");
			address.setState("TamilNadu");
			address.setCountry("India");
			address.setPostalCode("600094");
			//set shipping to true
			address.setShipping(true);
			
			//link it with the user
			address.setUserId(user.getId());
			
			//add the shipping address
			assertEquals("Failed to add shipping address!",true,userDAO.addAddress(address));
			
		}		
		}
		*/
	
		
/*	@Test
	public void testAdd() {
		user = new User() ;
		user.setFirstName("Ramachandran");
		user.setLastName("Mani");
		user.setEmail("ramamani@gmail.com");
		user.setContactNumber("9167987654");
		user.setRole("USER");
		user.setPassword("123456");
		
		if(user.getRole().equals("USER")) {
			//create a cart for this user
			cart = new Cart();
			cart.setUser(user);
			//attach cart with the user
			user.setCart(cart);
			
		}
		//add the user
		assertEquals("Failed to add user!",true,userDAO.addUser(user));
		} 
	*/
	/*	@Test
	public void testUpdateCart() {
		
		//fetch the user by email
		user = userDAO.getByEmail("ramamani@gmail.com");
		//get the cart of the user
		cart=user.getCart();
		
		cart.setGrandTotal(5555);
		cart.setCartLines(2);
		assertEquals("Failed to update the cart!",true,userDAO.updateCart(cart));
	}
		*/
	
	
/*		cart = new Cart();
		
		// linked the address with the user
		address.setUser(user);
		
		// linked the cart with the user
		cart.setUser(user);
		// link the user with the cart
		user.setCart(cart);
		
		// add the user
		assertEquals("Failed to add the user!", true, userDAO.add(user));	
		// add the address
		assertEquals("Failed to add the billing address!", true, userDAO.addAddress(address));
				
		// add the shipping address
		address = new Address();
		address.setAddressLineOne("201/B Jadoo Society, Kishan Kanhaiya Nagar");
		address.setAddressLineTwo("Near Kudrat Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setUser(user);
		assertEquals("Failed to add the shipping address!", true, userDAO.addAddress(address));
		
	}
	
	*/

	// working for uni-directional

/*	@Test
	public void testAddAddress() {
	//We need to add an user
		user = new User() ;
		user.setFirstName("Ramachandran");
		user.setLastName("Mani");
		user.setEmail("ramamani@gmail.com");
		user.setContactNumber("9167987654");
		user.setRole("USER");
		user.setPassword("123456");
		
		//add the user
		assertEquals("Failed to add user!",true,userDAO.addUser(user));
		
	//we are going to add the address
		address = new Address();
		address.setAddressLineOne("301/B Jadoo Society, King Uncle Nagar");
		address.setAddressLineTwo("Near Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setBilling(true);
		
	//attached the user to the address
	address.setUser(user);	
	assertEquals("Failed to add address!",true,userDAO.addAddress(address));
	
	//we are also going to add the shipping address
	address = new Address();
	address.setAddressLineOne("Tornado Street");
	address.setAddressLineTwo("Tea Nagar");
	address.setCity("Chennai");
	address.setState("TamilNadu");
	address.setCountry("India");
	address.setPostalCode("600094");
	//set shipping to true
	address.setShipping(true);
	
	//attached the user to the address
		address.setUser(user);	
		assertEquals("Failed to add shipping address!",true,userDAO.addAddress(address));
		
	}

	*/
	
	
	
	
	
/*	@Test
	public void testUpdateCart() {
		user = userDAO.get(1);
		cart = user.getCart();
		cart.setGrandTotal(10000);
		cart.setCartLines(1);
		assertEquals("Failed to update the cart!", true, userDAO.updateCart(cart));			
	} 
*/
/*	@Test
	public void testAddAddress() {
		
		user = userDAO.getByEmail("ramamani@gmail.com");
		//we are also going to add the shipping address
		address = new Address();
		address.setAddressLineOne("Tornado Street");
		address.setAddressLineTwo("Tea Nagar");
		address.setCity("Bangalore");
		address.setState("Karnataka");
		address.setCountry("India");
		address.setPostalCode("400054");
		//set shipping to true
		address.setShipping(true);
		
		//attached the user to the address
			address.setUser(user);	
			assertEquals("Failed to add shipping address!",true,userDAO.addAddress(address));
	}
	*/

	@Test
	public void testGetAddresses() {
		
		user = userDAO.getByEmail("ramamani@gmail.com");
		
		assertEquals("Failed to fetch the list of address and size does not match!",2,userDAO.listShippingAddresses(user).size());
		assertEquals("Failed to fetch the billing address and size does not match!","Mumbai",userDAO.getBillingAddress(user).getCity());
		
	
		
		
		
	}
}
	

	
