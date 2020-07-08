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

@WebServlet("/saveemployee")
public class SaveEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Employee eml = new Employee();
		
		//int empId = request.getParameter("empId");
		String name = request.getParameter("empName");
		String mailId = request.getParameter("mailId");
		String dob = request.getParameter("dob");
		long mob = Long.parseLong(request.getParameter("mobileNo"));
		float sal = Float.parseFloat(request.getParameter("salary"));
		String comName = request.getParameter("companyName");
		String deptempId =request.getParameter("deptEmpId");
		
		String[] ar = deptempId.split(",");
		int dep = Integer.parseInt(ar[0]);
		System.out.println("dept id"+dep);
		DeptEmpDao ded = new DeptEmpDaoImpl();
		eml.setEmpId(0);
		eml.setEmp_name(name);
		eml.setMailId(mailId);
		eml.setDateOfBirth(dob);
		eml.setDeptEmpId(dep);
		eml.setCompanyName(comName);
		eml.setMobileNo(mob);
		eml.setSalary(sal);
		ded.createEmp(eml);
		HttpSession sem = request.getSession();
		sem.setAttribute("submitDoneEmp","done");
		RequestDispatcher rd = request.getRequestDispatcher("homeserv");
		rd.forward(request, response);
		
	}

}
