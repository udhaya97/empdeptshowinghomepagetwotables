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

@WebServlet("/deleteemployee")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	int empId = Integer.parseInt(request.getParameter("empId"));
	int deptempid = Integer.parseInt(request.getParameter("deptEmpId"));
	
	DeptEmpDao emg = new DeptEmpDaoImpl();
	
	emg.deleteEmpFromDept(deptempid, empId);
	System.out.println("deleting at del emplo");
	HttpSession sen = request.getSession();
	sen.setAttribute("deleteDone","done");
	response.sendRedirect("listEmp?deptId="+deptempid);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
