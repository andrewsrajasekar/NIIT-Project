package net.andrews.BackEnd.dao;

import java.util.List;

import net.andrews.BackEnd.dto.Address;
import net.andrews.BackEnd.dto.Cart;
import net.andrews.BackEnd.dto.User;

public interface UserDAO {

	//add an user
	boolean addUser(User user);
	User getByEmail(String email); 
	
	//add an address
	boolean addAddress(Address address);
	boolean updateCart(Cart cart);
	//alternative
	//Address getBillingAddress(int userId);
	//List<Address> listShippingAddresses(int userId);
		
	Address getBillingAddress(User user);
	List<Address> listShippingAddresses(User user);
	
	//add a cart
//	boolean updateCart(Cart cart);
//	Address getBillingAddress(User user);
//	List<Address> listShippingAddresses(User user);
//	Address getBillingAddress(int userId);

	
	

	
}