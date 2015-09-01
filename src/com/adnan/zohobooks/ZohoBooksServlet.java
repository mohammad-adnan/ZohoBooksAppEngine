package com.adnan.zohobooks;

import java.io.IOException;

import javax.servlet.http.*;

import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;

@SuppressWarnings("serial")
public class ZohoBooksServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		resp.getWriter().println("Hello, world");
		resp.sendRedirect("home.jsp");
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String[] quatitys = req.getParameterValues("quantity");
		String[] products = req.getParameterValues("product");
		Controller controller = (Controller) getServletContext().getAttribute("controller");
		
		for(int i = 0;i < quatitys.length; ++i){
			System.out.println("quantity: " + quatitys[i] + " product: " + products[i]);
		}
		
		String resultJSON = controller.createInvoice(quatitys, products);
		try {
			JSONObject jsonObject = new JSONObject(resultJSON);
			if(jsonObject.getInt("code") == 0)
				resp.getWriter().println("<center><h3>تم إنشاء الفاتورة بنجاح</h3></center>");
			else
				resp.getWriter().println("<center><h3> لم يتم إنشاء الفاتورة</h3></center>");
			
			resp.getWriter().println("<center><a href = \"/\">إنشاء فاتورة جديدة</a></center>");
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			resp.getWriter().println("<center><h3> لم يتم إنشاء الفاتورة</h3></center>");
			
			resp.getWriter().println("<center><a href = \"/\">إنشاء فاتورة جديدة</a></center>");
			e.printStackTrace();
		}
		
		
	}
}
