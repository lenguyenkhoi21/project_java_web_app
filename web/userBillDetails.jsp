<%-- 
    Document   : userBillDetails
    Created on : Jul 19, 2020, 10:14:40 PM
    Author     : Milu
--%>


<%@page import="Model.Chitiethoadon"%>
<%@page import="DAO.ChitiethoadonDAO"%>
<%@page import="Model.HoaDon"%>
<%@page import="DAO.HoaDonDAO"%>
<%@page import="Model.AccountClient"%>
<%@page import="DAO.AccountDAO"%>
<%@page import="Model.Account"%>
<%@page import="Model.SanPham"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page import="DAO.SanPhamDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Trang chủ</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head>
<!--/head-->

<body>
    <header id="header">
        <!--header-->
        <div class="header_top">
            <!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href="#"><i class="fa fa-phone"></i> +84 7777 1956</a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i> khoilnde140244@fpt.edu.vn</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header_top-->

        <div class="header-middle">
            <!--header-middle-->
            <div class="container">
                <div class="row">
                    <div class="col-md-4 clearfix">
                        <div class="logo pull-left">
                            <a href="user"><img src="images/logo_poster/lonojpg.jpg" alt="" style="width: 50px; height: 50px;"/></a>
                        </div>
                    </div>
                    <div class="col-md-8 clearfix">
                        <div class="shop-menu clearfix pull-right">
                            <ul class="nav navbar-nav">
                                <%
                                    AccountClient user = (AccountClient) request.getSession().getAttribute("user");
                                %>
                                <li><a href="userBill"><i class="fa fa-user"></i> <%= user.getTenDangNhap() %> </a></li>
                                <li><a href="user_shoppoingcard"><i class="fa fa-shopping-cart"></i> Giỏ hàng </a></li>
                                <li><a href="logout"><i class="fa fa-lock"></i> Đăng xuất </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header-middle-->

        <div class="header-bottom">
            <!--header-bottom-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><a href="user" class="active">Trang chủ</a></li>
                                <li><a href="user_product">Cửa hàng</a></li>
                                <li><a href="#">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="search_box pull-right">
                            <form action="userSearchProduct">
                                <input type="text" placeholder="Search" name="keyword"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/header-bottom-->

    </header>
    <!--/header-->

    <section>
        <div class="container">
            <div class="row">
                <% String hd = request.getParameter("id"); %>
                <h2 class="title text-center">Tông tin hóa đơn: <%= hd %></h2>
                
                <div class="col-lg-1">
                    
                </div>
                
                <div class="col-lg-10">                   
                <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                        <tr class="cart_menu">
                            <td class="price"><h4>Tên Sản Phẩm</h4></td>
                            <td class="price"><h4>Đơn giá</h4></td>
                            <td class="quantity"><h4>Số lượng</h4></td>
                            <td class="quantity"><h4>Thành tiền</h4></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            
                            ChitiethoadonDAO cthdDAO = new ChitiethoadonDAO();
                            List details = cthdDAO.viewChiTietHoaDon(hd);
                            int total = 0;
                            for (Iterator it = details.iterator(); it.hasNext();) {
                                    Chitiethoadon elem = (Chitiethoadon) it.next();
                                    total += elem.getSoLuong()*elem.getSanPham().getGiaNiemYet();
                        %>
                                           
                        <tr>

                            <td class="cart_description">
                                <h5><%= elem.getSanPham().getSanPhamName() %></h5>
                            </td>
                            
                            <td class="cart_price">
                                <h5><%= elem.getSanPham().getGiaNiemYet() %></h5>
                            </td>
                            
                            <td class="cart_quantity">
                                 <h5><%= elem.getSoLuong() %></h5>
                            </td>
                          
                            <td class="cart_quantity">
                                 <h5><%= elem.getSoLuong()*elem.getSanPham().getGiaNiemYet()  %></h5>
                            </td>
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                    <thead>
                        <tr class="cart_menu">
                            <td class="price"></td>
                            <td class="price"></td>
                            <td class="quantity"></td>
                            <td class="quantity"><h4>Tổng: <%= total %></h4> </td>
                            <td></td>
                        </tr>
                    </thead>
                </table>
                </div>
                    

                    
                  
                </div>
                    
                <div class="col-lg-1">
                    
                </div>
                
                
            </div>
        </div>
    </section>
    
                    <div> &nbsp;</div>

    <footer id="footer">
        <!--Footer-->
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="companyinfo">
                            <h2><span>e</span>-shopper</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                        </div>
                    </div>
                    
                     
                    <div class="col-sm-7">
                        <div class="col-sm-2">
                            <div class="video-gallery text-center">
                                <a href="#">
                                    <div class="iframe-img">
                                        <img src="images/home/minh_huynh.jpg" alt="" />
                                    </div>
                                    <div class="overlay-icon">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </a>
                                <p>Minh Huỳnh</p>
                                <h2>none</h2>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="video-gallery text-center">
                                <a href="#">
                                    <div class="iframe-img">
                                        <img src="images/home/minh_anh.jpg" alt="" />
                                    </div>
                                    <div class="overlay-icon">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </a>
                                <p>Minh Nguyen Anh</p>
                                <h2>none</h2>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="video-gallery text-center">
                                <a href="#">
                                    <div class="iframe-img">
                                        <img src="images/home/yuan_li.jpg" alt="" />
                                    </div>
                                    <div class="overlay-icon">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </a>
                                <p>Milu</p>
                                <h2>Nhà giả kim việt nam</h2>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="video-gallery text-center">
                                <a href="#">
                                    <div class="iframe-img">
                                        <img src="images/home/cuong.jpg" alt="" />
                                    </div>
                                    <div class="overlay-icon">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </a>
                                <p>Cường Nguyễn</p>
                                <h2>none</h2>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="video-gallery text-center">
                                <a href="#">
                                    <div class="iframe-img">
                                        <img src="images/home/tri.jpg" alt="" />
                                    </div>
                                    <div class="overlay-icon">
                                        <i class="fa fa-play-circle-o"></i>
                                    </div>
                                </a>
                                <p>Trí Minh Hà</p>
                                <h2>none</h2>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col-sm-3">
                        <div class="address">
                            <img src="images/home/map.png" alt="" />
                            <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-widget">
            <div class="container">
                <div class="row">
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>Service</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#">Online Help</a></li>
                                <li><a href="#">Contact Us</a></li>
                                <li><a href="#">Order Status</a></li>
                                <li><a href="#">Change Location</a></li>
                                <li><a href="#">FAQ’s</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>Quock Shop</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#">T-Shirt</a></li>
                                <li><a href="#">Mens</a></li>
                                <li><a href="#">Womens</a></li>
                                <li><a href="#">Gift Cards</a></li>
                                <li><a href="#">Shoes</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>Policies</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#">Terms of Use</a></li>
                                <li><a href="#">Privecy Policy</a></li>
                                <li><a href="#">Refund Policy</a></li>
                                <li><a href="#">Billing System</a></li>
                                <li><a href="#">Ticket System</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="single-widget">
                            <h2>About Shopper</h2>
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#">Company Information</a></li>
                                <li><a href="#">Careers</a></li>
                                <li><a href="#">Store Location</a></li>
                                <li><a href="#">Affillate Program</a></li>
                                <li><a href="#">Copyright</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3 col-sm-offset-1">
                        <div class="single-widget">
                            <h2>About Shopper</h2>
                            <form action="#" class="searchform">
                                <input type="text" placeholder="Your email address" />
                                <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                                <p>Get the most recent updates from <br />our site and be updated your self...</p>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                    <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                </div>
            </div>
        </div>

    </footer>
    <!--/Footer-->



    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body></html>