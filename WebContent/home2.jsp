<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EmpDeptApp</title>
<style type="text/css">
#header {
	background-color: black;
	width: 100%;
	height: 50px;
	text-align: center;
}

#sidebar-left {
	float: left;
	width: 15%;
	height: 75%;
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 70%;
	background-color:lightgrey;
}

#sidebar-right {
	float: left;
	width: 15%;
	height: 75%;
	background-color: #83A0FF;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: lightblue;
}

#sidebar-left, #main, #sidebar-right {
	min-height: 600px
}

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

li {
  display: inline;
}

.container {
  position: absolute;
  top : 200px;
  right: 450px;
  margin: 20px;
  max-width: 1000px;
  padding: 16px;
  background-color: white;
}

.container2 {
  position: absolute;
  top : 160px;
  right: 250px;
  margin: 20px;
  max-width: 1000px;
  padding: 16px;
  background-color: white;
}
.container3 {
  position: absolute;
  top : 300px;
  right: 550px;
  margin: 20px;
  max-width: 1000px;
  padding: 16px;
 
}
.container4 {
  position: absolute;
  top : 400px;
  right: 550px;
  margin: 20px;
  max-width: 1000px;
  padding: 16px;
 
}


.container5 {
  position: absolute;
  top : 210px;
  right: 300px;
  margin: 20px;
  max-width: 1000px;
  padding: 16px;
  background-color: white;
}

.pos
{
float:right;

right:20px;
}


.ps
{
float:left;
}
</style>
</head>
<body>

<%if(session.getAttribute("unam") == null)
	{
	response.sendRedirect("login.jsp");
	}
	%>
	
		<div id="header"><div align="left"><a href="home"><font color="white">Home</font></a></div>
			<font color="white">Employee Dept App</font>
			<div class="pos">
				<a href="logout"><font color="white">Logout</font></a>
			</div>
		</div>


		<div id="sidebar-left">
			<h4><a href="home"><font color="blue">Department</font> </a></h4>
			<c:if test="${hom eq 'homep'}">
			<c:if test="${empty lis}">
			
			<h5>No department available ! click on actions link to add new department</h5>
			
			</c:if></c:if>
			
			<c:forEach var="dept" items="${lis}">
			<c:if test="${not empty dept}">
				<form action="listEmp">
					<input type="hidden" name="deptId" value="${dept.deptId}">


					<input type="submit" value="${dept.deptName}">
						<c:forEach var="employee" items="${val}">
						<br>
						<c:if test="${empty val}">

${mess}

</c:if>
						<c:if test="${not empty val}">
							<c:if test="${employee.deptEmpId eq dept.deptId}">

								<a href="showemployee?empId=${employee.empId}">
									${employee.empName}</a>



							</c:if>
							<c:if test="${employee.deptEmpId ne dept.deptId }">
 ${mess}
 </c:if>
						</c:if>
					</c:forEach>
				</form>
</c:if>
			</c:forEach>
		</div>

		<div id="main">
		<c:if test="${not empty deleteDoneDept}">
  <script>alert("Department deleted");
</script><c:remove var="deleteDoneDept" scope="session" /></c:if>
		<c:if test="${not empty EditDept}">
  <script>alert("Department Details Updated");
</script><c:remove var="EditDept" scope="session" /></c:if>
		
		<c:if test="${not empty submitDoneEmp}">
  <script>alert("Employee Added");
</script><c:remove var="submitDoneEmp" scope="session" /></c:if>
		
		<c:if test="${not empty submitDoneDept}">
  <script>alert("Department Added");
</script><c:remove var="submitDoneDept" scope="session" /></c:if>
		
		<c:if test="${not empty deleteDone}">
  <script>alert("Employee deleted");
</script><c:remove var="deleteDone" scope="session" /></c:if>
		<c:if test="${not empty submitDone}">
  <script>alert("Employee Details Updated");
</script><c:remove var="submitDone" scope="session" /></c:if>

		
			<br><p> ${ad}</p>

			<c:if test="${dbased ne 'onlydept'}">
				<c:if test="${valcheck ne 'regemployee'}">
					<c:if test="${mainemp eq 'checktable'}">
					<div class="container2">
 <h3>Employee Details</h3>
 <table border=1>

							<tr>
								<td>EmpId</td>
								<td>Emp Name</td>
								<td>Mail Id</td>
								<td>DateOfBirth</td>
								<td>DeptEmpId</td>
								<td>Mobile Number</td>
								<td>Salary</td>
								<td>Company Name</td>
								<td>Edit</td>
								<td>Delete</td>
							<tr>
							<tr>
								<td>${emp.empId}</td>
								<td>${emp.empName}</td>
								<td>${emp.mailId}</td>
								<td>${emp.dateOfBirth}</td>
								<td>${emp.deptEmpId}</td>
								<td>${emp.mobileNo}</td>
								<td>${emp.salary}</td>
								<td>${emp.companyName}</td>

								<td><a href="editemployee?empId=${emp.empId}">Edit</a></td>
								<td><a
									href="deleteemployee?empId=${emp.empId}&deptEmpId=${emp.deptEmpId}">Delete</a></td>
							</tr>
						</table>

					</div>
					
					</c:if>
						
					<c:if test="${mainemps eq 'checktableedit' }">
					<div class="container2">
						<form action="updateemployee" method="post">
							<h4>Edit Employee</h4>
							<table border=1>
								<tr>
									<td>Emp Id</td>
									<td>Emp Name</td>
									<td>Mail Id</td>
									<td>DateOfBirth</td>
									<td>Mobile No</td>
									<td>Salary</td>
									<td>Company Name</td>
									<td>DeptEmpId</td>
									<td>Update</td>
								<tr>
								<tr>
									<td><input type="text" name="empId" size="5"
										value="<c:out value='${emp.empId}' />" disabled /></td>



									<td><input type="text" name="empName" size="5"
										value="<c:out value='${emp.empName}' />" />
									</td>

									<td><input type="text" name="mailId" size="5"
										value="<c:out value='${emp.mailId}' />" />
									</td>

									<td><input type="date" name="dob" size="5"
										value="<c:out value='${emp.dateOfBirth}' />" />
									</td>
									<td><input type="text" name="mobileNo" size="6"
										value="<c:out value='${emp.mobileNo}' />" />
									</td>

									<td><input type="text" name="salary" size="5"
										value="<c:out value='${emp.salary}' />" />
									</td>

									<td><input type="text" name="companyName" size="10"
										value="<c:out value='${emp.companyName}' />" />
									</td>
									<td><input type="text" name="deptEmpId" size="5"
										value="<c:out value='${emp.deptEmpId}' />" disabled /></td>



									<td><input type="submit" value="update" /></td>
								</tr>
							</table>

						</form>
</div>

					</c:if>

					
				</c:if>
				
				
				<div class="container3">
						<br> <a href="addemployee">Add new employee</a>

					</div>
				<c:if test="${valcheck eq 'regemployee'}">
					
					
					<div class="container">
					<div align="center">
						<h4>Add Employee</h4>

						<form action="saveemployee" method="post">
							<table>
								<tr>
									<td>Name</td>
									<td><input type="text" name="empName" required /></td>
								</tr>

								<tr>
									<td>Mail Id:</td>
									<td><input type="text" name="mailId" required /></td>
								</tr>


								<tr>
									<td>Dob:</td>
									<td><input type="date" name="dob" required ></td>
								</tr>

								<tr>
									<td>Mobile No</td>
									<td><input type="text" name="mobileNo" required /></td>
								</tr>

								<tr>
									<td>Salary:</td>
									<td><input type="text" name="salary" required /></td>
								</tr>


								<tr>
									<td>company Name:</td>
									<td><input type="text" name="companyName" required ></td>
								</tr>
									
								<tr>
									<td>Department:</td>

									<td><select name="deptEmpId" required>
											<option>select deptId or Name</option>

											<c:forEach items="${dept}" var="depnt">

												<option>${depnt.deptId},${depnt.deptName}</option>

											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="add employee">&nbsp <input type="reset" value="reset"></td>
								</tr>







							</table>

						</form>
					</div></div>
				</c:if>
			</c:if>


			<c:if test="${dbased eq 'onlydept'}">
			<c:if test="${empty dval}">
			
			
			<h4>Oops ! No Department is Available . Please Add New department </h4>
			
			
			</c:if>
			
			<c:if test="${not empty dval }">
			<div class="container">
				<div align="center">
				<h4> Department Details</h4>	
					<table border=1>

						<tr>

							<td>DeptId</td>
							<td>DeptName</td>
							<td>Dept Location</td>
							<td>Edit</td>
							<td>Delete</td>

						</tr>
						<c:forEach var="deptval" items="${dval}">
							<tr>
								<td>${deptval.deptId}</td>
								<td>${deptval.deptName}</td>
								<td>${deptval.deptLoc}</td>
								<td><a href="editdepartment?depId=${deptval.deptId}">Edit</a></td>
								<td><a href="deledept?deptId=${deptval.deptId}">Delete</a></td>
							</tr>

						</c:forEach>

					</table>
					
				</div></div></c:if><br>
				<div class="container4">

					<a href="regDept">Add new department</a>

				</div>
					</c:if>

			

			<c:if test="${deptvalid eq 'editdept'}">
				<div class="container5">
				<h4>Update Department</h4>
				<form action="updatedept" method="post">
					<table border=1>

						<tr>
							<td>Dept Id</td>
							<td>Dept Name</td>
							<td>Dept Location</td>
							<td>Update</td>
						</tr>

						<tr>
							<td><input type="text" name="deptId"
								value="${deptva.deptId}" disabled /></td>
							<td><input type="text" name="deptName"
								value="${deptva.deptName}"></td>
								<td><input type="text" name="deptLoc"
								value="${deptva.deptLoc}"></td>
							<td><input type="submit" value="update dept" /></td>
						</tr>


					</table>
				</form></div><div class="container4">

					<a href="regDept">Add new department</a>

				</div>
			</c:if>



			<c:if test="${adddept eq 	'regdept'}">
				<form action="savedept" method="post">
				<div align="center">
				<div class="container">
				    <h3>Add Department</h3>
					<table>

						<tr>
							<td>Dept Name</td>
							<td><input type="text" name="deptName" required /></td>
						</tr>
						<tr>
							<td>Dept Location</td>
							<td><input type="text" name="deptLoc" required /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="add dept"></td>
						</tr>


					</table>
</div>
					</div>
				</form>

			</c:if>


		</div>

		<div id="sidebar-right">
<br>
<br>			
<h4><u>Actions on Department</u></h4>
Click <a href="listdept">here </a>to perform actions on
			department.




		</div>
		<div id="footer">Employee Department Application :)</div>

</body>
</html>