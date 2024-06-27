<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
	margin-top: 2px;
	color: white;
}

h1 {
	font-weight: bold;
	margin-bottom: 66px;
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
	<div>
		${message}

		<h1>Admin Login Form</h1>

		<form action="adminloginvalidate" method="post">
			<input type="email" name="email" id="email" placeholder="Enter Your email"
				required="required"><br> <input type="password"
				name="password" placeholder="Enter Password" required="required"><br>

			<input type="submit" value="Login" id="btn">

		</form>
	</div>
	<script>
document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("myadmin");
    const passwordInput = form.querySelector('input[type="password"]');

    form.addEventListener("submit", function(event) {
        const password = passwordInput.value;

        // Password validation criteria
        const minLength = 8;
        const hasUpperCase = /[A-Z]/.test(password);
        const hasLowerCase = /[a-z]/.test(password);
        const hasDigit = /\d/.test(password);
        const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);

        // Check if password meets criteria
        if (password.length < minLength || !hasUpperCase || !hasLowerCase || !hasDigit || !hasSpecialChar) {
            alert("Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character.");
            event.preventDefault(); // Prevent form submission
        }
    });
});
</script>
<script>
document.getElementById('myadmin').addEventListener('submit', function(event) {
	let valid = true;
	// Validate email
	const email = document.getElementById('email').value;
	const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	if (email.trim() === '') {
		valid = false;
		document.getElementById('emailError').textContent = 'Email is required.';
	} else if (!emailPattern.test(email)) {
		valid = false;
		document.getElementById('emailError').textContent = 'Invalid email format.';
	}

}
</script>
</body>
</html>