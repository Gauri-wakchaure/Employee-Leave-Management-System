<%@ page import="java.util.*, model.Department"%>

<!DOCTYPE html>
<html>
<head>
<title>Department Management</title>

<style>
body{
    font-family: Arial, sans-serif;
    background:#f4f6f9;
    margin:0;
    padding:20px;
}

.container{
    max-width:1100px;
    margin:auto;
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 5px 20px rgba(0,0,0,0.1);
}

h2,h3{
    text-align:center;
    color:#333;
}

form{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:15px;
    margin-bottom:25px;
}

input{
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
}

input:focus{
    border-color:#4CAF50;
    box-shadow:0 0 6px rgba(76,175,80,.25);
}

button{
    background:#4CAF50;
    color:white;
    border:none;
    border-radius:8px;
    padding:12px;
    cursor:pointer;
    font-size:15px;
}

button:hover{
    background:#43a047;
}

.search-box{
    width:300px;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    margin-bottom:20px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#4CAF50;
    color:white;
    padding:12px;
    text-align:left;
}

td{
    padding:12px;
    border-bottom:1px solid #eee;
}

tr:hover{
    background:#f9f9f9;
}

.bottom-bar{
    margin-top:25px;
    text-align:center;
}

.back-btn{
    text-decoration:none;
    background:#555;
    color:white;
    padding:12px 18px;
    border-radius:8px;
}

.back-btn:hover{
    background:#333;
}
</style>

<script>
function searchDepartment(value){
    let rows=document.querySelectorAll("#deptTable tr");

    rows.forEach((row,index)=>{
        if(index===0)return;

        row.style.display=
        row.innerText.toLowerCase().includes(value.toLowerCase())
        ? ""
        : "none";
    });
}
</script>

</head>
<body>

<div class="container">

<h2>Department Management</h2>

<%
Department edit=(Department)request.getAttribute("editDept");
%>

<form action="<%=request.getContextPath()%>/DepartmentServlet" method="post">

<input type="hidden" name="id"
value="<%=(edit!=null)?edit.getId():""%>">

<input type="text" name="department"
placeholder="Department Name"
value="<%=(edit!=null)?edit.getDepartment():""%>" required>

<input type="text" name="shortform"
placeholder="Shortform"
value="<%=(edit!=null)?edit.getShortform():""%>" required>

<input type="number" name="code"
placeholder="Code"
value="<%=(edit!=null)?edit.getCode():""%>" required>

<button type="submit">
<%= (edit!=null) ? "Update Department" : "Add Department" %>
</button>

</form>

<input type="text"
class="search-box"
placeholder="Search Department..."
onkeyup="searchDepartment(this.value)">

<h3>Department List</h3>

<table id="deptTable">

<tr>
<th>ID</th>
<th>Name</th>
<th>Shortform</th>
<th>Code</th>
</tr>

<%
List<Department> list=
(List<Department>)request.getAttribute("deptList");

if(list!=null){
for(Department d:list){
%>

<tr>
<td><%=d.getId()%></td>
<td><%=d.getDepartment()%></td>
<td><%=d.getShortform()%></td>
<td><%=d.getCode()%></td>
</tr>

<%
}
}
%>

</table>

<div class="bottom-bar">
<a class="back-btn"
href="<%=request.getContextPath()%>/admin/adminDashboard.jsp"> Back to Dashboard
</a>
</div>

</div>

</body>
</html>