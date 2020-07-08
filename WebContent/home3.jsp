<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dept Emp App</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
	background-color: #83A0FF;
}

#main {
	float: left;
	width: 85%;
	background-color: lightgray;
}

#footer {
	clear: both;
	height: 50px;
	width: 100%;
	text-align: center;
	background-color: lightblue;
}

#sidebar-left, #main {
	min-height: 600px
}

.container {
	position: absolute;
	top: 200px;
	right: 350px;
	margin: 20px;
	max-width: 500px;
	padding: 16px;
	background-color: white;
}

.container2 {
	position: absolute;
	top: 170px;
	right: 150px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
	background-color: white;
}

.container3 {
	position: absolute;
	top: 400px;
	right: 550px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
}

.container4 {
	position: absolute;
	top: 420px;
	right: 350px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
}

.container5 {
	position: absolute;
	top: 180px;
	right: 250px;
	margin: 20px;
	max-width: 1000px;
	padding: 16px;
	background-color: white;
}

,
t {
	text-align: left;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("unam") == null) {
			response.sendRedirect("login.jsp");
		}
	%>

	<div id="header">
		<div align="left">
			<a href="homeserv"><font color="white">Home</font></a>
		</div>
		<font color="white">Dept Emp App</font>
		<div align="right">
			<a href="logout"><font color="white">Logout</font></a>
		</div>
	</div>
	<div id="sidebar-left">

		<form action="home">
			<br> &nbsp <input type="submit" value="+"> Department
		</form>

		<c:if test="${hom eq 'homep'}">
			<c:set var="count" value="0" scope="page" />
			<c:forEach var="dept" items="${lis}">
				<c:set var="count" value="${count + 1}" scope="page" />
				<c:if test="${not empty dept}">

					<input type="hidden" name="deptId" value="${dept.deptId}">

					<br>
				&nbsp =><button type="button" class="btn btn-success">	<a href="listEmp?deptId=${dept.deptId}"><font color="white">Department
						${count}</font></a></button>
					<br>

				</c:if>
			</c:forEach>

		</c:if>

	</div>

	<div id="main">


		<c:if test="${hoser eq 'hseval'}">

			<div align="center"><br>
				<h4>Hi Admin Welcome to Department Employee Application :)</h4>
			</div><br>

			<p>There arer two tables one as parent table(Department) other
				table is Child (Employee). Performing Simple
				Create,Read,Update,Delete operations on this with relationship.</p>
			<br>

			<div align="center">
				<h4><b><font color="green">Department Table</font></b></h4>

				<table border=" 1px solid black">

					<tr>

						<th>DeptId</th>
						<th>DeptName</th>
						<th>Dept Location</th>

					</tr>
					<c:forEach items="${deptlv}" var="dval">
						<tr>
							<td>${dval.deptId}</td>
							<td>${dval.deptName}</td>
							<td>${dval.deptLoc}</td>

						</tr>

					</c:forEach>

				</table>

			</div>

			<br>





			<div align="center">

				<h4><b><font color="blue">Employee Table</font></b></h4>
				<table border=1>

					<tr>
						<th>EmpId</th>
						<th>Emp Name</th>
						<th>DateOfBirth</th>
						<th>Mail Id</th>
						<th>DeptEmpId</th>
						<th>Mobile Number</th>
						<th>Salary</th>
						<th>Company Name</th>
					<tr>
						<c:forEach var="emp" items="${empall}">
							<tr>
								<td>${emp.empId}</td>
								<td>${emp.empName}</td>
								<td>${emp.dateOfBirth}</td>
								<td>${emp.mailId}</td>
								<td>${emp.deptEmpId}</td>
								<td>${emp.mobileNo}</td>
								<td>${emp.salary}</td>
								<td>${emp.companyName}</td>
						</c:forEach>




					</tr>
				</table>
			</div>







		</c:if>



















		<c:if test="${hom eq 'homep'}">
			<div align="center"><br>
				<h4>Department Table</h4>

				<table border=" 1px solid black">

					<tr>

						<th>DeptId</th>
						<th>DeptName</th>
						<th>Dept Location</th>
						<th>Edit</th>
						<th>Delete</th>

					</tr>

					<tr>
						<td>${dval.deptId}</td>
						<td>${dval.deptName}</td>
						<td>${dval.deptLoc}</td>
						<td><a href="editdepartment?depId=${dval.deptId}">Edit</a></td>
						<td><a href="deledept?deptId=${dval.deptId}">Delete</a></td>
					</tr>



				</table>
			</div>
			<br>
			<br>
			<c:if test="${empty val}">
				<div align="center">


					<h4>No Employee Table Associated with This Department Kindly
						Add Employee to this.</h4>
				</div>

			</c:if>
			<c:if test="${not empty val }">
				<div align="center"><br><br>
					<h4>Employee Details</h4>
					<table border=1>

						<tr>
							<td>EmpId</td>
							<td>Emp Name</td>
							<td>DateOfBirth</td>
							<td>Mail Id</td>
							<td>DeptEmpId</td>
							<td>Mobile Number</td>
							<td>Salary</td>
							<td>Company Name</td>
							<td>Edit</td>
							<td>Delete</td>
						<tr>
							<c:forEach var="emp" items="${val}">
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
							</c:forEach>
					</table>
				</div>

			</c:if>
			<br>
			<div class="container3">
				<br><button type="button" class="btn btn-primary"><a href="addemployee"><font color="white">Add new employee</font></a></button>

			</div> &nbsp <div class="container4">

				<button type="button" class="btn btn-info"><a href="regDept"><font color="white">Add new department</font></a></button>

			</div>
		</c:if>





		<c:if test="${mainemps eq 'checktableedit' }">
			<div class="container2">
				<form action="updateemployee" method="post">
					<div align="center">
						<h4>Edit Employee</h4>
					</div>
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
								value="<c:out value='${emp.empName}' />" /></td>

							<td><input type="text" name="mailId" size="5"
								value="<c:out value='${emp.mailId}' />" /></td>

							<td><input type="date" name="dob" size="5"
								value="<c:out value='${emp.dateOfBirth}' />" /></td>
							<td><input type="text" name="mobileNo" size="6"
								value="<c:out value='${emp.mobileNo}' />" /></td>

							<td><input type="text" name="salary" size="5"
								value="<c:out value='${emp.salary}' />" /></td>

							<td><input type="text" name="companyName" size="10"
								value="<c:out value='${emp.companyName}' />" /></td>
							<td><input type="text" name="deptEmpId" size="5"
								value="<c:out value='${emp.deptEmpId}' />" disabled /></td>



							<td><input type="submit" value="update" /></td>
						</tr>
					</table>
					<br>
					<div align="center">
						<a href="listEmp?deptId=${emp.deptEmpId}">Back</a>
					</div>
				</form>
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
					<br>
					<div align="center">
						<a href="listEmp?deptId=${deptva.deptId}">Back</a>
					</div>
				</form>
			</div>
		</c:if>


		<c:if test="${adddept eq 'regdept'}">
			<form action="savedept" method="post">
				<div align="center">
					<div class="container">
						<h3>Add Department</h3>
						<table border="0">

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


		<c:if test="${valcheck eq 'regemployee'}">


			<div class="container">
				<div align="center">
					<h4>Add Employee</h4>

					<form action="saveemployee" method="post">
						<table border="0">
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
								<td><input type="date" name="dob" required></td>
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
								<td><input type="text" name="companyName" required></td>
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
								<td><input type="submit" value="add employee">&nbsp
									<input type="reset" value="reset"></td>
							</tr>







						</table>

					</form>
				</div>
			</div>
		</c:if>


		<c:if test="${not empty deleteDoneDept}">
			<script>
				alert("Department deleted");
			</script>
			<c:remove var="deleteDoneDept" scope="session" />
		</c:if>
		<c:if test="${not empty EditDept}">
			<script>
				alert("Department Details Updated");
			</script>
			<c:remove var="EditDept" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneEmp}">
			<script>
				alert("Employee Added");
			</script>
			<c:remove var="submitDoneEmp" scope="session" />
		</c:if>

		<c:if test="${not empty submitDoneDept}">
			<script>
				alert("Department Added");
			</script>
			<c:remove var="submitDoneDept" scope="session" />
		</c:if>

		<c:if test="${not empty deleteDone}">
			<script>
				alert("Employee deleted");
			</script>
			<c:remove var="deleteDone" scope="session" />
		</c:if>
		<c:if test="${not empty submitDone}">
			<script>
				alert("Employee Details Updated");
			</script>
			<c:remove var="submitDone" scope="session" />
		</c:if>


	</div>


	<div id="footer">Department Employee Application :)</div>
</body>
</html>