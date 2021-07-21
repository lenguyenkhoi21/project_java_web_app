<%-- 
    Document   : user_product_details
    Created on : Jul 14, 2020, 9:33:05 AM
    Author     : Milu
--%>

<%@page import="Model.AccountClient"%>
<%@page import="Model.Account"%>
<%@page import="Model.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
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
                                <li><a href="user" >Trang chủ</a></li>
                                <li><a href="user_product" class="active">Cửa hàng</a></li>
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

    <section id="slider">
        <!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>H</span>oa Thạch Kim</h1>
                                    <h2>Mua đâu cũng đẹp, HTK là đủ</h2>
                                    <p>Mỹ Tâm, Hương Giang và Sơn Tùng đều chọn, tại sao bạn lại không ?</p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/logo_poster/sontung.jpg" class="girl img-responsive" alt="" />
                                    <!--<img src="images/home/pricing.png" class="pricing" alt="" />-->
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>H</span>oa Thạch Kim</h1>
                                    <h2>Thỏa sức mua sắm</h2>
                                    <p>Giá sốc mùa hè </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/logo_poster/huonggiang.jpg" class="girl img-responsive" alt="" />
                                    <!--<img src="images/home/pricing.png" class="pricing" alt="" />-->
                                </div>
                            </div>

                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>H</span>oa Thạch Kim</h1>
                                    <h2>Mẫu mã đẹp, chất lượng cao</h2>
                                    <p> Free ship toàn quốc </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="images/logo_poster/mytam.jpg" class="girl img-responsive" alt="" />
                                    <!--<img src="images/home/pricing.png" class="pricing" alt="" />-->
                                </div>
                            </div>

                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--/slider-->
    
    
	<section>
		<div class="container">
			<div class="row">        
                
                 <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Thể loại</h2>
                        <div class="panel-group category-products" id="accordian">
                            <!--category-productsr-->
                            <% 
                                SanPhamDAO spDAO = new SanPhamDAO();
                                List dstheloai = spDAO.getListtheloai();
                                for (Iterator it = dstheloai.iterator(); it.hasNext();) {
                                        Object elem = it.next();
                                        String theloai = (String) elem;
                                    
                            %>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <%
                                            if (request.getParameter("theloai")!=null) {
                                                String tl = request.getParameter("theloai");
                                                if (tl.equals(theloai)) {
                                        %>
                                        <h4 class="panel-title"><a href="user_product?theloai=<%=theloai%>" style="color: #FE980F"><%=theloai%></a></h4>
                                        <%
                                                } else {
                                        %>
                                        <h4 class="panel-title"><a href="user_product?theloai=<%=theloai%>"><%=theloai%></a></h4>
                                        <%
                                                    
                                                }
                                        %>
                                        
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            <%
                                }
                            %>
                          
                        </div>
                        <!--/category-products-->             

                    </div>
                </div>


				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
                                                            <img src="<%= request.getParameter("url") %>" alt="" />
								<h3>ZOOM</h3>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								
                                                                <h2> <%= request.getParameter("ten") %></h2>
                                                                <p> Mã sản phẩm: <%= request.getParameter("id") %> </p>
								<span>
                                                                    <span> <%= request.getParameter("gia") %> </span>
                                                                     <div class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
                                                                                <a href="shopping?id=<%= request.getParameter("id") %>"> Add to cart </a>	
                                                                    </div>
									
								</span>
                                                                    
                                                                <%
                                                                    if (request.getParameter("tinhtrang").equals("Hàng mới")) {
                                                                %>
                                                                    <p><b>Tình trạng:</b> <%= request.getParameter("tinhtrang") %></p>
                                                                <%
                                                                    } 
                                                                %>
                                                                
                                                                
                                                                <%
                                                                    if (request.getParameter("tinhtrang").equals("Hàng cũ")) { 
                                                                %>
                                                                    <p><b>Tình trạng:</b> Còn hàng</p>
                                                                <%
                                                                    }
                                                                %>
                                                                
                                                                
                                                                <%
                                                                    if (request.getParameter("tinhtrang").equals("Hết hàng")) { 
                                                                %>
                                                                     <p><b>Tình trạng:</b> <%= request.getParameter("tinhtrang") %></p>
                                                                <%
                                                                    }
                                                                %>
								
                                                               
								
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#reviews" data-toggle="tab">Thông tin mô tả chi tiết</a></li>
							</ul>
						</div>
						<div class="tab-content">							
							<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
									
									<p>Hàng chất lượng tốt ! <3 </p>
									
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
				</div>
			</div>
		</div>
        </section>
	
    
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

