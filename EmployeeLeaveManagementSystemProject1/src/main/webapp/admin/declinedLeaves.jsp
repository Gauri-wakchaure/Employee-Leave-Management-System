<%@ page import="java.util.*,dao.LeaveDAO,model.Leave"%>

<%
LeaveDAO dao = new LeaveDAO();
List<Leave> list = dao.getLeavesByStatus("Declined");
%>

<h4>Declined Leaves</h4>

<table border="1">
	<tr>
		<th>ID</th>
		<th>Emp ID</th>
		<th>Type</th>
		<th>Start</th>
		<th>End</th>
		<th>Status</th>
	</tr>

	<%
	for (Leave l : list) {
	%>

	<tr>
		<td><%=l.getId()%></td>
		<td><%=l.getEmpId()%></td>
		<td><%=l.getLeaveType()%></td>
		<td><%=l.getStartDate()%></td>
		<td><%=l.getEndDate()%></td>
		<td><%=l.getStatus()%></td>
	</tr>

	<%
	}
	%>

</table>