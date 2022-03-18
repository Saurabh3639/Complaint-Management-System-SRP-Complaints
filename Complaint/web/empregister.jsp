<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Details</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<style>
html, body {
	min-height: 100%;
        background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(https://i.postimg.cc/7bvS4jZ5/pexels-pixabay-33266.jpg);
	height: 90%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}

select:focus {
	min-width: 320px;
	width: auto;
}

body, div, form, input, select, textarea, label, p {
	padding: 0;
	margin: 0px;
	outline: none;
	font-family: Roboto, Arial, sans-serif;
	font-size: 14px;
	color: #666;
	line-height: 25px;
}

h1 {
	position: absolute;
	margin: 0;
	font-size: 30px;
	color: #666;
	z-index: 2;
	line-height: 83px;
}

textarea {
	width: calc(100% - 12px);
	padding: 5px;
}

.testbox {
	display: flex;
	justify-content: center;
	align-items: center;
	height: inherit;
	padding: 20px;
}

form {
	width: 50%;
	padding: 55px;
	opacity: 1;
	border-radius: 8px;
	background: #fff;
	box-shadow: 0 0 10px #669999;
}

.banner {
	position: relative;
	height: 70px;
	background-size: cover;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
}

.banner::after {
	content: "";
	background-color: #E0FFFF;
	position: absolute;
	width: 100%;
	height: 100%;
}

.item input, select{
	outline: 0;
	border-radius: 10px;
	background: #F2F2F2;
	width: 100%;
	border: 0;
	margin: 0 0 15px;
	padding: 15px;
	box-sizing: border-box;
	font-size: 14px;
}


textarea {
	width: calc(100% - 12px);
	padding: 5px;
}



.item {
	position: relative;
	margin: 10px 0;
}

.colums {
	display: flex;
	justify-content: space-between;
	flex-direction: row;
	flex-wrap: wrap;
}

.colums div {
	width: 48%;
}



.item i {
	right: 1%;
	top: 30px;
	z-index: 1;
}

.flax {
	display: flex;
	justify-content: space-around;
}

.btn-block button{
	text-transform: uppercase;
	outline: 0;
	border-radius: 10px;
	background: #1ADBE5;
	width: 100%;
	border: 0;
	padding: 15px;
	color: #FFFFFF;
	font-size: 14px;
	cursor: pointer;
}
.btn-block button:hover, .btn-block button:active, .btn-block button:focus{
	background-color: #06C5CF;
	transition: all 1s ease 0s;
}
@media ( min-width : 568px) {
	.name-item, .city-item {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}
	.name-item input, .name-item div {
		width: calc(50% - 20px);
	}
	.name-item div input {
		width: 97%;
	}
	.name-item div label {
		display: block;
		padding-bottom: 5px;
	}
}

.message{
	margin: 15px 220px 0;
	color: #B3B3B3;
	font-size: 12px;
}
.message a{
	color: #06C5CF;
	text-decoration: none;
}
</style>
</head>
<body>

	<div class="testbox">
		<form action="employee.jsp">
			<div class="banner">
				<h1>Register Employee</h1>
			</div>
            	<br>
			<div class="colums">
				<div class="item">
					<label for="fname"><b>Full Name :</b></label> <input id="fname"
						type="text" name="fname" placeholder="Enter Your First Name"
						required />
				</div>
				<div class="item">
					<label for="phone"><b>Contact Number :</b></label> <input
						id="phone" type="tel" name="phone"
						placeholder="Enter Your Phone Number" maxlength="10"
						pattern="[789][0-9]{9}" required />
				</div>
				<div class="item">
					<label for="email"><b>Email Address:</b> </label> <input id="email"
						type="email" name="email" placeholder="Enter Your Email Id"
						required>
				</div>
				<div class="item">
					<label for="Department"><b>Department :</b></label> 
                    <select name="Department" id="Department" required="required">
						<option value="Default">Select Department</option>
					<!--	<option value="Street light">Street light</option>
						<option value="Footpath">Footpath</option>
						<option value="Garbage">Garbage</option>
						<option value="Pipe Leakage">Pipe Leakage</option>
						<option value="Pot Holes">Pot Holes</option>
						<option value="Sanitation">Sanitation</option>
						<option value="CCTV">CCTV</option>
						<option value="Speed breaker">Speed breaker</option>
						<option value="Open Manholes">Open Manholes</option>-->
                                                <%
                                                try
                                                {
                                                    Connection conn1=null;
                                                    Statement stat1=null;
                                                    ResultSet res1=null;
                                                    String data1="select * from department";
                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
                                                    stat1=conn1.createStatement();
                                                    res1 = stat1.executeQuery(data1);
                                                    while(res1.next())
                                                    {
                                                        %>
                                                        <option value="<%=res1.getString("dept_name")%>"><%=res1.getString("dept_name")%></option>
                                                        <%
                                                    }

                                                }
                                                catch(Exception ex)
                                                {
                                                    ex.printStackTrace();
                                                    out.println("Error "+ex.getMessage());
                                                }
                                                
                                                %>
					</select>
				</div>
                <div class="item">
					<label for="date"><b>Joining Date:</b> </label> <input id="date" type="date" name="date" required>
				</div>
                <div class="item">
					<label for="lname"> <b>Password :</b></label> <input id="lname"
						type="password" name="pass" placeholder="Enter Your Password"
						required />
				</div>
				
			</div>
			<div class="btn-block">
				<button type="submit" onclick="showAlert()">Submit</button>
			</div>
                
			<p class="message" style="font-size: 16px;">Already registered ! <a href="emplogin.jsp">Click here to Log in</a></p>

			<p align="center"><a href="index.html">Back to Home</a></p>
			
		</form>
	</div>
    <script>
	function showAlert(){
	    alert("Employee Registered Successfully!");
	}
	</script>

</body>
</html>