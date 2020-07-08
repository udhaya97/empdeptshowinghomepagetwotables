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
import com.empdeptappn.model.Employee;

/**
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/updateemployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession mlk = request.getSession();
		Employee erd = (Employee)mlk.getAttribute("empp");
		int empId =erd.getEmpId();
		System.out.println("id val"+empId);
		String empName=request.getParameter("empName");
		System.out.println("employee Name"+empName);
		String mailId=request.getParameter("mailId");
		System.out.println("mail Id"+mailId);
		String dob=request.getParameter("dob");
		System.out.println("dob "+dob);
		int studeptid=erd.getDeptEmpId();
		System.out.println("values update employee "+ studeptid);
		long mob = Long.parseLong(request.getParameter("mobileNo"));
		float sal = Float.parseFloat(request.getParameter("salary"));
		String comName = request.getParameter("companyName");
		
		Employee emp = new Employee();
		emp.setEmpId(empId);
		emp.setEmp_name(empName);
		emp.setMailId(mailId);
		emp.setDateOfBirth(dob);
		emp.setDeptEmpId(studeptid);
		emp.setMobileNo(mob);
		emp.setSalary(sal);
		emp.setCompanyName(comName);
		
		System.out.println("values for updating");
		//System.out.println(empId+" "+empName + " "+ mailId+" "+dob+" "+studeptid);
		DeptEmpDao ded = new DeptEmpDaoImpl();
		ded.updateEmp(emp);
		HttpSession sea = request.getSession();
		sea.setAttribute("submitDone","done");
		response.sendRedirect("listEmp?deptId="+studeptid);
		
		
	}

}
