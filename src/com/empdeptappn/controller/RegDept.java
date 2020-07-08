package com.empdeptappn.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/regDept")
public class RegDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public RegDept() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sed = request.getSession();
		request.setAttribute("adddept", "regdept");
		request.setAttribute("lis", sed.getAttribute("lisvaldept"));
		
		RequestDispatcher rdf = request.getRequestDispatcher("home3.jsp");
		rdf.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
