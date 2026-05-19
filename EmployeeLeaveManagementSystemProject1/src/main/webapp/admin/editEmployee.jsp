<%@ page import="java.sql.*"%>
<%@ page import="dao.DBConnection"%>

<%
String idParam = request.getParameter("id");

if (idParam == null) {
	out.println("Invalid Employee ID");
	return;
}

int id = Integer.parseInt(idParam);

String name = "";
String email = "";
String password = "";
int deptId = 0;

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE id=?");
ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

if (rs.next()) {
	name = rs.getString("name");
	email = rs.getString("email");
	password = rs.getString("password");
	deptId = rs.getInt("dept_id");
}

con.close();
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Employee</title>

<style>
body {
	font-family: Arial, sans-serif;
	background: #f4f6f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.form-container {
	background: #fff;
	padding: 30px;
	width: 400px;
	border-radius: 12px;
	box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333;
}

label {
	font-weight: 600;
	font-size: 14px;
}

input {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	outline: none;
	transition: 0.3s;
}

input:focus {
	border-color: #4CAF50;
	box-shadow: 0 0 5px rgba(76,175,80,0.3);
}

button {
	width: 100%;
	padding: 12px;
	background: #4CAF50;
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	background: #43a047;
	transform: translateY(-2px);
}

.back {
	text-align: center;
	margin-top: 10px;
}

.back a {
	text-decoration: none;
	color: #555;
	font-size: 14px;
}
</style>

</head>

<body>

<div class="form-container">

	<h2>Edit Employee</h2>

	<form action="<%=request.getContextPath()%>/UpdateEmployeeServlet"
	      method="post">

		<input type="hidden" name="id" value="<%=id%>" />

		<label>Name</label>
		<input type="text" name="name" value="<%=name%>" required />

		<label>Email</label>
		<input type="text" name="email" value="<%=email%>" required />

		<label>Password</label>
		<input type="text" name="password" value="<%=password%>" required />

		<label>Department ID</label>
		<input type="number" name="dept_id" value="<%=deptId%>" required />

		<button type="submit">Update Employee</button>

	</form>

	<div class="back">
		<a href="<%=request.getContextPath()%>/admin/adminDashboard.jsp">
			Back to Dashboard
		</a>
	</div>

</div>

</body>
</html>