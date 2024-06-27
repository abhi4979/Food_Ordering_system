<%@page import="com.java.foodmanagmentsystem.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product List</title>
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

.container {
    display: flex;
    flex-direction: column;
    justify-content: flex-start; /* Align items to the top */
    align-items: center;
    height: 100vh; /* Adjust height as needed */
    padding: 20px;
}

table {
    width: 100%;
    margin-bottom: 20px; /* Add margin at the bottom of the table */
    border-collapse: collapse;
    background-color: #fff;
}

button {
    margin-top: 10px; /* Add space between buttons */
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    background-color: #007BFF;
    color: white;
    cursor: pointer;
}

button a {
    color: white;
    text-decoration: none;
}

button:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
    
    <div class="container">
        <h1>${message}</h1>
        <% 
            List<Product> products = null;
            try {
                products = (List<Product>) request.getAttribute("productsList");
                if (products == null) {
                    throw new NullPointerException("Products list is null");
                }
        %>
        <table cellpadding="20px" border="1px">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Type</th>
                    <th>Cost</th>
                    <th>Add</th>
                </tr>
            </thead>
            <tbody>
                <% for(Product product : products) { %>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getType() %></td>
                    <td><%= product.getCost() %></td>
                    <td><a href="additem?id=<%=product.getId()%>">Add</a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <button>
            <a href="viewaddeditemstocustomer.jsp">Proceed to buy</a>
        </button>
        <button>
            <a href="CustomerOptions.jsp">Back to Menu</a>
        </button>
        <% 
            } catch (NullPointerException e) {
        %>
            <h1>Products list is not available. Please try again later.</h1>
        <% 
            } catch (Exception e) {
        %>
            <h1>An unexpected error occurred: <%= e.getMessage() %></h1>
        <% 
            } 
        %>
    </div>
</body>

</html>
