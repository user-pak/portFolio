package com.mycompany.portfolio.book.model.vo;

import java.util.ArrayList;

public class Category {

	private String catNo;
	private String catName;
	private ArrayList<Category> subCategory;
	
	public Category() {}

	public Category(String catNo, String catName, ArrayList<Category> subCategory) {
		super();
		this.catNo = catNo;
		this.catName = catName;
		this.subCategory = subCategory;
	}

	public String getCatNo() {
		return catNo;
	}

	public String getCatName() {
		return catName;
	}

	public ArrayList<Category> getSubCategory() {
		return subCategory;
	}

	public void setCatNo(String catNo) {
		this.catNo = catNo;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public void setSubCategory(ArrayList<Category> subCategory) {
		this.subCategory = subCategory;
	}

	@Override
	public String toString() {
		return "Category [catNo=" + catNo + ", catName=" + catName + ", subCategory=" + subCategory.toString() + "]";
	}


	
	
}
