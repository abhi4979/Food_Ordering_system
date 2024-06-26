<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
    body {
        display: flex;
        background-image: url('backgroundhotel.jpg');
        justify-content: center;
        align-items: center;
        height: 100vh;
        
    }
    #maindiv {
        border: 2px solid black;
        width: 320px;
        height: 370px;
            background-color: rgb(23 177 147);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        transition: background-color 0.6s; 
    }
    input {
        border: 2px solid black;
        text-decoration: none;
        text-align: center;
        display: block;
        font-size: 20px;
        margin: -6px;
        padding: 7px
        width: 218px;
        border-radius: 8px;
        background-color: white; /* Added background color */
        color: rgb(43, 10, 10);
    }
    #abc {
        margin-top: 17px;
    }
    #btn{
    	  background: linear-gradient(to right, #11998e, #38ef7d);
    	width: 158px;
    margin-left: -3%;
    margin-top: 7px;
    color:white;
    }
     h3{
    	font-weight: bold;
    	margin-top:-35px;
    	color:white;
    	font-size: 28px;
    }
    #btn:hover{
      color: #f52a07;
    background: linear-gradient(to right, #09f544, #b5b759);
    }
    h3:hover{
      color: #f52a07;
    }
    .inputopt{
    	margin-top:20px;
    }
    
</style>
<body>
<div id="maindiv">
<h3>Customer Register Form</h1>
<div class="inputopt">
<form:form action="savecustomer" modelAttribute="customerobj" >
 <form:input path="name"  placeholder="Enter Name" name="name" required="required" type="text"/><br>
<form:input path="email"  placeholder="Enter Email" required="required" type="email"/><br>
 <form:input path="address"  placeholder="Enter Address" required="required"/><br>
 <form:input path="mobileNumber"  id="mobileNumber" placeholder="Enter Mobile Number" required="required" type="text"/><br>
 <form:input path="password"  placeholder="Enter Password" name="pass1" required="required" type="password"/><br>
 <form:input path="confirmpassword"  placeholder="Enter Confirm Password" name="pass2" required="required" type="password"/><br>
 
</div>
<input type="submit" id="btn">

</form:form>
</div>
  <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("customerForm");

            form.addEventListener("submit", function(event) {
            	const mobileNumberInput = document.getElementById("mobileNumber");
            	  // Validate mobile number format
                const mobilePattern = /^[6-9]\d{9}$/;
                if (!mobilePattern.test(mobileNumberInput.value.trim())) {
                    alert("Mobile number must be a 10-digit number and it should not start with 0-5");
                    event.preventDefault();
                    return;
                }

            }
</body>
</html>