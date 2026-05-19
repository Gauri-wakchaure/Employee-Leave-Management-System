<%@ page import="java.util.List"%>
<%@ page import="dao.EmployeeDAO"%>
<%@ page import="dao.DepartmentDAO"%>
<%@ page import="dao.LeaveDAO"%>
<%@ page import="model.Employee"%>
<%@ page import="model.Department"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
body {
	margin: 0;
	font-family: Arial;
	display: flex;
}

.logo {
	font-size: 18px;
	font-style: italic;
	font-family: Georgia;
	color: #aab7c4;
	text-align: center;
	margin-bottom: 45px;
}

.card-icon {
	font-size: 28px;
	margin-bottom: 10px;
}

.emp .card-icon {
	color: #3b82f6;
}

.dept .card-icon {
	color: #a855f7;
}

.total .card-icon {
	color: #14b8a6;
}

.pending .card-icon {
	color: #f59e0b;
}

.approved .card-icon {
	color: #22c55e;
}

.declined .card-icon {
	color: #ef4444;
}

.cards {
	margin-left: 200px;
	padding: 30px;
	display: grid;
	grid-template-columns: repeat(3, minmax(280px, 1fr));
	gap: 30px;
}

.card {
	min-height: 180px;
	padding: 35px;
	border-radius: 16px;
	background: #1f2a36;
	color: #fff;
	text-align: center;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
	transition: .3s;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 20px 35px rgba(59, 130, 246, 0.25);
}

.card h2 {
	font-size: 42px;
	margin: 10px 0 0 0;
	font-weight: 700;
	color: #ffffff;
}

.card {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

/* Sidebar */
.sidebar {
	background: #1f2a36;
	color: white;
	width: 220px;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	overflow-y: auto;
}

/* Sidebar links */
.sidebar a {
	display: flex;
	align-items: center;
	gap: 12px;
	color: #cbd5e1;
	padding: 12px;
	text-decoration: none;
	border-radius: 6px;
	margin: 8px;
	transition: .3s;
	font-family: Georgia;
}

.sidebar a:hover {
	background: #1f2937;
	color: #fff;
	transform: translateX(5px);
}

/* Main content */
.main {
	margin-left: 220px;
	padding: 20px;
	width: calc(100% - 220px);
	background: #f4f6f9;
	min-height: 100vh;
	overflow-x: auto;
	font-family: Georgia;
}

/* Sections */
.section {
	display: none;
}

.active {
	display: block;
}

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	background: white;
}

th, td {
	padding: 10px;
	border: 4px solid #ddd;
	text-align: left;
}

.popup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 40px;
	width: 500px; /* bigger width */
	border-radius: 12px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
	z-index: 1000;
}

.popup form input {
	width: 100%;
	padding: 15px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

.popup form button {
	width: 48%;
	padding: 14px;
	font-size: 16px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	margin-top: 10px;
}

.popup form button[type="submit"] {
	background: #28a745;
	color: white;
}

.popup form button[type="button"] {
	background: #dc3545;
	color: white;
}

/* Common Button */
.btn {
	padding: 8px 14px;
	text-decoration: none;
	color: white !important;
	border-radius: 5px;
	font-size: 14px;
	margin-right: 5px;
	display: inline-block;
	border: none;
	cursor: pointer;
	font-weight: bold;
}

/* Edit Button */
.edit-btn {
	background: #28a745;
}

.edit-btn:hover {
	background: #218838;
}

/* Delete Button */
.delete-btn {
	background: #dc3545;
}

.delete-btn:hover {
	background: #c82333;
}

#admin form {
	width: 500px;
	padding: 30px;
	background: white;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

#admin input {
	width: 100%;
	padding: 15px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

#admin button {
	width: 100%;
	padding: 15px;
	font-size: 18px;
	background: #1f2a36;
	color: white;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

#admin button:hover {
	background: #34495e;
}

.topbar {
	height: 70px;
	background: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 30px;
	border-radius: 12px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	margin-bottom: 25px;
}

.admin-info {
	font-size: 20px;
	font-weight: bold;
	color: #1f2a36;
	font-family: Georgia;
}

.logout-btn {
	background: #ef4444;
	color: white;
	padding: 12px 18px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	font-weight: bold;
}

.logout-btn:hover {
	background: #dc2626;
}

.search-box {
	padding: 12px 14px;
	width: 320px;
	border: 1px solid #ccc;
	border-radius: 8px;
	margin-bottom: 15px;
	font-size: 15px;
	outline: none;
	transition: 0.3s ease;
}

.search-box:focus {
	border-color: #4CAF50;
	box-shadow: 0 0 6px rgba(76, 175, 80, 0.25);
}

.counter {
	font-size: 40px;
	font-weight: bold;
	color: #ffffff !important;
	user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
	cursor: default;
}
</style>

<script>
function showSection(id){
    document.querySelectorAll(".section").forEach(s=>{
        s.classList.remove("active");
    });

    document.getElementById(id).classList.add("active");
}

function openPopup(id){
    document.getElementById(id).style.display="block";
}

function closePopup(id){
    document.getElementById(id).style.display="none";
}

window.onload=function(){
    const params=new URLSearchParams(window.location.search);
    const section=params.get("section");
    if(section){ showSection(section); }
}

function searchDepartment(value){
    let rows = document.querySelectorAll("#dept table tr");

    rows.forEach((row, index) => {
        if(index === 0) return; // skip header

        let text = row.innerText.toLowerCase();

        row.style.display = text.includes(value.toLowerCase())
            ? ""
            : "none";
    });
}

function searchEmployee(value){
	let rows=document.querySelectorAll("#emp table tr");

	rows.forEach((row,index)=>{
	if(index===0)return;

	row.style.display=
	row.innerText.toLowerCase().includes(value.toLowerCase())
	? ""
	: "none";
	});
	}

	document.addEventListener("DOMContentLoaded",function(){

	document.querySelectorAll('.counter').forEach(counter=>{

	let target=+counter.getAttribute('data-target');
	let count=0;

	let update=()=>{
	let inc=target/60;

	if(count<target){
	count+=inc;
	counter.innerText=Math.ceil(count);
	setTimeout(update,20);
	}else{
	counter.innerText=target;
	}
	}

	update();

	});

	});
</script>

</head>
<body>

	<div class="sidebar">
		<h2 class="logo">Employee Leave Management System</h2>

		<a onclick="showSection('dashboard')"><i class="fas fa-chart-line"></i>
			Dashboard</a> <a onclick="showSection('emp')"><i class="fas fa-users"></i>
			Employees</a> <a onclick="showSection('dept')"><i
			class="fas fa-building"></i> Departments</a> <a
			onclick="showSection('leave')"><i class="fas fa-calendar-check"></i>
			Leaves</a> <a onclick="showSection('admin')"><i class="fas fa-cog"></i>
			Admin Settings</a>
	</div>

	<%
	EmployeeDAO edao = new EmployeeDAO();
	DepartmentDAO ddao = new DepartmentDAO();
	LeaveDAO ldao = new LeaveDAO();

	int empCount = edao.getEmployeeCount();
	int deptCount = ddao.getDepartmentCount();
	int totalLeaves = ldao.getTotalLeaves();
	int pending = ldao.getPendingLeaves();
	int approved = ldao.getApprovedLeaves();
	int declined = ldao.getDeclinedLeaves();
	%>

	<div class="main">

		<div class="topbar">

			<div class="admin-info">
				Welcome Admin |
				<%=new java.text.SimpleDateFormat("dd MMM yyyy").format(new java.util.Date())%>
			</div>

			<form action="<%=request.getContextPath()%>/LogoutServlet"
				method="post">
				<button class="logout-btn">Logout</button>
			</form>

		</div>

		<!-- Dashboard -->
		<div id="dashboard" class="section active">
			<div class="cards">

				<div class="card emp">
					<i class="fas fa-users card-icon"></i> Total Employees
					<h2><%=empCount%></h2>
				</div>

				<div class="card dept">
					<i class="fas fa-building card-icon"></i> Total Departments
					<h2><%=deptCount%></h2>
				</div>

				<div class="card total">
					<i class="fas fa-file-alt card-icon"></i> Total Leaves
					<h2><%=totalLeaves%></h2>
				</div>

				<div class="card pending">
					<i class="fas fa-calendar-alt card-icon"></i> Pending Leaves
					<h2><%=pending%></h2>
				</div>

				<div class="card approved">
					<i class="fas fa-check-circle card-icon"></i> Approved Leaves
					<h2><%=approved%></h2>
				</div>

				<div class="card declined">
					<i class="fas fa-times-circle card-icon"></i> Declined Leaves
					<h2><%=declined%></h2>
				</div>

			</div>
		</div>

		<!-- Employees -->
		<div id="emp" class="section">
			<h2>Employees</h2>
			<input type="text" class="search-box"
				placeholder="Search Employee..."
				onkeyup="searchEmployee(this.value)">

			<button onclick="openPopup('empForm')"
				style="font-size: 17px; padding: 12px 18px; font-weight: 300;">
				+ Add Employee</button>

			<table>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Department</th>
					<th>Action</th>
				</tr>

				<%
				List<Employee> employees = edao.getAllEmployees();
				for (Employee e : employees) {
				%>

				<tr>
					<td><%=e.getId()%></td>
					<td><%=e.getName()%></td>
					<td><%=e.getEmail()%></td>
					<td><%=e.getDeptid()%></td>

					<td><a href="editEmployee.jsp?id=<%=e.getId()%>"
						class="btn edit-btn"> <i class="fa fa-edit"></i> Edit
					</a> <a
						href="<%=request.getContextPath()%>/DeleteEmployeeServlet?id=<%=e.getId()%>"
						class="btn delete-btn"> <i class="fa fa-trash"></i> Delete
					</a>
				</tr>

				<%
				}
				%>
			</table>
		</div>


		<!-- Employee Popup -->
		<div class="popup" id="empForm">

			<form action="<%=request.getContextPath()%>/AddEmployeeServlet"
				method="post">

				<input type="hidden" name="section" value="emp"> <input
					type="text" name="name" placeholder="Name" required><br>
				<br> <input type="email" name="email" placeholder="Email"
					required><br> <br> <input type="password"
					name="password" placeholder="Password" required><br> <br>
				<input type="number" name="dept_id" placeholder="Department ID"
					required><br> <br>

				<button type="submit">Add Employee</button>

				<button type="button" onclick="closePopup('empForm')">
					Close</button>

			</form>

		</div>

		<!-- Departments -->
		<div id="dept" class="section">
			<h2>Departments</h2>

			<input type="text" class="search-box"
				placeholder="Search Department..."
				onkeyup="searchDepartment(this.value)">

			<button onclick="openPopup('deptForm')"
				style="font-size: 17px; padding: 12px 18px; font-weight: 300;">
				+ Add Department</button>
				
			<table>
				<tr>
					<th>ID</th>
					<th>Department</th>
					<th>Shortform</th>
					<th>Code</th>
					<th>Action</th>
				</tr>

				<%
				List<Department> dlist = ddao.getAllDepartments();
				for (Department d : dlist) {
				%>

				<tr>
					<td><%=d.getId()%></td>
					<td><%=d.getDepartment()%></td>
					<td><%=d.getShortform()%></td>
					<td><%=d.getCode()%></td>

					<td><a
						href="<%=request.getContextPath()%>/DepartmentServlet?action=edit&id=<%=d.getId()%>"
						class="btn edit-btn"> <i class="fa-solid fa-pen-to-square"></i>
							Edit
					</a> <a
						href="<%=request.getContextPath()%>/DepartmentServlet?action=delete&id=<%=d.getId()%>"
						class="btn delete-btn"
						onclick="return confirm('Delete this department?');"> <i
							class="fa-solid fa-trash"></i> Delete
					</a></td>
				</tr>

				<%
				}
				%>
			</table>
		</div>

		<!-- Department Popup -->
		<div class="popup" id="deptForm">
			<form action="<%=request.getContextPath()%>/DepartmentServlet"
				method="post">
				<input type="text" name="department" placeholder="Department Name"
					required><br> <br> <input type="text"
					name="shortform" placeholder="Shortform" required><br>
				<br> <input type="number" name="code" placeholder="Code"
					required><br> <br>
				<button type="submit">Add</button>
				<button type="button" onclick="closePopup('deptForm')">Close</button>
			</form>
		</div>

		<!-- Leaves -->
		<%
		Integer empId = (Integer) session.getAttribute("empId");
		if (empId != null) {
			request.setAttribute("empId", empId);
		}
		%>

		<div id="leave" class="section">
			<h2>Leaves</h2>

			<h3>Pending</h3>
			<jsp:include page="pendingLeaves.jsp" />

			<h3>Approved</h3>
			<jsp:include page="approvedLeaves.jsp" />

			<h3>Rejected</h3>
			<jsp:include page="declinedLeaves.jsp" />
		</div>

		<!-- Admin Settings  -->
		<div id="admin" class="section">
			<h2>Admin Settings</h2>

			<form action="<%=request.getContextPath()%>/UpdateAdminServlet"
				method="post">
				<input type="email" name="email" placeholder="New Email" required><br>
				<br> <input type="password" name="password"
					placeholder="New Password" required><br> <br>
				<button type="submit">Update</button>
			</form>

		</div>

	</div>
</body>
</html>