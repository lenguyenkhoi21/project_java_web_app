<%-- 
    Document   : register
    Created on : Jul 15, 2020, 11:07:59 PM
    Author     : Milu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V11</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="css/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util2.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-50 p-r-50 p-t-77 p-b-30">
                            <form class="login100-form validate-form" action="AddNewUser">
					<span class="login100-form-title p-b-55">
						đăng ký
                                        </span>

					<div class="wrap-input100 validate-input m-b-16" >
						<input class="input100" type="text" name="username" placeholder="Tên đăng nhập">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-user"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Mật khẩu">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-lock"></span>
						</span>
					</div>
                                
                                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                                            <input class="input100" type="text" name="name" placeholder="Họ và tên">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-list"></span>
						</span>
					</div>
                                
                                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                                            <input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>
                                
                                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                                            <input class="input100" type="text" name="phone" placeholder="Số điện thoại">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-phone-handset"></span>
						</span>
					</div>
                                
                                        <div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                                            <input class="input100" type="text" name="address" placeholder="Địa chỉ">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-home"></span>
						</span>
					</div>
                                
                                        

<!--
					<div class="contact100-form-checkbox m-l-4">
						<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
						<label class="label-checkbox100" for="ckb1">
							Remember me
						</label>
					</div>
-->
					
					<div class="container-login100-form-btn p-t-25">
                                           
                                                <button class="login100-form-btn" type="submit">
							đăng ký
						</button>
                                         
						
					</div>

                                              
<!--
					<div class="text-center w-full p-t-42 p-b-22">
						<span class="txt1">
							Or login with
						</span>
					</div>

					<a href="#" class="btn-face m-b-10">
						<i class="fa fa-facebook-official"></i>
						Facebook
					</a>

					<a href="#" class="btn-google m-b-10">
						<img src="images/icons/icon-google.png" alt="GOOGLE">
						Google
					</a>
-->

					<div class="text-center w-full p-t-115">
						
					</div>
				</form>
			</div>
		</div>
	
        </div>
	

	
<!--===============================================================================================-->	
	<script src="js/jquery.js"></script>
<!--===============================================================================================-->
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="js/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main2.js"></script>

</body>
</html>
