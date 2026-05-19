<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Login</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: white;
}

.login-container {
	width: 400px;
	background: #1f2a36;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	text-align: center;
}

.login-container h2 {
	margin-bottom: 20px;
	color: white;
	font-size: 30px;
	font-family: Georgia;
}

.input-box {
	margin-bottom: 15px;
	text-align: left;
	font-size: 40px;
	font-family: Georgia;
	font-color: white;
}

.input-box label {
	font-size: 20px;
	color: white;
	font-family: Georgia;
	margin-top:15px;
}

.input-box input {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ccc;
	border-radius: 6px;
}

.input-box input:focus {
	border-color: #36d1dc;
}

.btn {
	margin-top: 16px;
	width: 100%;
	padding: 10px;
	border: none;
	background: #3b82f6;
	color: white;
	font-size: 16px;
	border-radius: 6px;
	cursor: pointer;
}

.btn:hover {
	background: #2bb4bd;
}

.error {
	color: red;
	margin-bottom: 10px;
}

.success {
	color: green;
	margin-bottom: 10px;
	color: #3b82f6;
}

.footer {
	margin-top: 20px;
	font-size: 16px;
	color: white;
	font-family: Georgia;
}
</style>

</head>

<body>

	<div class="login-container">

		<h2>Employee Login</h2>

		<!-- ERROR -->
		<%
		String error = request.getParameter("error");
		if ("invalid".equals(error)) {
		%>
		<div class="error">Invalid Email or Password</div>
		<%
		}
		%>

		<!-- LOGOUT MESSAGE -->
		<%
		String logout = request.getParameter("logout");
		if ("success".equals(logout)) {
		%>
		<div class="success">Logged out successfully</div>
		<%
		}
		%>

		<!-- FORM -->
		<form action="<%=request.getContextPath()%>/EmployeeLoginServlet"
			method="post">

			<div class="input-box">
				<label>Email</label> <input type="email" name="email" required>
			</div>

			<div class="input-box">
				<label>Password</label> <input type="password" name="password"
					required>
			</div>

			<button type="submit" class="btn">Login</button>

		</form>

		<div class="footer">Employee Leave Management System</div>

	</div>

</body>
</html>