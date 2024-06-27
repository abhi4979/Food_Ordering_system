<%@ page import="com.java.foodmanagmentsystem.entity.Product"%>
<%@ page import="java.util.List" isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
	border-collapse: collapse;
	width: 900px;
	margin: 20px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background-color: white;
}

th, td {
	padding: 10px;
	text-align: left;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

a {
	color: #4CAF50;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.links {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.links a {
	margin: 0 10px;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.links a:hover {
	background-color: #45a049;
}
h1{
 color:#fff;
}
h1:hover{
   color:#FFFF00;
}
.dropdown {
    position: absolute;
    top: 10px; /* Adjust this value to change the vertical position */
    right: 10px; /* Adjust this value to change the horizontal position */
    z-index: 1000; /* Ensure it's on top of other elements */
    border: none; /* Hide border */
    background: none; /* Ensure no background is set */
    padding: 0; /* Remove padding */
    
}

.dropbtn {
    width: 40px; /* Set desired width */
    height: 40px; /* Set desired height */
    padding: 10px; /* Set desired padding */
    font-size: 24px; /* Set desired font size */
    background-color: white; /* Set background color */
    border: none; /* Remove border */
    cursor: pointer; /* Add cursor pointer */
    border-radius:18%;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 120px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1001; /* Ensure it's on top of other elements */
    border-radius: 5px;
    top: 40px; /* Adjust this value to move up or down */
    right: 0; /* Adjust this value to move left or right */
    border: none; /* Hide border */
    padding: 0; /* Remove padding */
}

.dropdown-content a {
    color: #333; /* Adjust text color */
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    border: none; /* Hide any borders on links */
}

.dropdown-content a:hover {
    background-color: #ddd; /* Adjust hover background color */
}

.show {
    display: block;
}
</style>
</head>
<body>
    <div class="dropdown">
        <button class="dropbtn"><i class="fas fa-ellipsis-v"></i></button>
        <div class="dropdown-content">
            <a href="HomeProject.jsp">Home</a>
            <a href="https://www.foodfood.com/aboutus/">About</a>
            <a href="hotellogout">Logout</a> 
        </div>
    </div>
	<div align="center">
		<h1>Product Management</h1>
		${message}
		<% List<Product> products = (List<Product>) request.getAttribute("products"); %>
		<table border="1">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Type</th>
				<th>Cost</th>
				<th>Discount</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
			<% if (products != null) { 
               for (Product product : products) { %>
			<tr>
				<td><%= product.getId() %></td>
				<td><%= product.getName() %></td>
				<td><%= product.getType() %></td>
				<td><%= product.getCost() %></td>
				<td><%= product.getDiscount() %></td>
				<td><a href="updateproduct?id=<%= product.getId() %>">Update</a></td>
				<td><a href="delete?id=<%= product.getId() %>">Delete</a></td>
			</tr>
			<%   } 
           } %>
		</table>
		<div class="links">
			<a href="HotelOptions.jsp">Back to main menu</a> <a
				href="hotellogout">Log Out</a>
		</div>
	</div>
	<script>
    // JavaScript to handle dropdown visibility
    document.addEventListener("DOMContentLoaded", function() {
        const dropbtn = document.querySelector(".dropbtn");
        const dropdownContent = document.querySelector(".dropdown-content");

        dropbtn.addEventListener("click", function(e) {
            e.stopPropagation(); // Prevent the click event from bubbling up
            dropdownContent.classList.toggle("show");
        });

        window.addEventListener("click", function() {
            dropdownContent.classList.remove("show");
        });
    });
    </script>
</body>
</html>
