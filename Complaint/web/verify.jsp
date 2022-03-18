<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
        
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
    </head>
    <body >
        <div class="main-content" style="opacity: 0.7; margin-top: 10rem;">

        <form class="form-register" method="post" action="VerifyCode" name="myform" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row" >
                        <h1>Verify OTP</h1>
                    </div>
				   </br>

                    <div class="form-row">
                        <label>
                            <span>Enter OTP</span>
                            <input type="text" name="authcode" id="email" placeholder="">
                        </label>
                    </div>


                                   <input type="submit" style="background-color: #FF6347; color: white; border-radius: 10px;" name="btn_login" value="SUBMIT"><br><br><br>
                    

                </div>


            </div>

        </form>

    </div>
    </body>
</html>