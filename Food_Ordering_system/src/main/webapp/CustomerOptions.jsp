<%@page import="com.java.foodmanagmentsystem.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
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
.main_div{
    border: 2px solid black;
    width: 320px;
    height: 380px;
    background-color: F0E68C;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: background-color 0.6s;
    
}


.main_a {
	border: 2px solid #1a815f;
	text-decoration: none;
	text-align: center;
	display: block;
	font-size: 24px;
	margin: 2px;
	margin-top: -4px;
	padding: 12px;
	width: 180px;
	border-radius: 8px;
	background-color: rgb(235, 243, 235);
	background: linear-gradient(to right, #11998e, #38ef7d);
	color: white;
	transition: background-color 0.3s, color 0.3s;
}

.main_a:hover {
	color: #f52a07;
	background: linear-gradient(to right, #09f544, #b5b759);
	border: 2px solid white;
}

h1:hover {
	color: #FFFF00;
}

#abc {
	margin-top: 17px;
}

h1 {
	font-weight: bold;
	margin-bottom: 34px;
	color: white;
	margin-top: -22px;
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
<body>
    <div class="dropdown">
        <button class="dropbtn"><i class="fas fa-ellipsis-v"></i></button>
        <div class="dropdown-content">
            <a href="HomeProject.jsp">Home</a>
            <a href="https://www.foodfood.com/aboutus/">About</a>
            <a href="customerlogout">Logout</a> 
        </div>
    </div>
	<%Integer customer_id=(Integer)session.getAttribute("customerinfo"); %>

	<%if(customer_id!=null) {

%>
	<div class="main_div">
		<h1>${message}</h1>
		<h1>Choose an Option</h1>
		<!--<a href="fetchitemsbyhotel.jsp">View Products by Hotel</a><br>-->
		<a href="fetchproductbyhotelname" class="main_a">View Products by Hotel</a><br>
		<a href="fetchallproducts" class="main_a">Buy Food</a><br> <a
			href="repricerange.jsp" class="main_a">Display Product By Range</a><br>


		<%} else{%>


		<a href="CustomerLogin.jsp" class="main_a">Login First</a>

		<%} %>
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