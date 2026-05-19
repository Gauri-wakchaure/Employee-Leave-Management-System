<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Add Employee</title>

<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #667eea, #764ba2);
	margin: 0;
}

.container {
	width: 400px;
	margin: 60px auto;
	background: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

input, select {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border-radius: 6px;
	border: 1px solid #ccc;
}

button {
	width: 100%;
	padding: 12px;
	background: #667eea;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 6px;
	cursor: pointer;
}

button:hover {
	background: #5a67d8;
}
</style>

</head>
<body>

	<div class="container">
		<h2>Add Employee</h2>

		<form action="<%=request.getContextPath()%>/AddEmployeeServlet"
			method="post">
			<input type="text" name="name" placeholder="Full Name" required>

			<input type="email" name="email" placeholder="Email" required>

			<input type="password" name="password" placeholder="Password"
				required> <select name="dept_id" required>
				<option value="">Select Department</option>
				<option value="1">HR</option>
				<option value="2">IT</option>
				<option value="3">Finance</option>
			</select>

			<button type="submit">Add Employee</button>

		</form>
	</div>

</body>
</html>
