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
        display: flex;
        background-color: #F98B88; 
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-image: repeating-linear-gradient(-45deg, rgba(0,0,0, 0.4), rgba(0,0,0, 0.1) 1px, transparent 1px, transparent 6px);
    background-size: 40px 40px;
    }
    div {
        border: 2px solid black;
        width: 320px;
        height: 370px;
          background-color: rgb(23 177 147);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
        border-radius: 8px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        transition: background-color 0.6s; 
        background-image: repeating-linear-gradient(39deg, rgba(255,255,255, 0.1), rgba(255,255,255, 0.1) 1px, transparent 0px, transparent 2px);
        
    }
    a {
    border: 2px solid black;
    text-decoration: none;
    text-align: center;
    display: block;
    font-size: 20px;
    margin: 6px;
    padding: 8px;
    width: 180px;
    border-radius: 8px;
    background-color: rgb(235 243 235);
    background: linear-gradient(to right, #11998e, #38ef7d);
    color: white;
    transition: background-color 0.3s, color 0.3s;
    }
   a:hover {
           color: #f52a07;
    background: linear-gradient(to right, #09f544, #b5b759);
    }
    #abc {
        margin-top: 17px;
    }
    h1{
    	font-weight: bold;
    	margin-bottom:85px;
    	color:white;
    }
    h1:hover{
    color:#f52a07;
    }
</style>
<body>
 <div>
 	${message}
    <h1>Hotel Home</h1>
<a href="addHotel" id="abc">Register</a>
<a href="HotelLogin.jsp">Login</a>
</div>
</body>
</html>