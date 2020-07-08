package com.empdeptappn.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.empdeptappn.dao.DeptEmpDao;
import com.empdeptappn.dao.DeptEmpDaoImpl;
import com.empdeptappn.model.Employee;

/**
 * Servlet implementation class EditEmployee
 */
@WebServlet("/editemployee")
public class EditEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int empId=Integer.parseInt(request.getParameter("empId"));
		System.out.println("employee id at edit employee is "+empId);
		DeptEmpDao ded = new DeptEmpDaoImpl();
		Employee emp = (Employee) ded.readEmployee(empId);
		System.out.println("edit page value"+emp.getEmpName());
		HttpSession sed = request.getSession();
		sed.setAttribute("empp", emp);
		request.setAttribute("mainemps", "checktableedit");
		request.setAttribute("emp", emp);
		request.setAttribute("addlin", "anemp");
		request.setAttribute("lis", sed.getAttribute("lisvaldept"));
		request.setAttribute("val", sed.getAttribute("emplvaldept"));
		
			RequestDispatcher rd = request.getRequestDispatcher("home3.jsp");
			rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
