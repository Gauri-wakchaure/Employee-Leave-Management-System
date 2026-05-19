<%@ page import="java.util.List"%>
<%@ page import="dao.EmployeeDAO"%>
<%@ page import="model.Employee"%>

<%
EmployeeDAO dao = new EmployeeDAO();
List<Employee> list = dao.getAllEmployees();
%>

<!DOCTYPE html>
<html>
<head>
<title>Employee List</title>

<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
	margin: 0;
	padding: 20px;
}

.container {
	max-width: 1000px;
	margin: auto;
	background: #fff;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

.top-bar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 15px;
}

.search-box {
	padding: 10px;
	width: 250px;
	border: 1px solid #ccc;
	border-radius: 8px;
	outline: none;
	transition: 0.3s;
}

.search-box:focus {
	border-color: #4CAF50;
	box-shadow: 0 0 6px rgba(76,175,80,0.3);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th {
	background: #4CAF50;
	color: white;
	padding: 12px;
	text-align: left;
}

td {
	padding: 12px;
	border-bottom: 1px solid #eee;
}

tr:hover {
	background: #f1f1f1;
}

/* Bottom Button */
.bottom-bar {
	margin-top: 30px;
	text-align: center;
}

.back-btn {
	text-decoration: none;
	background: #555;
	color: white;
	padding: 10px 16px;
	border-radius: 8px;
	font-size: 14px;
	transition: 0.3s;
	display: inline-block;
}

.back-btn:hover {
	background: #333;
	transform: translateY(-2px);
}
</style>

<script>
function searchEmployee(value){
	let rows = document.querySelectorAll("#empTable tr");

	rows.forEach((row, index)=>{
		if(index === 0) return;

		row.style.display =
		row.innerText.toLowerCase().includes(value.toLowerCase())
		? "" : "none";
	});
}
</script>

</head>

<body>

<div class="container">

	<!-- Header -->
	<div class="top-bar">
		<h2>Employee List</h2>

		<input type="text" class="search-box"
		       placeholder="Search Employee..."
		       onkeyup="searchEmployee(this.value)">
	</div>

	<!-- Table -->
	<table id="empTable">

		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Email</th>
			<th>Dept ID</th>
		</tr>

		<%
		for (Employee emp : list) {
		%>

		<tr>
			<td><%=emp.getId()%></td>
			<td><%=emp.getName()%></td>
			<td><%=emp.getEmail()%></td>
			<td><%=emp.getDeptid()%></td>
		</tr>

		<%
		}
		%>

	</table>

	<!-- Back Button (BOTTOM) -->
	<div class="bottom-bar">
		<a class="back-btn"
		   href="<%=request.getContextPath()%>/admin/adminDashboard.jsp">
		   Back to Dashboard
		</a>
	</div>

</div>

</body>
</html>