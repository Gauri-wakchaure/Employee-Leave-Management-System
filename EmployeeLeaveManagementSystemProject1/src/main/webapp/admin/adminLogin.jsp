<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

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
	background: #eef1f5;
}

.login-container {
	width: 440px;
	background: white;
	border-radius: 5px;
	overflow: hidden;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

/* TOP PURPLE SECTION */
.top-section {
	background: #1f2a36;
	color: white;
	text-align: center;
	padding: 50px 20px;
}

.top-section h1 {
	font-size: 38px;
	margin-bottom: 15px;
	font-weight: bold;
	font-family: Georgia;
}

.top-section p {
	font-size: 16px;
	font-family: Georgia;
}

/* FORM */
.form-section {
	padding: 40px;
}

.input-box {
	position: relative;
	margin-bottom: 30px;
}

.input-box input {
	width: 100%;
	border: none;
	border-bottom: 1px solid #ccc;
	padding: 12px 40px 12px 0;
	font-size: 16px;
	outline: none;
	background: transparent;
}

.input-box i {
	position: absolute;
	right: 5px;
	top: 14px;
	color: #7b4dff;
	font-size: 18px;
}

/* BUTTON */
.btn {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 30px;
	background: #1f2a36;
	font-size: 16px;
	cursor: pointer;
	transition: 0.3s;
	color: white;
	font-family: Georgia;
}

.btn:hover {
	background: black;
	color: white;
}

.error {
	color: red;
	text-align: center;
	margin-bottom: 15px;
}

/* SUCCESS */
.success {
	color: green;
	text-align: center;
	margin-bottom: 15px;
}

/* BACK BUTTON */
.back-btn {
	text-align: center;
	margin-top: 30px;
	font-family: Georgia;
}

.back-btn a {
	text-decoration: none;
	color: #3b82f6;
	font-size: 17px;
}

.back-btn a:hover {
	text-decoration: underline;
}
</style>

</head>

<body>

	<div class="login-container">

		<!-- TOP HEADER -->
		<div class="top-section">
			<h1>ADMIN PANEL</h1>
			<p>Employee Leave Management System</p>
		</div>

		<!-- FORM SECTION -->
		<div class="form-section">


			<%
			String error = request.getParameter("error");
			if ("invalid".equals(error)) {
			%>
			<div class="error">Invalid Email or Password</div>
			<%
			}
			%>

			<!-- LOGOUT -->
			<%
			String logout = request.getParameter("logout");
			if ("success".equals(logout)) {
			%>
			<div class="success">Logged out successfully</div>
			<%
			}
			%>

			<!-- LOGIN FORM -->
			<form action="<%=request.getContextPath()%>/LoginServlet"
				method="post">

				<!-- EMAIL -->
				<div class="input-box">

					<input type="email" name="email" placeholder="Email" required>

					<i class="fa-regular fa-user"></i>

				</div>

				<!-- PASSWORD -->
				<div class="input-box">

					<input type="password" name="password" placeholder="Password"
						required> <i class="fa-solid fa-lock"></i>

				</div>

				<!-- SUBMIT BUTTON -->
				<button type="submit" class="btn">LOGIN →</button>

			</form>

		</div>

	</div>

</body>
</html>