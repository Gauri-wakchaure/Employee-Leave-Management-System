<%@ page import="java.util.*,dao.LeaveDAO,model.Leave"%>

<%
LeaveDAO dao = new LeaveDAO();
List<Leave> list = dao.getLeavesByStatus("Pending");
%>

<h4>Pending Leaves</h4>

<table border="1">
	<tr>
		<th>ID</th>
		<th>Emp ID</th>
		<th>Type</th>
		<th>Start</th>
		<th>End</th>
		<th>Status</th>
		<th>Action</th>
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

		<td><a
			href="<%=request.getContextPath()%>/UpdateLeaveStatusServlet?id=<%=l.getId()%>&status=Approved">
				<button>Approve</button>
		</a> <a
			href="<%=request.getContextPath()%>/UpdateLeaveStatusServlet?id=<%=l.getId()%>&status=Declined">
				<button>Decline</button>
		</a></td>

	</tr>

	<%
	}
	%>

</table>