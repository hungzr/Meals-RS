<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  
  <!-- Material Design Bootstrap -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">


  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" /> -->
  
  <!-- Your custom styles (optional) -->
  <style>
      body {
    font-family: "Lato", sans-serif;
    transition: background-color .5s;
    }
    .bootstrap-select .bs-ok-default::after {
      width: 0.3em;
      height: 0.6em;
      border-width: 0 0.1em 0.1em 0;
      transform: rotate(45deg) translateY(0.5rem);
    }

    .btn.dropdown-toggle:focus {
      outline: none !important;
    }
    .sidenav {
      height: 100%;
      width: 0;
      position: fixed;
      z-index: 1;
      top: 5em;
      left: 0;
      background-color: rgb(218, 212, 212);
      overflow-x: hidden;
      transition: 0.5s;
      padding-top: 60px;
    }

    .sidenav a {
      padding: 8px 8px 8px 32px;
      text-decoration: none;
      font-size: 15px;
      color: #818181;
      display: block;
      transition: 0.3s;
    }

    .sidenav a:hover {
      color: #f1f1f1;
    }

    .sidenav .closebtn {
      position: absolute;
      top: 0;
      right: 25px;
      font-size: 36px;
      margin-left: 50px;
    }

    @media screen and (max-height: 450px) {
      .sidenav {padding-top: 15px;}
      .sidenav a {font-size: 18px;}
    }

    .fixed {
      position: fixed;
      bottom: 0;
      width: 100%;
    }

    .fixed-button {
      position: relative;
      bottom: 3em;
      width: 100%;
    }

    .my-form-control{
      width: 100%;
      height: 50%;
    }

    .row {
      margin-right: 0;
      margin-left: 0;
    }

    .card {
      height: 100%;
    }

    .card-text {
      height: 28%;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    .header-container {
      width: 100%;
      margin-left: 0;
    }

    #option-sign {
      margin-left: auto;
      margin-right: 0;
    }

    #main {
      width: 80%;
    }

    .md-form {
      margin: 10px 0;
    }

    .my-btn {
      border-radius: 15px;
      margin: 0;
    }


    button.btn.dropdown-toggle {
      margin: 0;
      text-transform: lowercase;
      font-family: 15px;
    }

    .inner.show {
      font-family: 12px;
    }

    .my-scroll {
      overflow-y: auto;
    }

    .filter-option-inner-inner {
      font-size: 16px;
    }

    .price {
      letter-spacing: 0.5px;
      padding: 8px 5px;
      position: absolute;
      right: 0px;
      margin-top: -35px;
      /* background-color: rgba(250, 250, 250, 0.9); */
    }

    .my-detail {
      border-radius: 10px;
    }

    .card-img-top {
      height: 227px;
      width:100%;
    }

    .login-btn {
      border-radius:25px;
      padding: 0;
    }

    .dropdown-toggle::after {
      content: none;
    }

    .my-dropdown-menu {
      padding:0;
    }

  </style>
</head>

<body>

  <!--Main Navigation-->
  <header>

    <!-- Modal -->
    <!-- Save Modal -->
    <div class="modal fade" id="save_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Lưu thay đổi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn thay đổi thông tin cá nhân?
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary">Xác nhận</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Modal-->
    <form action="/login" method="post" class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold">Đăng nhập</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <i class="fas fa-envelope prefix grey-text"></i>
              <input name="username" type="text" id="defaultForm-email" class="form-control validate">
              <label data-error="wrong" data-success="right" for="defaultForm-email">Tài khoản</label>
            </div>

            <div class="md-form mb-4">
              <i class="fas fa-lock prefix grey-text"></i>
              <input name="password" type="password" id="defaultForm-pass" class="form-control validate">
              <label data-error="wrong" data-success="right" for="defaultForm-pass">Mật khẩu</label>
            </div>

          </div>
          <div class="modal-footer d-flex justify-content-center">
            <button type= "submit" class="btn btn-default">Đăng nhập</button>
          </div>
        </div>
      </div>
    </form>

    <!-- Register Modal-->
    <form action="/register" method="post" class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold">Đăng ký</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
            <!--User Account-->
            <div class="md-form mb-5">
              <i class="fas fa-envelope prefix grey-text"></i>
              <input name="register_user_account" type="text" id="user_account" class="form-control validate" required>
              <div class="invalid-feedback">Trường này không được bỏ trống.</div>
              <label data-error="wrong" data-success="right" for="user_account">Tài khoản</label>
            </div>
            <!--User Password-->
            <div class="md-form mb-4">
              <i class="fas fa-lock prefix grey-text"></i>
              <input name="register_user_password" type="password" id="user_password" class="form-control validate" required>
              <div class="invalid-feedback">Trường này không được bỏ trống.</div>
              <label data-error="wrong" data-success="right" for="user_password">Mật khẩu</label>
            </div>
            
            <!--User Name-->
            <div class="md-form mb-3">
              <i class="fas fa-user prefix grey-text"></i>
              <input name="register_user_name" type="text" id="user_name" class="form-control validate" >
              <label data-error="wrong" data-success="right" for="user_name">Tên người dùng</label>
            </div>
            
          </div>
          <div class="modal-footer d-flex justify-content-center">
            <button class="btn btn-deep-orange" type="submit">Đăng ký</button>
          </div>
        </div>
      </div>
    </form>

    <!-- Advance Search Modal-->
    <form action="/advance_search" method="post" class="modal fade" id="modal-advance-search" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold">Tìm kiếm nâng cao</h4>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
            <!--User Gender-->
            <div class="form-group row">
              <label style="text-align: right" class="col-sm-4 col-form-label" for="user_gender">Giới tính</label>
              <div class="col-sm-8 my-detail">
                <select class="browser-default custom-select" name="new_user_gender" id="new_user_gender">
                  <option selected value="" disabled hidden>{{user_gender}}</option>
                  <option value="0">Nam</option>
                  <option value="1">Nữ</option>
                </select>
              </div>
            </div>
            <!--User Age-->
            <div class="form-group row">
              <label style="text-align: right" class="col-sm-4 col-form-label" for="user_age">Độ tuổi</label>
              <div class="col-sm-8 my-detail">
                <select class="browser-default custom-select" name="new_user_age" id="new_user_age">
                  <option selected value="" disabled hidden>{{user_age}}</option>
                  <option value="trẻ em">0-16 tuổi: Trẻ em</option>
                  <option value="người lớn">17-50 tuổi: Người lớn</option>
                  <option value="người già">> 50 tuổi: Người già</option>
                </select>
              </div>
            </div>
            <!--User Group-->
            <div class="form-group row">
              <label style="text-align: right" class="col-sm-4 col-form-label" for="user_health">Nhóm đ/tượng</label>
              <div class="col-sm-8">
                <select multiple data-style="bg-white px-4 py-3 shadow-sm " class=" selectpicker  my-form-control "
                name="new_user_group" id="new_user_group" data-live-search="true">
                  %for index, group in enumerate(select_group):
                    % if group in user_group:
                      <option selected id = "group_{{index}}" value="{{index}}">{{group}}</option>
                    %else:
                      <option id = "group_{{index}}" value="{{index}}">{{group}}</option>
                    %end
                  %end
                </select>
              </div>
            </div>
            <!--User Hobbies-->
            <div class="form-group row">
              <label style="text-align: right" class="col-sm-4 col-form-label" for="user_hobbies">Sở thích</label>
              <div class="col-sm-8 ">
                <!-- Multiselect dropdown -->
                <select multiple data-style="bg-white px-4 py-3 shadow-sm " class=" selectpicker  my-form-control "
                  name="new_user_hobbies" id="new_user_hobbies" data-live-search="true">
                  %for index,hobbie in enumerate(select_hobbies):
                    %if hobbie in user_hobbies:
                      <option selected id = "hobby_{{index}}" value="{{index}}">{{hobbie}}</option>
                    %else:
                      <option id = "hobby_{{index}}" value="{{index}}">{{hobbie}}</option>
                    %end
                  %end
                </select><!-- End -->
              </div>
            </div>
            
          </div>
          <div class="modal-footer d-flex justify-content-center">
            <button class="btn btn-deep-orange" type="submit" >Tìm kiếm</button>
          </div>
        </div>
      </div>
    </form>
    <!-- /. Modal -->

    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
        <!--Main Navigation-->


      <!-- SideNav slide-out -->
      <!-- <a href="#" data-activates="slide-out" class="button-collapse"><i class="fas fa-bars"></i><span class="sr-only" aria-hidden="true">Toggle side navigation</span></a> -->
      <span style="font-size:30px;cursor:pointer; color: #4285f4;" onclick="openNav()"><i class="fas fa-bars"></i></span>
      <form action="/find" method="post" id="main">
        <div class="container header-container">

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <img src="https://www.mybee.life/static/logo-a9fe68f128e542e8b55c57609fd6e080.png"
              style="height: 55px; width: 55px;">
            <div class="col-sm-6">
              <!-- Search form -->
              <div class=" active-cyan-2 md-form">
                <input value= "{{recipe_input}}" name="recipe_name" id="recipe_name" class="form-control " type="text" aria-label="Search">
                <label data-error="wrong" data-success="right" for="Search">Nhập tên món ăn...</label>
                
              </div>

            </div>
            <button type="submit" class="btn btn-primary my-btn">Tìm kiếm</button>
            <a id="advance-search" class="text-info align-self-center ml-2 auth-modal-toggle" data-toggle="modal" data-target="#modal-advance-search">
              Tìm kiếm nâng cao
            </a>
          </div>

        </div>

      </form>
        <!--/. SideNav slide-out -->

      <!-- Sign Button-->
      <div id="option-sign">
        <a id="navbar-static-signin" class="text-info align-self-center ml-2 auth-modal-toggle " data-toggle="modal"
          data-target="#modalLoginForm">Đăng nhập</a>
        <a id="navbar-static-login"
          class="btn btn-info btn-rounded btn-sm waves-effect waves-light auth-modal-toggle my-btn" data-toggle="modal"
          data-target="#modalRegisterForm">ĐĂNG KÝ</a>
      </div>
      <!-- Basic dropdown -->
      <div class="dropdown" id="logined" style="visibility:hidden;">
        <button class="btn btn-primary dropdown-toggle mr-4 login-btn" type="button" data-toggle="dropdown"
          aria-haspopup="true" aria-expanded="false" >
          <img src="https://i.pinimg.com/564x/ff/a0/9a/ffa09aec412db3f54deadf1b3781de2a.jpg" style="width:50px;">
        </button>

        <div class="dropdown-menu my-dropdown-menu">
          <a class="dropdown-item my-dropdown-item" href="/logout">Đăng xuất</a>
        </div>
      </div>
        <!-- Basic dropdown -->
    </nav>
    <!-- Navbar -->

    <!-- Notify -->
    <div role="alert" id="notify-success" aria-live="assertive" aria-atomic="true" class="toast" data-autohide="true">
      <div class="toast-header">
        <svg class=" rounded mr-2" width="20" height="20" xmlns="http://www.w3.org/2000/svg"
          preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
          <rect fill="#007aff" width="100%" height="100%" /></svg>
        <strong class="mr-auto">Thành công</strong>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="toast-body">
        Đăng nhập thành công.
      </div>
    </div>
    <!-- /.Notify -->
  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="mt-5 pt-5">
    <!-- Sidebar navigation -->
    <form action ="/saveinfor" method="post" id="mySidenav" class="sidenav">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

      <h3 style="text-align: center">Hệ thống gợi ý thực đơn</h4><br><hr>
        <h5 style="text-align: center">Thông tin người dùng</h5><br>

        <!--Contents-->
        <!--User ID-->
        <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_id">ID</label>
          <div class="col-sm-8 my-detail">
            <input type="text" class="form-control" name="user_id" id="user_id" value="{{user_login_id}}" style="height:100%;" disabled>
      
          </div>
        </div>
        <!--User Gender-->
        <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_gender">Giới tính</label>
          <div class="col-sm-8 my-detail">
            <select class="browser-default custom-select" name="new_user_gender" id="new_user_gender">
              <option selected value="" disabled hidden>{{user_gender}}</option>
              <option value="0">Nam</option>
              <option value="1">Nữ</option>
            </select>
          </div>
        </div>
        <!--User Age-->
        <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_age">Độ tuổi</label>
          <div class="col-sm-8 my-detail">
            <select class="browser-default custom-select" name="new_user_age" id="new_user_age">
              <option selected value="" disabled hidden>{{user_age}}</option>
              <option value="trẻ em">0-16 tuổi: Trẻ em</option>
              <option value="người lớn">17-50 tuổi: Người lớn</option>
              <option value="người già">> 50 tuổi: Người già</option>
            </select>
          </div>
        </div>
        <!--User Group-->
        <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_health">Nhóm đ/tượng</label>
          <div class="col-sm-8">
            <select multiple data-style="bg-white px-4 py-3 shadow-sm " class=" selectpicker  my-form-control "
             name="new_user_group" id="new_user_group" data-live-search="true">
              %for index, group in enumerate(select_group):
                % if group in user_group:
                  <option selected id = "group_{{index}}" value="{{index}}">{{group}}</option>
                %else:
                  <option id = "group_{{index}}" value="{{index}}">{{group}}</option>
                %end
              %end
            </select>
          </div>
        </div>
        <!--User Hobbies-->
        <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_hobbies">Sở thích</label>
          <div class="col-sm-8 ">
            <!-- Multiselect dropdown -->
            <select multiple data-style="bg-white px-4 py-3 shadow-sm " class=" selectpicker  my-form-control "
              name="new_user_hobbies" id="new_user_hobbies" data-live-search="true">
              %for index,hobbie in enumerate(select_hobbies):
                %if hobbie in user_hobbies:
                  <option selected id = "hobby_{{index}}" value="{{index}}">{{hobbie}}</option>
                %else:
                  <option id = "hobby_{{index}}" value="{{index}}">{{hobbie}}</option>
                %end
              %end
            </select><!-- End -->
          </div>
        </div>

        <br><br><hr><br>
        <!--Button-->
        <div class=" form-group row">
          <div class="col-sm-12 text-center">
            <button id="save_infor_btn" type="submit" class="btn btn-info btn-md my-btn"
              style="color: black;width:35%;" disabled >Lưu
              <i class="fas fa-cloud ml-2"></i>
            </button>
          </div>
        </div>
    </form>
    <!--/. Sidebar navigation -->

    <div class="container">

      <!--Section:-->
      <section class="wow fadeIn">

        <!--Section heading-->
        <h1 class="text-center my-5 font-weight-bold">Thực đơn thuần Việt đơn giản</h1>

        <!--Grid row-->
        <div class="row text-left">

          <!--Grid column-->
          <div class="col-md-2"></div>
          <div class="col-md-8">

            <!--Image-->
            <div class="view overlay rounded z-depth-1-half mb-3">
              <img src="{{detail_image}}" class="img-fluid" style = "display: block; margin: 0 auto;" alt="Sample post image">
              <a>
                <div class="mask rgba-white-slight"></div>
              </a>
            </div>

            <!--Excerpt-->
            <div class="news-data">
              <a href="" class="light-blue-text">
                <h6>
                  <i class="fas fa-utensils"></i>
                  <strong> Ẩm thực</strong>
                </h6>
              </a>
              <p>
                <span id="rateMe4"  class=" feedback "></span>
              </p>
            </div>

            <h4 class="my-5 font-weight-bold">
              <a>
                Danh sách các món ăn gồm: 
              </a>
            </h4>

            <hr>

            <!--Ingredients-->
            %for i in range(len(detail_recipe)):
              <div class="row">
                <h5 class="font-weight-bold">
                  <a>
                    {{detail_recipe[i]}} 
                  </a>
                </h5>
                %if detail_ingre[i] != '':
                  <div id="ingre">
                    <p>
                      _Nguyên liệu gồm: {{detail_ingre[i]}}
                    </p>

                    <!--Steps-->
                    <p>_ Các bước nấu: </p>
                    <div class="col-md-12">

                      <!-- Stepers Wrapper -->
                      <ul class="stepper stepper-vertical mb-0">

                          <!-- Step -->
                          %for j in range(len(detail_method[i])):
                          <li class="completed">
                              <!--Section Title -->
                              <a >
                                  <span class="circle">{{j+1}}</span>
                                  <span class="label">Bước {{j+1}}</span>
                              </a>

                              <!-- Section Description -->
                              <div class="step-content grey lighten-3">
                                <p>{{detail_method[i][j]}}</p>
                            </div>
                          </li>
                          %end

                      </ul>
                      <!-- /.Stepers Wrapper -->

                    </div>
                    
                  </div>
                %end
              </div>
            %end
            <!--/Ingredients-->

            <hr>
            <!-- Comments-->
            <div class="d-md-flex flex-md-fill px-1">
              <div class="d-flex justify-content-center mr-md-5 mt-md-5 mt-4">
                <img class="card-img-100 z-depth-1 rounded-circle" src="https://mdbootstrap.com/img/Photos/Avatars/img (32).jpg" alt="avatar">
              </div>
              <div class="md-form w-100">
                <textarea class="form-control md-textarea pt-0" id="exampleFormControlTextarea1" rows="5" placeholder="Write something here..."></textarea>
              </div>
            </div>
            <div class="text-center">
              <button class="btn btn-default btn-rounded btn-md waves-effect waves-light">Gửi</button>
            </div>
            <!--/. Comments-->
          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

      </section>
      <!--/Section: -->

    </div>
  </main>
  <!--Main layout-->

  <!--Footer-->
  <footer class="page-footer text-center font-small mdb-color darken-2 mt-4 wow fadeIn">

    <hr class="my-3">

    <!-- Social icons -->
    <div class="pb-3">
      <a href="https://www.facebook.com/mdbootstrap" target="_blank">
        <i class="fab fa-facebook-f mr-3"></i>
      </a>

      <a href="https://twitter.com/MDBootstrap" target="_blank">
        <i class="fab fa-twitter mr-3"></i>
      </a>

      <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
        <i class="fab fa-youtube mr-3"></i>
      </a>

      <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
        <i class="fab fa-google-plus-g mr-3"></i>
      </a>

      <a href="https://dribbble.com/mdbootstrap" target="_blank">
        <i class="fab fa-dribbble mr-3"></i>
      </a>

      <a href="https://pinterest.com/mdbootstrap" target="_blank">
        <i class="fab fa-pinterest mr-3"></i>
      </a>

      <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
        <i class="fab fa-github mr-3"></i>
      </a>

      <a href="http://codepen.io/mdbootstrap/" target="_blank">
        <i class="fab fa-codepen mr-3"></i>
      </a>
    </div>
    <!-- Social icons -->

    <!--Copyright-->
    <div class="footer-copyright py-3">
      © 2020 Copyright:
      <a href="#" target="_blank"> Meal Recommendation System </a>
    </div>
    <!--/.Copyright-->

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
  
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
  <script>
    $("#new_user_gender").on('change', function() {
      
      if($("#new_user_gender").val() =="0") {
        console.log("aba");
        // % del select_group[3]
      }
    })
  </script>

  <script>
    (function ($) {
      $.fn.mdbRate = function () {
        var $stars;
        // Custom whitelist to allow for using HTML tags in popover content
        var myDefaultWhiteList = $.fn.tooltip.Constructor.Default.whiteList
        myDefaultWhiteList.textarea = [];
        myDefaultWhiteList.button = [];

        var $container = $(this);

        var titles = ['Very bad', 'Poor', 'OK', 'Good', 'Excellent'];

        for (var i = 0; i < 5; i++) {
          $container.append(`<i class="py-2 px-1 rate-popover" data-index="${i}" data-html="true" data-toggle="popover"
          data-placement="top" title="${titles[i]}"></i>`);
        }

        $stars = $container.children();

        if ($container.hasClass('rating-faces')) {
          $stars.addClass('far fa-meh-blank');
        } else if ($container.hasClass('empty-stars')) {
          $stars.addClass('far fa-star');
        } else {
          $stars.addClass('fas fa-star');
        }

        $stars.on('mouseover', function () {
          var index = $(this).attr('data-index');
          markStarsAsActive(index);
          $('#rating_start').val(index)
        });

        function markStarsAsActive(index) {
          unmarkActive();

          for (var i = 0; i <= index; i++) {

            if ($container.hasClass('rating-faces')) {
              $($stars.get(i)).removeClass('fa-meh-blank');
              $($stars.get(i)).addClass('live');

              switch (index) {
                case '0':
                  $($stars.get(i)).addClass('fa-angry');
                  break;
                case '1':
                  $($stars.get(i)).addClass('fa-frown');
                  break;
                case '2':
                  $($stars.get(i)).addClass('fa-meh');
                  break;
                case '3':
                  $($stars.get(i)).addClass('fa-smile');
                  break;
                case '4':
                  $($stars.get(i)).addClass('fa-laugh');
                  break;
              }

            } else if ($container.hasClass('empty-stars')) {
              $($stars.get(i)).addClass('fas');
              switch (index) {
                case '0':
                  $($stars.get(i)).addClass('oneStar');
                  break;
                case '1':
                  $($stars.get(i)).addClass('twoStars');
                  break;
                case '2':
                  $($stars.get(i)).addClass('threeStars');
                  break;
                case '3':
                  $($stars.get(i)).addClass('fourStars');
                  break;
                case '4':
                  $($stars.get(i)).addClass('fiveStars');
                  break;
              }
            } else {
              $($stars.get(i)).addClass('amber-text');

            }
          }
        }

        function unmarkActive() {
          $stars.parent().hasClass('rating-faces') ? $stars.addClass('fa-meh-blank') : $stars;
          $container.hasClass('empty-stars') ? $stars.removeClass('fas') : $container;
          $stars.removeClass('fa-angry fa-frown fa-meh fa-smile fa-laugh live oneStar twoStars threeStars fourStars fiveStars amber-text');
        }

        $stars.on('click', function () {
          $stars.popover('hide');
        });

        // Submit, you can add some extra custom code here
        // ex. to send the information to the server
        $container.on('click', '#voteSubmitButton', function () {
          $stars.popover('hide');
          
        });

        // Cancel, just close the popover
        $container.on('click', '#closePopoverButton', function () {
          $stars.popover('hide');
        });

        if ($container.hasClass('feedback')) {

          $(function () {
            $stars.popover({
              // Append popover to #rateMe to allow handling form inside the popover
              container: $container,
              // Custom content for popover
              content: `<div class="my-0 py-0"> <input id = "rating_start" value="" type="hidden"><textarea type="text" style="font-size: 0.78rem" class="md-textarea form-control py-0" placeholder="Write us what can we improve" rows="3"></textarea> <button  id="voteSubmitButton" type="submit" class="btn btn-sm btn-primary">Submit!</button> <button id="closePopoverButton" class="btn btn-flat btn-sm">Close</button>  </div>`
            });
          })
        }

        $stars.tooltip();
      }
    })(jQuery);
  </script>
  <script>
    var check_id = document.getElementById("user_id").value
    if (check_id != "" ) {
      if (parseInt(check_id) > 0 ){
      document.getElementById("logined").style.visibility = "visible";
      document.getElementById("advance-search").style.display = "none";
      document.getElementById("navbar-static-signin").style.display = "none";
      document.getElementById("navbar-static-login").style.display = "none";
      document.getElementById("save_infor_btn").disabled = false;
      document.getElementById("notify-success").attr("data-autohide","false");
      }
      
    }

    function openNav() {
      document.getElementById("mySidenav").style.width = "30%";
      document.getElementById("main").style.marginLeft = "30%";
      document.getElementById("option-sign").style.marginLeft = "-28%";
      document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
    }

    function closeNav() {
      document.getElementById("mySidenav").style.width = "0";
      document.getElementById("main").style.marginLeft= "0";
      document.getElementById("option-sign").style.marginLeft= "auto";
      document.getElementById("option-sign").style.marginRight= "0";
      document.body.style.backgroundColor = "white";
    }

    // Rating Initialization
    $(document).ready(function() {
      $('#rateMe4').mdbRate();
    });


    $(function () {
        $('.selectpicker').selectpicker();
    });

    // Animations initialization
    new WOW().init();
    $('.toast').toast('show');
  </script>
</body>

</html>
