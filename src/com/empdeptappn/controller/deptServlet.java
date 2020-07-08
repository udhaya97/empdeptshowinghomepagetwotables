package com.empdeptappn.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.empdeptappn.dao.DeptEmpDao;
import com.empdeptappn.dao.DeptEmpDaoImpl;
import com.empdeptappn.model.Department;
import com.empdeptappn.model.Employee;

@WebServlet("/home")
public class deptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public deptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DeptEmpDao ded = new DeptEmpDaoImpl();
		List<Department> ldept = ded.readAllDept();
		int deptId =ldept.get(0).getDeptId();
		List<Employee> empl = ded.readEmpFromDept(deptId);
		Department dep = ded.showDept(deptId);
		int i=0;
		
		
		
		
		request.setAttribute("lis", ldept);
		HttpSession session = request.getSession();
		session.setAttribute("lisvaldept", ldept);
		request.setAttribute("hom", "homep");
		request.setAttribute("dval", dep);
		request.setAttribute("val", empl);
		request.setAttribute("i", i);
		
		request.setAttribute("ad", "No employee data found here ! please click on department name to view specific employee");
		RequestDispatcher rd = request.getRequestDispatcher("home3.jsp");
		rd.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
