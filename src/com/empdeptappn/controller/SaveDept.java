package com.empdeptappn.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.empdeptappn.dao.DeptEmpDao;
import com.empdeptappn.dao.DeptEmpDaoImpl;
import com.empdeptappn.model.Department;

/**
 * Servlet implementation class SaveDept
 */
@WebServlet("/savedept")
public class SaveDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String deptName=request.getParameter("deptName");
		String deptLoc=request.getParameter("deptLoc");
		Department dt = new Department();
		
		dt.setDeptId(0);
		dt.setDeptName(deptName);
		dt.setDeptLoc(deptLoc);
		DeptEmpDao df = new DeptEmpDaoImpl();
		
		df.createDept(dt);
		HttpSession sem = request.getSession();
		sem.setAttribute("submitDoneDept","done");
		response.sendRedirect("homeserv");
		
	}

}
