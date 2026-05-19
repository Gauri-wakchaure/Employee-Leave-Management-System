<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*,dao.LeaveDAO,model.Leave"%>

<%
Integer empId = (Integer) session.getAttribute("empId");

if (empId == null) {
	response.sendRedirect(request.getContextPath() + "/employee/employeeLogin.jsp");
	return;
}

LeaveDAO dao = new LeaveDAO();
List<Leave> list = dao.getLeavesByEmpId(empId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leave History</title>
</head>
<body>

	<h2>Leave History</h2>

	<table border="1">

		<tr>
			<th>ID</th>
			<th>Type</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Status</th>
		</tr>

		<%
		for (Leave l : list) {
		%>

		<tr>
			<td><%=l.getId()%></td>
			<td><%=l.getLeaveType()%></td>
			<td><%=l.getStartDate()%></td>
			<td><%=l.getEndDate()%></td>
			<td><%=l.getStatus()%></td>
		</tr>

		<%
		}
		%>

	</table>

</body>
</html>