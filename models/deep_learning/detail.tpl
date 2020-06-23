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
      height: 85%;
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

    <!-- Cancel Modal -->
    <div class="modal fade" id="canel_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                    Bạn có chắc chắn muốn hủy thay đổi thông tin cá nhân?
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary">Xác nhận</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Modal-->
    <div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                <input type="email" id="defaultForm-email" class="form-control validate">
                <label data-error="wrong" data-success="right" for="defaultForm-email">Tài khoản</label>
            </div>

            <div class="md-form mb-4">
                <i class="fas fa-lock prefix grey-text"></i>
                <input type="password" id="defaultForm-pass" class="form-control validate">
                <label data-error="wrong" data-success="right" for="defaultForm-pass">Mật khẩu</label>
            </div>

        </div>
        <div class="modal-footer d-flex justify-content-center">
            <button class="btn btn-default">Login</button>
        </div>
        </div>
    </div>
    </div>

    <!-- Register Modal-->
    <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
            <div class="md-form mb-5">
            <i class="fas fa-user prefix grey-text"></i>
            <input type="text" id="orangeForm-name" class="form-control validate">
            <label data-error="wrong" data-success="right" for="orangeForm-name">Your name</label>
            </div>
            <div class="md-form mb-5">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="email" id="orangeForm-email" class="form-control validate">
            <label data-error="wrong" data-success="right" for="orangeForm-email">Your email</label>
            </div>

            <div class="md-form mb-4">
            <i class="fas fa-lock prefix grey-text"></i>
            <input type="password" id="orangeForm-pass" class="form-control validate">
            <label data-error="wrong" data-success="right" for="orangeForm-pass">Your password</label>
            </div>

        </div>
        <div class="modal-footer d-flex justify-content-center">
            <button class="btn btn-deep-orange">Đăng ký</button>
        </div>
        </div>
    </div>
    </div>

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
          </div>

        </div>

      </form>
        <!--/. SideNav slide-out -->

        <!-- Sign Button-->
        <div id="option-sign">
            <a id="navbar-static-signin"  class="text-info align-self-center ml-2 auth-modal-toggle " data-toggle="modal" data-target="#modalLoginForm">Đăng nhập</a>
            <a id="navbar-static-login"  class="btn btn-info btn-rounded btn-sm waves-effect waves-light auth-modal-toggle my-btn" data-toggle="modal" data-target="#modalRegisterForm">ĐĂNG KÝ</a>
        </div>
        <!--/. Sign Button-->
    </nav>
    <!-- Navbar -->

  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="mt-5 pt-5">
    <!-- Sidebar navigation -->
    <div id="mySidenav" class="sidenav">
      <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

      <h3 style="text-align: center">Hệ thống gợi ý thực đơn</h4><br><br>
      <h5 style="text-align: center">Thông tin người dùng</h5><br>

      <!--Contents-->
      <!--User ID-->
      <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_id">ID</label>
          <div class="col-sm-8">
          <label type="text" class="form-control"  name="user_id" id="user_id">1</label>
          </div>
      </div>
      <!--User Gender-->
      <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_gender">Giới tính</label>
          <div class="col-sm-8">
          <select class="browser-default custom-select" name="user_gender" id="user_gender">
              <option selected value="1">Nam</option>
              <option value="0">Nữ</option>
          </select>
          </div>
      </div>
      <!--User Age-->
      <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_age">Độ tuổi</label>
          <div class="col-sm-8">
          <input type="text" class="form-control"  name="user_age" id="user_age">
          <div class="invalid-feedback">Trường này không được bỏ trống.</div>
          </div>
      </div>
      <!--User Health-->
      <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_health">Nhóm đ/tượng</label>
          <div class="col-sm-8">
              <select class="browser-default custom-select" name="user_health" id="user_health">
                  <option selected value=""></option>
                  <option value="phụ nữ mang thai">Phụ nữ mang thai</option>
                  <option value="bệnh tiểu đường">Bệnh tiểu đường</option>
                  <option value="bệnh tim mạch">Bệnh tim mạch</option>
                  <option value="bệnh huyết áp cao">Bệnh huyết áp cao</option>
                  <option value="bệnh dạ dày">Bệnh dạ dày</option>
              </select>
          </div>
      </div>
      <!--User Hobbies-->
      <div class="form-group row">
          <label style="text-align: right" class="col-sm-4 col-form-label" for="user_hobbies">Sở thích</label>
          <div class="col-sm-8 ">
                  <!-- Multiselect dropdown -->
              <select multiple data-style="bg-white px-4 py-3 shadow-sm " class=" selectpicker  my-form-control " name="user_hobbies" id="user_hobbies" data-live-search="true">
                  <option value="gà">Thịt gà</option>
                  <option value="bò">Thịt bò</option>
                  <option value="lợn">Thịt lợn</option>
                  <option value="cá">Cá</option>
                  <option value="tôm">Tôm</option>
                  <option value="rau">Rau</option>
                  <option value="củ">Củ</option>
                  <option value="quả">Quả</option>
                  <option value="bánh mì">Bánh mì</option>
                  <option value="mì">Mì</option>
                  <option value="cháo">Cháo</option>
                  <option value="súp">Soup</option>
                  <option value="xôi">Xôi</option>
                  <option value="lẩu">Lẩu</option>
                  <option value="vịt">Thịt vịt</option>
                  <option value="bún">Bún</option>
                  <option value="phở">Phở</option>
              </select><!-- End -->
          </div>
      </div>

      <br>
      <!--Button-->
      <div class=" form-group row">
          <div class="col-sm-1"></div>
          <div class="col-sm-5">
              <a data-toggle="modal" data-target="#save_modal" class="btn btn-info btn-md my-btn" style="color: black;">Lưu
                  <i class="fas fa-cloud ml-2"></i>
              </a>
          </div>
          <div class="col-sm-5">
              <a data-toggle="modal" data-target="#canel_modal" class="btn btn-info btn-md my-btn" style="color: black;">Hủy bỏ
                  <i class="fas fa-ban ml-2"></i>
              </a>
          </div>
          <div class="col-sm-1"></div>
      </div>

    </div>
    <!--/. Sidebar navigation -->

    <div class="container">

      <!--Section:-->
      <section class="wow fadeIn">

        <!--Section heading-->
        <h1 class="text-center my-5 font-weight-bold">Thực đơn số 1</h1>

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
            <div class="row">
              <h5 class="font-weight-bold">
                <a>
                   {{detail_recipe_1}} 
                </a>
              </h5>
              <div id="ingre_1">
                <p>{{detail_ingre_1}}</p>

                <!--Steps-->
                <p>_ Các bước nấu: </p>
                <div class="col-md-12">

                  <!-- Stepers Wrapper -->
                  <ul class="stepper stepper-vertical mb-0">

                      <!-- First Step -->
                      <li class="completed">
                          <!--Section Title -->
                          <a >
                              <span class="circle">1</span>
                              <span class="label">Bước 1</span>
                          </a>

                          <!-- Section Description -->
                          <div class="step-content grey lighten-3">
                            <p>Tôm mua về rửa sạch rồi thực hiện cắt bỏ phần râu và đầu nhọn của tôm. Tiếp đến dùng chút muối để xóc đều lên
                              trong khoảng 15 phút để có được món ăn đậm đà hơn nhé.</p>
                        </div>
                      </li>

                      <!-- Second Step -->
                      <li class="active">
                          <!--Section Title -->
                          <a >
                              <span class="circle">2</span>
                              <span class="label">Bước 2</span>
                          </a>

                          <!-- Section Description -->
                          <div class="step-content grey lighten-3">
                              <p>Bắc chảo lên bếp rồi cho vào chảo 1 thìa cà phê đường, đun đến khi đường tan chảy hoàn 
                                toàn chuyển snag màu nâu cánh gián đẹp mắt thì thêm vào 2 thìa canh nước lọc, tiếp tục đun sôi.</p>
                          </div>
                      </li>

                      <!-- Third Step -->
                      <li class="completed">
                          <!--Section Title -->
                          <a >
                            <span class="circle">3</span>
                            <span class="label">Bước 3</span>
                          </a>

                          <!-- Section Description -->
                          <div class="step-content grey lighten-3">
                              <p>Hành, tỏi khô lột bỏ vỏ rồi đem băm nhỏ. Thực hiện phi thơm hành tỏi băm đến khi dậy mùi thì 
                                cho tôm vào, đảo đều tay vài lượt thì thêm chút nước mắm, đường cùng với nước màu đã chế ở trên.
                                Đến khi phần nước sốt đã cạn thì cho hành lá thái nhỏ và ít mì chính vào, đảo lên lần cuối rồi tắt bếp luôn.</p>
                          </div>
                      </li>

                      <!-- Fourth Step -->
                      <li class="completed">
                          <!--Section Title -->
                          <a >
                            <span class="circle">4</span>
                            <span class="label">Bước 4</span>
                          </a>

                          <!-- Section Description -->
                          <div class="step-content grey lighten-3">
                              <p>Trình bày món ăn ra đĩa rồi rắc chút hạt tiêu lên trên và thưởng thức luôn nhé.</p>
                          </div>
                      </li>

                  </ul>
                  <!-- /.Stepers Wrapper -->

                </div>
                
              </div>

              

            </div>

            <div class="row">
              <h5 class="font-weight-bold">
                <a>
                   {{detail_recipe_2}}  
                </a>
              </h5>
              <div id="ingre_2">
                <p>{{detail_ingre_2}}</p>
              </div>

            </div>

            <div class="row" id="recipe_3">
              <h5 class="font-weight-bold">
                <a>
                   {{detail_recipe_3}}  
                </a>
              </h5>
              <div id="ingre_3">
                <p>{{detail_ingre_3}}</p>
              </div>
            </div>

            <div class="row" id="recipe_4">
              <h5 class="font-weight-bold">
                <a>
                   {{detail_recipe_4}}  
                </a>
              </h5>
              <div id="ingre_4">
                <p>{{detail_ingre_4}}</p>
              </div>
            </div>

            <div class="row" id="recipe_5">
              <h5 class="font-weight-bold">
                <a>
                   {{detail_recipe_5}}  
                </a>
              </h5>
              <div id="ingre_5">
                <p>{{detail_ingre_5}}</p>
              </div>
            </div>
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
    if (document.getElementById('recipe_3').value == "") {
      document.getElementById("recipe_3").style.visibility = "hidden";
    }
    if (document.getElementById('recipe_4').value == "") {
      document.getElementById("recipe_4").style.visibility = "hidden";
    }
    if (document.getElementById('recipe_5').value == "") {
      document.getElementById("recipe_5").style.visibility = "hidden";
    }
  </script>
  <script>
    if (document.getElementById('ingre_1').value == "") {
      document.getElementById("ingre_1").style.visibility = "hidden";
    }
    if (document.getElementById('ingre_2').value == "") {
      document.getElementById("ingre_2").style.visibility = "hidden";
    }
    if (document.getElementById('ingre_3').value == "") {
      document.getElementById("ingre_3").style.visibility = "hidden";
    }
    if (document.getElementById('ingre_4').value == "") {
      document.getElementById("ingre_4").style.visibility = "hidden";
    }
    if (document.getElementById('ingre_5').value == "") {
      document.getElementById("ingre_5").style.visibility = "hidden";
    }
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
              content: `<div class="my-0 py-0"> <textarea type="text" style="font-size: 0.78rem" class="md-textarea form-control py-0" placeholder="Write us what can we improve" rows="3"></textarea> <button id="voteSubmitButton" type="submit" class="btn btn-sm btn-primary">Submit!</button> <button id="closePopoverButton" class="btn btn-flat btn-sm">Close</button>  </div>`
            });
          })
        }

        $stars.tooltip();
      }
    })(jQuery);
  </script>
  <script>
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
  </script>
</body>

</html>
