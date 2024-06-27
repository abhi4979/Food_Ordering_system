<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BiteBuddy</title>
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
    flex-direction: column;
    min-height: 100vh;
    background-image: url('https://i.pinimg.com/originals/08/9b/ce/089bce0b11f9a94c850061e14843f511.jpg');
    background-size: cover;
    background-position: center;
}

header {
    background-color: #0066cc;
    height: 28px;
    padding: 20px 0;
    color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.8);
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo-container {
    display: flex;
    align-items: center;
    margin-left: 20px;
}

.logo {
    font-size: 32px;
    font-weight: bold;
    color: #ffffff;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.nav {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 30px;
    flex-grow: 1;
}

.nav a {
    font-size: 20px;
    text-decoration: none;
    color: black;
    margin: 0 10px;
}

.nav a:hover {
    text-decoration: underline;
}

.project {
    position: relative;
    margin: 20px;
    padding: 20px;
    background-color: #0066cc;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 70px;
    height: 15px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    transition: transform 0.2s;
}

.project:hover {
    transform: scale(1.05);
}

.project p {
    font-size: 23px;
    height: 20px;
    margin: 0;
    color: black;
}

.project:hover .options {
    display: block;
}

.options {
    display: none;
    position: absolute;
    width: 250px;
    height: 170px;
    background-color: #fff;
    padding: 10px;
    text-align: left;
    top: 100%;
    left: 0;
    border-radius: 0 0 10px 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.options a {
    display: block;
    text-decoration: none;
    color: #0066cc;
    margin: 5px 0;
    font-size: 20px;
}

.options a:hover {
    text-decoration: underline;
}

#d2 {
    width: 150px;
    height: 160px;
}

#d3 {
    width: 150px;
    height: 160px;
}

#d4 {
    width: 150px;
    height: 80px;
}

#restaurant {
    width: 210px;
}

.btn {
    border-radius: 7%;
    margin-left: 20px;
    text-decoration: none;
    transition: transform 0.2s;
}

.btn:hover {
    transform: scale(1.05);
}

#para {
    font-size: 30px;
    font-family: "Times New Roman", Times, serif;
    color: #fff;
    margin: 100px 200px 200px 100px;
    opacity: 0;
    transition: opacity 1s ease-in-out;
}

/* Keyframes for the animation */
@keyframes showLetter {
    0% {
        opacity: 0;
        transform: translateY(10px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Styling for the animated content */
.content {
    color: #fff;
    margin-top: 30px;
    font-size: 44px;
    display: inline-block;
}

.content span {
    opacity: 0;
    display: inline-block;
    animation: showLetter 0.2s forwards;
}

.content span:nth-child(1) {
    animation-delay: 0s;
}

.content span:nth-child(2) {
    animation-delay: 0.05s;
}

.content span:nth-child(3) {
    animation-delay: 0.1s;
}

.content span:nth-child(4) {
    animation-delay: 0.15s;
}

.content span:nth-child(5) {
    animation-delay: 0.2s;
}

.content span:nth-child(6) {
    animation-delay: 0.25s;
}

.content span:nth-child(7) {
    animation-delay: 0.3s;
}

.content span:nth-child(8) {
    animation-delay: 0.35s;
}

.content span:nth-child(9) {
    animation-delay: 0.4s;
}

.content span:nth-child(10) {
    animation-delay: 0.45s;
}

.content span:nth-child(11) {
    animation-delay: 0.5s;
}

.content span:nth-child(12) {
    animation-delay: 0.55s;
}

.content span:nth-child(13) {
    animation-delay: 0.6s;
}

.content span:nth-child(14) {
    animation-delay: 0.65s;
}

.content span:nth-child(15) {
    animation-delay: 0.7s;
}

.content span:nth-child(16) {
    animation-delay: 0.75s;
}

.content span:nth-child(17) {
    animation-delay: 0.8s;
}

main {
    flex: 1;
}

footer {
    background-color: #0066cc;
    color: #333;
    padding: 20px;
    text-align: center;
    width: 100%;
    box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
    font-size: 14px;
    margin-top: 400px;
}

footer a {
    color: #fff;
    text-decoration: none;
}

footer a:hover {
    text-decoration: underline;
}

.footer-links {
    margin-top: 10px;
    display: flex;
    justify-content: center;
    gap: 20px;
    font-size: 16px;
}
#start{
   font-size:30px;
   border-radius:15%;
   width:100px;
}
</style>
</head>
<body>
    <header>
        <div class="logo-container">
            <span class="logo">BiteBuddy</span>
        </div>
        <div class="nav">
            <a href="HomeProject.jsp" id="home">Home</a>
            <div class="project">
                <p>Chef</p>
                <div class="options" id="d1">
                    <a href="https://www.foodfood.com/chef/chef-harpal-singh-sokhi/">Chef
                        Harpal Singh Sokhi</a> <a
                        href="https://www.foodfood.com/chef/masterchef-sanjeev-kapoor/">Masterchef
                        Sanjeev Kapoor</a> <a
                        href="https://www.foodfood.com/chef/chef-anupa-das/">Chef
                        Anupa Das</a> <a
                        href="https://www.foodfood.com/chef/chef-rakesh-sethi/">Chef
                        Rakesh Sethi</a> <a
                        href="https://www.foodfood.com/chef/chef-shipra-khanna/">Chef
                        Shipra Khanna</a> <a
                        href="https://www.foodfood.com/chef/chef-shazia-khan/">Chef
                        Sazia Khan</a>
                </div>
            </div>
            <div class="project">
                <p>Recipes</p>
                <div class="options" id="d2">
                    <a href="https://www.foodfood.com/recipes/course/">Course</a> <a
                        href="https://www.foodfood.com/recipes/cuisine/">Cuisine</a> <a
                        href="https://www.foodfood.com/recipes/ingredients/">Ingredients</a>
                    <a href="https://www.foodfood.com/recipes/occasion/">Occasion</a> <a
                        href="https://www.foodfood.com/recipes/meal-type/">Meal type</a> <a
                        href="https://www.foodfood.com/recipes/diet/">Diet</a>
                </div>
            </div>
            <div class="project">
                <p>Videos</p>
                <div class="options" id="d3">
                    <a href="https://www.foodfood.com/videos/course/">Course</a> <a
                        href="https://www.foodfood.com/videos/cuisine/">Cuisine</a> <a
                        href="https://www.foodfood.com/videos/ingredients/">Ingredients</a>
                    <a href="https://www.foodfood.com/videos/occasion/">Occasion</a> <a
                        href="https://www.foodfood.com/videos/meal-type/">Meal type</a> <a
                        href="https://www.foodfood.com/videos/diet/">Diet</a>
                </div>
            </div>
            <div class="project" id="restaurant">
                <p>Add Restaurant</p>
                <div class="options" id="d4">
                    <a href="addHotel">Register</a> <a href="HotelLogin.jsp">Login</a>
                </div>
            </div>
            <button class="btn">
                <a href="CustomerLogin.jsp">Login</a>
            </button>
            <button class="btn">
                <a href="addcustomer">Sign up</a>
            </button>
        </div>
    </header>

    <div class="content"></div>
    
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const content = "Welcome to BiteBuddy!";
            const container = document.querySelector(".content");
            for (let i = 0; i < content.length; i++) {
                const span = document.createElement("span");
                if (content[i] === " ") {
                    span.innerHTML = "&nbsp;";
                } else {
                    span.textContent = content[i];
                }
                container.appendChild(span);
            }

            // Hide "Welcome to BiteBuddy" when hovering over options
            const options = document.querySelectorAll('.options');
            options.forEach(option => {
                option.addEventListener('mouseenter', () => {
                    container.style.display = 'none';
                });
                option.addEventListener('mouseleave', () => {
                    container.style.display = 'inline-block';
                });
            });

            // Show the paragraph after the welcome text animation is complete
            const animationDuration = content.length * 0.1 * 1000; // total animation duration in milliseconds
            setTimeout(() => {
                document.getElementById('para').style.opacity = '1';
            }, animationDuration + 100); // adding extra delay for better visual effect
        });
    </script>

    <p id="para">In an enticing culinary journey, BiteBuddy offers a
        diverse menu catering to every palate. From farm-fresh ingredients to
        doorstep delivery, their commitment to freshness and speed ensures a
        delightful dining experience without leaving the comfort of home. With
        just a click, customers can access their favorite meals from an
        extensive selection, delivered hot and fresh. BiteBuddy extends
        exclusive offers and discounts, inviting customers to join their
        community and be the first to enjoy special promotions and discover
        new menu items. Emphasizing safety, BiteBuddy ensures contactless
        delivery, prioritizing the well-being of their customers. Their menu
        caters to everyone, from food enthusiasts to vegans, promising
        something to satiate every craving. Whether one's preference is for
        savory or spicy, BiteBuddy promises a culinary adventure, inviting
        customers to explore their menu and find their new favorite dish. With
        BiteBuddy, satisfaction is guaranteed, promising an indulgent dining
        experience that transcends the ordinary.</p>

    <a href="CustomerHomePage.jsp"><button id="start">Start</button></a>
    
    <footer>
        <div class="footer-links">
            <a href="https://www.foodfood.com/contact-us/">Contact</a>
            <a href="mailto:support@bitebuddy.com">Email</a>
            <a href="https://www.foodfood.com/aboutus/">About Us</a>
        </div>
        <p>© 2024 Condé Nast. All rights reserved. The New Yorker may earn a portion of sales from products that are purchased through our site as part of our Affiliate Partnerships with retailers. The material on this site may not be reproduced, distributed, transmitted, cached or otherwise used, except with the prior written permission of Condé Nast.</p>
        <p><a href="https://www.foodfood.com/privacy-policy/">Privacy Policy</a> | <a href="https://www.foodfood.com/terms-conditions/">Terms and Conditions</a></p>
    </footer>
</body>
</html>
