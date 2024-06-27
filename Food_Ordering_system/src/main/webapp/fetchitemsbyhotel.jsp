<%@page import="com.java.foodmanagmentsystem.entity.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fetch Products by Hotel</title>
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
form {
    border: 2px solid black;
    width: 320px;
    height: 200px;
    background-color: F0E68C;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: background-color 0.6s;
    
}




label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
	color: #fff;
}

select, input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 20px;
}

input[type="submit"] {
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background: linear-gradient(to right, #11998e, #38ef7d);
	color: white;
	cursor: pointer;
	font-size: 16px;
	display: block;
	margin: 0 auto;
}

input[type="submit"]:hover {
	background: linear-gradient(to right, #09f544, #b5b759);
	color: #f52a07;
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
            <a href="customerlogout">Logout</a> 
        </div>
    </div>
    <% List<Hotel> list = (List<Hotel>) request.getAttribute("allhotellist"); %>
    <form action="fetchproductsbyhotel">
        <label for="hotel" id="option"><h1>Hotel Options Available</h1></label>
        <select name="hotel" id="hotel">
            <option>Hotel Name</option>
            <% if (list != null) { %>
                <% for (Hotel item : list) { %>
                    <option><%= item.getName() %></option>
                <% } %>
            <% } %>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>

</html>
