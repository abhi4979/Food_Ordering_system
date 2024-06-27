<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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

.main-div {
    border: 2px solid black;
    width: 420px;
    height: 580px; /* Increased height to accommodate the new button */
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
    width: 318px;
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
    margin-left: 25%;
    margin-top: 12px;
    color: white;
}

h1 {
    font-size: 40px;
    font-weight: bold;
    margin-top: -2px;
    color: white;
}

#btn:hover {
    color: #f52a07;
    background: linear-gradient(to right, #09f544, #b5b759);
}

h1:hover {
    color: #FFFF00;
}

.dropdown {
    position: absolute;
    top: 10px; /* Adjust this value to change the vertical position */
    right: 10px; /* Adjust this value to change the horizontal position */
    z-index: 1000; /* Ensure it's on top of other elements */
    border: none; /* Hide border */
    background: none; /* Ensure no background is set */
    padding: 0; /* Remove padding */
}

.dropbtn {
    width: 40px; /* Set desired width */
    height: 40px; /* Set desired height */
    padding: 10px; /* Set desired padding */
    font-size: 24px; /* Set desired font size */
    background-color: white; /* Set background color */
    border: none; /* Remove border */
    cursor: pointer; /* Add cursor pointer */
    border-radius: 18%;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 120px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1001; /* Ensure it's on top of other elements */
    border-radius: 5px;
    top: 40px; /* Adjust this value to move up or down */
    right: 0; /* Adjust this value to move left or right */
    border: none; /* Hide border */
    padding: 0; /* Remove padding */
}

.dropdown-content a {
    color: #333; /* Adjust text color */
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    border: none; /* Hide any borders on links */
}

.dropdown-content a:hover {
    background-color: #ddd; /* Adjust hover background color */
}

.show {
    display: block;
}

.links {
    margin-top: 20px;
}

.links a {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border-radius: 5px;
    text-decoration: none; /* Remove underline */
}

.links a:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
    <div class="dropdown">
        <button class="dropbtn"><i class="fas fa-ellipsis-v"></i></button>
        <div class="dropdown-content">
            <a href="HomeProject.jsp">Home</a>
            <a href="https://www.foodfood.com/aboutus/">About</a>
            <a href="hotellogout">Logout</a> 
        </div>
    </div>

    <div class="main-div">
        <h1>Add Product</h1>
        <form action="saveproduct" method="post">
            <input type="text" name="name" placeholder="Enter Name" />
            <br>
            <input type="text" name="type" placeholder="Enter Type" />
            <br>
            <input type="number" name="cost" placeholder="Enter Cost" />
            <br>
            <input type="number" name="discount" placeholder="Discount" />
            <br>
            <input type="submit" id="btn" value="Submit">
        </form>
        <div class="links">
            <a href="HotelOptions.jsp">Back to main menu</a>
        </div>
    </div>

    <script>
    // JavaScript to handle dropdown visibility
    document.addEventListener("DOMContentLoaded", function() {
        const dropbtn = document.querySelector(".dropbtn");
        const dropdownContent = document.querySelector(".dropdown-content");

        dropbtn.addEventListener("click", function(e) {
            e.stopPropagation(); // Prevent the click event from bubbling up
            dropdownContent.classList.toggle("show");
        });

        window.addEventListener("click", function() {
            dropdownContent.classList.remove("show");
        });
    });
    </script>
</body>
</html>
