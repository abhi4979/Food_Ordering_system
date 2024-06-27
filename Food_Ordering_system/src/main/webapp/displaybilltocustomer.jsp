<%@page import="com.java.foodmanagmentsystem.entity.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.java.foodmanagmentsystem.entity.FoodOrder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Summary</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 80%;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        margin-top: 50px;
        padding: 20px;
    }

    h1, h2 {
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    .total {
        text-align: right;
        margin-top: 20px;
        font-size: 1.2em;
        font-weight: bold;
    }

    button {
        margin-top: 20px;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        background-color: #007BFF;
        color: white;
        cursor: pointer;
        text-decoration: none;
        margin-right: 10px;
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
        <div class="info">
            <% 
            FoodOrder foodorder = (FoodOrder) request.getAttribute("foodOrderInfo"); 
            if (foodorder != null) {
            %>
            <h1>Order Summary</h1>
            <h2>
                Ordered for: <%= foodorder.getName() %>
            </h2>
            <h2>
                Mobile Number: <%= foodorder.getMobileNumber()%>
            </h2>
            <h2>
                Address: <%= foodorder.getAddress() %>
            </h2>
            <% 
            } else {
            %>
            <h2>No food order information available.</h2>
            <% 
            }
            List<Item> items = (List<Item>) session.getAttribute("itemlist");
            if (items != null && !items.isEmpty()) {
            %>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Cost</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Item i : items) { %>
                    <tr>
                        <td><%= i.getName() %></td>
                        <td><%= i.getType() %></td>
                        <td> &#8377;<%= i.getCost() %></td>
                        <td><%= i.getQuantity() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% 
            } else {
            %>
            <h2>No items found.</h2>
            <% 
            }
            if (foodorder != null) {
            %>
            <div class="total">
                Total Cost: &#8377; <%= foodorder.getTotalPrice() %>
            </div>
            <% 
            }
            %>
        </div>
        <button><a href="HomeProject.jsp">Exit</a></button>
        <button><a href="customerlogout">Logout</a></button>
    </div>
</body>
</html>
