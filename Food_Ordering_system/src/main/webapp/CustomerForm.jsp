<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Register Form</title>
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

div {
    border: 2px solid black;
    width: 320px;
    height: 500px;
    background-color: F0E68C;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
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
    padding: 7px width: 218px;
    border-radius: 8px;
    background-color: white; /* Added background color */
    color: rgb(43, 10, 10);
}

#abc {
    margin-top: 17px;
}

#btn {
    background: linear-gradient(to right, #11998e, #38ef7d);
    width: 158px;
    margin-left: 17%;
    margin-top: -12px;
    color: white;
}

h1 {
    font-weight: bold;
    margin-top: -2px;
    color: white;
}

#btn:hover {
    color: #f52a07;
    background: linear-gradient(to right, #09f544, #b5b759);
}

h1:hover {
    color: #f52a07;
}
</style>
<body>
    <div id="maindiv">
        <h1>Customer Register Form</h1>
        <div class="inputopt">
            <form:form action="savecustomer" modelAttribute="customerobj" id="customerForm">
                <form:input path="name" id="name" placeholder="Enter Name" required="required" type="text" />
                <br>
                <form:input path="email" id="email" placeholder="Enter Email" required="required" type="email" />
                <br>
                <form:input path="password" id="password" placeholder="Enter Password" required="required" type="password" />
                <br>
                <form:input path="address" id="address" placeholder="Enter Address" required="required" />
                <br>
                <form:input path="mobileNumber" id="mobileNumber" placeholder="Enter Mobile Number" required="required" type="text" />
                <br>
                <br><br>
                <input type="submit" id="btn" value="Register">
            </form:form>
        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const form = document.getElementById("customerForm");

            form.addEventListener("submit", function(event) {
                // Get form inputs
                const nameInput = document.getElementById("name");
                const emailInput = document.getElementById("email");
                const passwordInput = document.getElementById("password");
                const addressInput = document.getElementById("address");
                const mobileNumberInput = document.getElementById("mobileNumber");

                // Validate name
                if (nameInput.value.trim() === "") {
                    alert("Name is required.");
                    event.preventDefault();
                    return;
                }

                // Validate email format
                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(emailInput.value.trim())) {
                    alert("Invalid email format.");
                    event.preventDefault();
                    return;
                }

                // Validate password
                const password = passwordInput.value;
                const minLength = 8;
                const hasUpperCase = /[A-Z]/.test(password);
                const hasLowerCase = /[a-z]/.test(password);
                const hasDigit = /\d/.test(password);
                const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

                if (password.length < minLength || !hasUpperCase || !hasLowerCase || !hasDigit || !hasSpecialChar) {
                    alert("Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character.");
                    event.preventDefault();
                    return;
                }

                // Validate mobile number format
                const mobilePattern = /^[6-9]\d{9}$/;
                if (!mobilePattern.test(mobileNumberInput.value.trim())) {
                    alert("Mobile number must be a 10-digit number and it should not start with 0-5");
                    event.preventDefault();
                    return;
                }

              

            });
        });
    </script>
</body>
</html>
