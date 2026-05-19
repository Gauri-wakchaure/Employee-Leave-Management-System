<%@ page import="java.util.*, dao.LeaveDAO, model.Leave"%>

<%
Integer empId = (Integer) session.getAttribute("empId");
String name = (String) session.getAttribute("empName");

if (empId == null || name == null) {
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
<title>Employee Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial;
}

body{
display:flex;
background:#f4f6f9;
}

/* Sidebar */

.sidebar{
width:240px;
background:#1f2a36;
color:white;
height:100vh;
padding:20px;
}

.logo{
font-size:18px;
font-style:italic;
color:#aab7c4;
text-align:center;
margin-bottom:40px;
font-family:Georgia;
}

.sidebar a{
display:flex;
align-items:center;
gap:12px;
color:#cbd5e1;
padding:14px;
text-decoration:none;
border-radius:8px;
margin-bottom:12px;
cursor:pointer;
font-family:Georgia;
transition:.3s;
}

.sidebar a:hover{
background:#111827;
transform:translateX(5px);
color:white;
}

/* Main */

.main{
flex:1;
padding:30px;
}

.section{
display:none;
}

.active{
display:block;
}

/* Leave Card */

.leave-card{
width:450px;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 8px 25px rgba(0,0,0,.12);
margin:auto;
}

.leave-title{
font-family:Georgia;
text-align:center;
margin-bottom:25px;
color:#333;
}

form{
display:flex;
flex-direction:column;
}

label{
font-family:Georgia;
font-weight:bold;
margin-bottom:6px;
margin-top:10px;
}

input,select{
padding:12px;
border:1px solid #ccc;
border-radius:8px;
font-size:15px;
outline:none;
margin-bottom:10px;
transition:.3s;
}

input:focus,select:focus{
border-color:#36d1dc;
box-shadow:0 0 6px rgba(54,209,220,.25);
}

button{
background:#1f2a36;
color:white;
border:none;
padding:14px;
border-radius:8px;
cursor:pointer;
font-size:16px;
margin-top:15px;
transition:.3s;
}

button:hover{
background:#28b5c0;
transform:translateY(-2px);
}

/* Table */

.history-title{
font-family:Georgia;
margin-bottom:20px;
color:#333;
}

table{
width:100%;
border:3px;
border-collapse:collapse;
background:white;
border-radius:10px;
overflow:hidden;
box-shadow:0 5px 20px rgba(0,0,0,.08);
}

th{
background:#1f2a36;
color:white;
padding:14px;
font-family:Georgia;
}

td{
padding:12px;
text-align:center;
border-bottom:1px solid #eee;
}

tr:hover{
background:#f9f9f9;
}
</style>

</head>

<body>

<div class="sidebar">

<h2 class="logo">Employee Leave Management System</h2>

<a onclick="show('apply')">
<i class="fa-solid fa-file-circle-plus"></i>
Apply Leave
</a>

<a onclick="show('view')">
<i class="fa-solid fa-calendar-check"></i>
Leave History
</a>

</div>

<div class="main">

<!-- APPLY -->

<div id="apply" class="section active">

<div class="leave-card">

<h2 class="leave-title">Employee Leave Form</h2>

<form action="<%=request.getContextPath()%>/ApplyLeaveServlet"
method="post">

<input type="hidden" name="empId" value="<%=empId%>">

<label>Start Date</label>
<input type="date" name="startDate" required>

<label>End Date</label>
<input type="date" name="endDate" required>

<label>Leave Type</label>

<select name="leaveType">
<option>Casual Leave</option>
<option>Voting Leave</option>
<option>Sick Leave</option>
<option>Wedding Leave</option>
<option>Maternity Leave</option>
<option>Emergency Leave</option>
<option>Holiday Leave</option>
<option>Bereavement Leave</option>
<option>Study Leave</option>
</select>

<button type="submit">Apply Leave</button>

</form>

</div>

</div>

<!-- HISTORY -->

<div id="view" class="section">

<h2 class="history-title">My Leaves</h2>

<table>

<tr>
<th>Name</th>
<th>Type</th>
<th>Start</th>
<th>End</th>
<th>Status</th>
</tr>

<%
if(list!=null && !list.isEmpty()){

for(Leave l:list){
%>

<tr>
<td><%=name%></td>
<td><%=l.getLeaveType()%></td>
<td><%=l.getStartDate()%></td>
<td><%=l.getEndDate()%></td>
<td><%=l.getStatus()%></td>
</tr>

<%
}

}else{
%>

<tr>
<td colspan="5">No Leave History Found</td>
</tr>

<%
}
%>

</table>

</div>

</div>

<script>
function show(id){
document.querySelectorAll('.section')
.forEach(s=>s.classList.remove('active'));

document.getElementById(id)
.classList.add('active');
}
</script>

</body>
</html>