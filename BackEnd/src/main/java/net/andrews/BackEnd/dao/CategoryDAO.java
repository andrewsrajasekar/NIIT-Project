package net.andrews.BackEnd.dao;

import java.util.List;

import net.andrews.BackEnd.dto.Category;

public interface CategoryDAO {

	List<Category> list();
	Category get(int id);
	
	
}
