package com.shophere.myservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shophere.dao.ProductDao;
import com.shophere.pojo.Products;



@WebServlet("/do.productoperation")
public class ProductServlet extends HttpServlet {
String action;
	
int product_id;
String product_Name;
String category; 
double Price;
String image;
	
	
	Products products = null;
	ProductDao productDao = new ProductDao();
	
	boolean flag;
	
	HttpSession session = null;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		session = req.getSession();
		
		action = req.getParameter("action");
		if(action.equalsIgnoreCase("addproduct"))
		{
			product_Name = req.getParameter("product_Name");
			category = req.getParameter("category");
			Price = Double.parseDouble(req.getParameter("Price"));
			image = req.getParameter("image");
			

			//create a food object with user data.
			products = new Products(product_Name,category,Price,image);
			
			try {
				flag = productDao.add(products);
				
				if(flag)
				{
					req.setAttribute("smsg","Product is Added");
				}
				else{
					req.setAttribute("emsg","Product is not Added");
				}
				
				RequestDispatcher rd = req.getRequestDispatcher("addproducts.jsp");
				rd.forward(req, resp);
				
			} catch (Exception e) {
				pw.print(e);
			}
		}
			


			
			else if (action != null && action.equalsIgnoreCase("updateproduct"))
			{
				product_id = Integer.parseInt(req.getParameter("products_id"));
				product_Name = req.getParameter("product_Name");
				category = req.getParameter("category");
				Price = Double.parseDouble(req.getParameter("Price"));
				image = req.getParameter("image");

				// create a food object with user data.
				products = new Products(product_id,product_Name,category, Price,image);
				
				try {
					flag = productDao.update(products);
					if(flag)
					{
						List<Products> flist = productDao.all();
						session.setAttribute("flist",flist);
						req.setAttribute("smsg",product_Name+" is Update Successfully.. ");
					}
					else 
					{
						req.setAttribute("emsg",product_Name+" is NOT update successfully.. ");	
					}
					req.getRequestDispatcher("productlist.jsp").forward(req, resp);
					
				} catch (Exception e) {
					e.printStackTrace();
				}

			}

//			
			pw.close();
			
			
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		session = req.getSession();
		action = req.getParameter("action");
		
		if(action!=null && action.equalsIgnoreCase("showproductlist"))
		{
			try {
				List<Products> flist = productDao.all();
				session.setAttribute("flist", flist);
				//sendRedirect method of HttpServletResponse is used the new request to next resource.
				resp.sendRedirect("productlist.jsp");
				
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
		}
		else if (action != null && action.equalsIgnoreCase("deleteproduct")) {
			product_id = Integer.parseInt(req.getParameter("product_id"));
			try {
				flag = productDao.delete(product_id);

				if (flag) {
					req.setAttribute("smsg", "Product is Deleted Successfully");
					List<Products> flist = productDao.all();
					session.setAttribute("flist", flist);

				} else {

					req.setAttribute("emsg", "Product is Not Deleted");
				}
//				RequestDispatcher rd = req.getRequestDispatcher("foodlist.jsp");
//				rd.forward(req, resp);
				req.getRequestDispatcher("productlist.jsp").forward(req, resp);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}