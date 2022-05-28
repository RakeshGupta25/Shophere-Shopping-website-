package com.shophere.pojo;

public class Products {
	
	private int product_id;
	private String product_Name;
	private String category; 
	private double Price;
	private String image;
	
	
	public Products()
	{
		super();
	}
	
	


	public Products(String product_Name, String category, double price, String image) {
		super();
		this.product_Name = product_Name;
		this.category = category;
		Price = price;
		this.image = image;
	}




	public Products(int product_id, String product_Name, String category, double price, String image) {
		super();
		this.product_id = product_id;
		this.product_Name = product_Name;
		this.category = category;
		Price = price;
		this.image = image;
	}




	public int getProduct_id() {
		return product_id;
	}




	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}




	public String getProduct_Name() {
		return product_Name;
	}




	public void setProduct_Name(String product_Name) {
		this.product_Name = product_Name;
	}




	public String getCategory() {
		return category;
	}




	public void setCategory(String category) {
		this.category = category;
	}




	public double getPrice() {
		return Price;
	}




	public void setPrice(double price) {
		Price = price;
	}




	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}




	@Override
	public String toString() {
		return "Products [products_id=" + product_id + ", products_Name=" + product_Name + ", category=" + category
				+ ", Price=" + Price + ", image=" + image + "]";
	}
	
	
	
	

}
