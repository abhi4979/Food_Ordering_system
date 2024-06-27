<%@page import="com.java.foodmanagmentsystem.entity.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unapproved Hotels</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #333;
    margin: 0;
    padding: 0;
    text-align: center;
    position: relative;
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
    height: 100vh; /* Full viewport height */
    overflow: hidden; /* Prevents scrolling issues */
}

body::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-image: url('https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/f90a7e82536235.5d2067cb2a5c4.jpg');
    background-size: cover;
    background-position: center;
    filter: blur(3px); /* Adjust the blur intensity */
    z-index: -1; /* Ensure the pseudo-element is behind the content */
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	background-color: #fff;
}

th, td {
	padding: 15px;
	text-align: left;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

a {
	text-decoration: none;
	color: #007BFF;
}

a:hover {
	text-decoration: underline;
}

.container {
	text-align: center;
	margin-top: 20px;
}

.container a {
	margin: 0 10px;
	padding: 10px 20px;
	background-color: #007BFF;
	color: #fff;
	border-radius: 5px;
	text-decoration: none;
}

.container a:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%
    List<Hotel> hotels = (List<Hotel>) request.getAttribute("unapprovedhotels");
    %>
	<table border="1">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Address</th>
				<th>Mobile Number</th>
				<th>Status</th>
				<th>Approve</th>
			</tr>
		</thead>
		<tbody>
			<%
            for (Hotel h : hotels) {
            %>
			<tr>
				<td><%=h.getId()%></td>
				<td><%=h.getName()%></td>
				<td><%=h.getEmail()%></td>
				<td><%=h.getAddress()%></td>
				<td><%=h.getM_number()%></td>
				<td><%=h.getStatus()%></td>
				<td><a href="approvehotel?id=<%=h.getId()%>">Approve</a></td>
			</tr>
			<%
            }
            %>
		</tbody>
	</table>

	<div class="container">
		<a href="adminoptions.jsp">Back to Menu</a> <a href="adminlogout">Logout</a>
	</div>
</body>
</html>
