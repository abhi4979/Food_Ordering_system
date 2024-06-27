<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

div {
    border: 2px solid black;
    width: 320px;
    height: 440px; /* Increased height to accommodate the new button */
    background-color: F0E68C;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
    border-radius: 8px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: background-color 0.6s;
    padding-bottom: 20px; /* Added padding at the bottom */
}

input {
    border: 2px solid black;
    text-decoration: none;
    text-align: center;
    display: block;
    font-size: 20px;
    margin: -6px;
    padding: 7px;
    width: 218px; /* Fixed the width syntax */
    border-radius: 8px;
    background-color: white; /* Added background color */
    color: rgb(43, 10, 10);
}

#btn {
    background: linear-gradient(to right, #11998e, #38ef7d);
    width: 158px;
    margin-left: 15%;
    margin-top: 7px;
    color: white;
}

#btn:hover {
    color: #f52a07;
    background: linear-gradient(to right, #09f544, #b5b759);
}

.option {
    color: #000000;
    font-size: 20px;
}

.back-btn {
    margin-top: 20px; /* Added margin to separate from the submit button */
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none; /* Remove underline */
}

.back-btn:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
    <div>
        <form:form action="saveitemorder" modelAttribute="itemobj">
            <label class="option"><b>Name: </b><form:input path="name" readonly="true" /></label>
            <br>
            <label class="option"><b>Type: </b><form:input path="type" readonly="true" /></label>
            <br>
            <label class="option"><b>Cost: </b><form:input path="cost" readonly="true" /></label>
            <br>
            <label class="option"><b>Enter Quantity: </b><form:input path="quantity" type="number" /></label>
            <br>
            <input type="submit" id="btn" value="Submit">
        </form:form>
        <a href="fetchallproducts" class="back-btn">Back</a> <!-- Adjusted the button to be a styled link -->
    </div>
</body>
</html>
