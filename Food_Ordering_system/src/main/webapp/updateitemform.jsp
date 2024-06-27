<%@ page import="com.java.foodmanagmentsystem.entity.Item" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Update Item</title>
</head>
<body>
    <h1>Update Item</h1>
    <form:form method="post" action="updateiteminfo" modelAttribute="existingitemInfo">
        <input type="hidden" name="id" value="${existingitemInfo.id}">
        <div>
            <label for="name">Name:</label>
            <form:input path="name" value="${existingitemInfo.name}" />
        </div>
        <div>
            <label for="cost">Cost:</label>
            <form:input path="cost" value="${existingitemInfo.cost}" />
        </div>
        <div>
            <label for="type">Type:</label>
            <form:input path="type" value="${existingitemInfo.type}" />
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <form:input path="quantity" value="${existingitemInfo.quantity}" />
        </div>
        <div>
            <button type="submit">Update</button>
        </div>
    </form:form>
</body>
</html>
