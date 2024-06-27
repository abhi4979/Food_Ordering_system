<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
div{
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
    #btn {
	background: linear-gradient(to right, #11998e, #38ef7d);

	width: 138px;
	margin-left: 17%;
	margin-top: 2px;
	color: white;
}
#btn:hover {
	color: #f52a07;
	background: linear-gradient(to right, #09f544, #b5b759);
}
.price{
  color:#000000;
}
</style>
</head>
<body>
  <div>
	<form action="fetchproductsbetweenpricerange">
		<label class="price"><b>Enter minPrice: </b><input type="number" name="minprice"><br><br></label>
		<label class="price"><b>Enter maxPrice:</b> <input type="number" name="maxprice"><br><br></label>
		<input type="submit" id="btn">

	</form>
	</div>

</body>
</html>