<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <title>Complaint Form</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/complaint.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    </head>

    <body>
        <header role="banner">
            <h1><a href="dashboard.html" id="banner1">Online Complaint Registration</a></h1>
             <ul class="utilities">
               <li class="logout warn"><a href="logout.jsp"><h4 id="logout">Log Out</h4></a></li>
             </ul>
        </header>

        <ul class="nav">
            <li><a href="dashboard.html">Dashboard</a></li>
            <li><a href="complaint.jsp">Post Complaints</a></li>
            <li><a href="feedback.html">Post Feedback</a></li>
            <li><a href="compgetid.jsp">Get Complaint ID</a></li>
            <li><a href="compdetail.jsp">Check Status</a></li>
            <li><a href="contactdept.html">Department Contacts</a></li>
        </ul>

        <div class="container">
            
           <div class="row">
               
               <div class="col-log-3"></div>
               
               <div class="col-log-6">
                   <div class="ui">
                       <h1 class="text-center">POST COMPLAINT HERE</h1><br>
                       <form name="complaintform" action="FileUploadServlet" method="post" enctype="multipart/form-data" class="form-group text-center" onsubmit="return validateForm()">
                           <div class="row">
                               <div class="col-lg-6">
                                   <label>Full Name :</label>
                                   <input type="text" name="fullname" class="form-control" pattern="[a-zA-Z'-'\s]*" required="required" placeholder="Enter Your Full Name">
                               </div>
                               <div class="col-lg-6">
                                   <label>Mobile Number :</label>
                                   <input type="tel" name="number" class="form-control" pattern="[789][0-9]{9}" required="required" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="10" placeholder="Enter your Mobile Number">
                               </div>
                            </div>
                           
                           <br>
                              <div class="row">
                               <div class="col-lg-6">
                                   <label>E-mail :</label>
                                   <input type="email" name="email" id='email' class="form-control" required="required" placeholder="Enter your Email">
                               </div>
                               <div class="col-lg-6">
                                  <label>Department :</label>
                           <select class="form-control" name="complainttype">
                               <option value="Choose Department">Choose Department</option>
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
                            </div>   
                     <br>
                      <label>Describe Your Complaint :</label>
                            <textarea class="form-control" type="textarea" required="required" name="explanation" id="comments" placeholder="Describe..." maxlength="6000" rows="2"></textarea>

                           <br>
                           <div class="row">
                           <div class="col-lg-6">
                        <label for="imageFile">Select Image :</label>
	                   <input type="file" id="imageFile" name="file" class="form-control" multiple>
                            </div>
                            <div class="col-lg-6">
                                <label for="imageFile">Complaint Address :</label>
	                   <input type="text" id="add" name="address" class="form-control" placeholder="Enter Premise Name" required="required">
                            </div>
                            </div>
                            <br>
                                   
                           <button onclick="getLocation()" type="button"  class="btn btn-info btn-block btn-lg">Get Your Location</button><br>
                           <div class="row">
                               <div class="col-lg-6">
                                   <label>Latitude :</label>
                                   <input type="text" id="latValue" name="latitude" class="form-control" >
                               </div>
                               <div class="col-lg-6">
                                   <label>Longitude :</label>
                                   <input type="text" id="longValue" name="longitude" class="form-control" >
                               </div>
                            </div>
                           <p id="demo"></p>
                           <br> 
                           <input type="hidden" name="status" class="form-control" required="required" value="Updating soon">
                           <input type="hidden" name="employee" class="form-control" required="required" value="allotment in process">
                           <input type="hidden" name="cmptid" class="form-control" >

                
                           
                           <input type="submit" value="SUBMIT" class="btn btn-info btn-block btn-lg" onclick="sendalert()">
                           
                           <br>
                            <div class="form-btn">
                                <a href="dashboard.html">Back to Home</a>
                            </div>

                       </form>
                    </div> 
               </div>

           </div>
        </div>
<script type="text/javascript">
    $('#myList').change( function() {
        $('.typetoggle').hide();
    });
</script>

<script>
    function sendalert() {
        alert("your complaint successfully registered");
    }    
</script>

<script>
var x = document.getElementById("demo");

function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition, showError);
  } else { 
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {
  document.getElementById("latValue").value = position.coords.latitude;
  document.getElementById("longValue").value = position.coords.longitude;
  // x.innerHTML = "Latitude: "  + position.coords.latitude + 
  // "<br>Longitude: " + position.coords.longitude;
}

function showError(error) {
  switch(error.code) {
    case error.PERMISSION_DENIED:
      x.innerHTML = "User denied the request for Geolocation."
      break;
    case error.POSITION_UNAVAILABLE:
      x.innerHTML = "Location information is unavailable."
      break;
    case error.TIMEOUT:
      x.innerHTML = "The request to get user location timed out."
      break;
    case error.UNKNOWN_ERROR:
      x.innerHTML = "An unknown error occurred."
      break;
  }
}
</script>
    </body>
</html>
