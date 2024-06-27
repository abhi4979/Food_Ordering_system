<%@page import="com.java.foodmanagmentsystem.entity.Item"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Summary</title>
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
    margin-bottom:0; /* Push the button to the bottom */
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

h1 {
    color: #fff;
    font-size: 40px;
}
</style>
</head>
<body>
    <div class="container">
        <h1>${message}</h1>
        <h1>Order Summary</h1>
        <%try { %>
        <% List<Item> items = (List<Item>) session.getAttribute("itemlist"); %>
        <% if (items != null && !items.isEmpty()) { %>
        <table cellpadding="20px" border="1px">
            <tr>
                <th>Name</th>
                <th>Cost</th>
                <th>Type</th>
                <th>Quantity</th>
                <th>Remove</th>
            </tr>
            <% for (Item i : items) { %>
            <tr>
                <td><%= i.getName() %></td>
                <td><%= i.getCost() %></td>
                <td><%= i.getType() %></td>
                <td><%= i.getQuantity() %></td>
                <td><a href="removeitem?id=<%=i.getId()%>">remove</a></td>
            </tr>
            <% } %>
        </table>
        <div>
        <button><a href="addfoodorder" class="btn">Confirm</a></button>
        <button><a href="fetchallproducts" class="btn">back</a></button>
        </div>
        <% } else { %>
        <h1>No items are added. Please add at least one item.</h1>
        <% } %>
        <% } catch (Exception e) { %>
        <h1>No items found in this Hotel. Please try another Hotel.</h1>
        <% e.printStackTrace(); %>
        <% } %>
    </div>
</body>
</html>
