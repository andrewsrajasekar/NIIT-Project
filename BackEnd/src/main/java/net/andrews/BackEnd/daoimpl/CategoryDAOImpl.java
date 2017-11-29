package net.andrews.BackEnd.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import net.andrews.BackEnd.dao.CategoryDAO;
import net.andrews.BackEnd.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {

	private static List<Category> categories = new ArrayList<>();
	static {
		Category category = new Category();

		// Adding First Category
		category.setId(1);
		category.setName("Mobile Phones");
		category.setDescription("This is the Description For Mobile Phones");
		category.setImageURL("CAT_1.png");
		categories.add(category);

		// Second Category
		category = new Category();
		category.setId(2);
		category.setName("Mobile Phone Accessories");
		category.setDescription("This is the Description For Mobile Phone Accessories");
		category.setImageURL("CAT_2.png");
		categories.add(category); 
		
		// Third Category
		category = new Category();
		category.setId(3);
		category.setName("Cameras");
		category.setDescription("This is the Description For Cameras");
		category.setImageURL("CAT_3.png");
		categories.add(category);

		
	}

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categories;
	}

	@Override
	public Category get(int id) {
		// Enhanced For Loop
		for(Category category : categories) {
			if(category.getId() == id) return category;
		}
		return null;
	}

}
