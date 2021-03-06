package net.andrews.FrontEnd.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import net.andrews.BackEnd.dao.UserDAO;
import net.andrews.BackEnd.dto.Address;
import net.andrews.BackEnd.dto.Cart;
import net.andrews.BackEnd.dto.User;
import net.andrews.FrontEnd.model.RegisterModel;

@Component
public class RegisterHandler {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public RegisterModel init() {
		
		return new RegisterModel();
		
		
	}
	
	public void addUser(RegisterModel registerModel, User user) {
		
		
		registerModel.setUser(user);
	}
	
    public void addBilling(RegisterModel registerModel, Address billing) {
		
		
		registerModel.setBilling(billing);
	}
    
    public String validateUser(User user,MessageContext error) {
    	String transitionValue = "success";
    	//Check if password matches confirm password
    	if(!(user.getPassword().equals(user.getConfirmPassword()))) {
    		error.addMessage(new MessageBuilder()
    				.error()
    				.source("confirmPassword")
    				.defaultText("Password does not match the Confirm Password!")
    				.build()
    				);
    	}
    	//check the uniqueness of the email id
    	if(userDAO.getByEmail(user.getEmail())!=null) {
    		
    		error.addMessage(new MessageBuilder()
    				.error()
    				.source("email")
    				.defaultText("Email Address is already used!")
    				.build()
    				);
    		
    		transitionValue = "failure";
    	}
    	
    	
    	return transitionValue;
    }
    
    
    
    
    public String saveAll(RegisterModel model) {
       String transitionValue = "success";
    	
       // fetch the user
       User user = model.getUser();
       
       if(user.getRole().equals("USER")) {
    	Cart cart = new Cart();      	   
    	cart.setUser(user);
    	user.setCart(cart);
       }
       
       //encode the Password
       user.setPassword(passwordEncoder.encode(user.getPassword()));
       
       
       // save the user
       
       userDAO.addUser(user);
       
       // get the address
        
       Address billing = model.getBilling();
 
       billing.setUserId(user.getId());
       billing.setBilling(true);
       
       // save the address
       userDAO.addAddress(billing);
       
       return transitionValue;	
    }
    
    
}