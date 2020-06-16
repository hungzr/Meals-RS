<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
	body, html {
	  height: 100%;
	  margin: 0;
	}

	.bg {
	  /* The image used */
	  background-image: url(https://bikiphay.net/wp-content/uploads/2019/06/backround-đẹp27.png);


	  /* Center and scale the image nicely */
	  background-position: center;
	  background-repeat: no-repeat;
	  background-size: cover;
	}

	.req{
	    color:red;
	}
  </style>

</head>
</br>
<body class='bg'>
    <h2 style="text-align: center">Hệ thống gợi ý thực đơn</h2></br></br>
    <div class="container">
    <form  style="width:100%; margin:auto" action="/find" method="post" class="needs-validation" novalidate>
      <div class="row" >
        <div class="col-sm-10">
          <div class="form-group row">
            <label class="col-sm-2 col-form-label" for="recipe_name">Tên món ăn  <span class="req">*</span></label>
            <div class="col-sm-10">
              <input type="text" value= "{{recipe_input}}" name="recipe_name" id="recipe_name" class="form-control"  placeholder="Nhập tên món ăn" required>
              <div class="invalid-feedback">Trường này không được bỏ trống.</div>
            </div>
          </div>
          </br>
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Nhóm món ăn</label>
            <div class="col-sm-10">
              <label type="text" class="form-control" name="recipe_category" id="category">{{category}}</label>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Món tương đồng</label>
            <div class="col-sm-10">
              <label type="text" class="form-control" name="recipe_correspond" id="correspond">{{recipe_result}}</label>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">D/s món ăn trong thực đơn</label>
            <div class="col-sm-10">
              <label type="text" class="form-control" id="resultMenu" name="result_menu" >{{menu}}</label>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Đánh giá</label>
            <div class="col-sm-10" >
              <div class="form-check">
                  <input class="form-check-input" type="radio" name="Radios1" id="Radios1"  data-toggle="modal" data-target="#myModal" disabled>
                  <label class="form-check-label" >
                    Hài lòng
                  </label>
               </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="Radios1" id="Radios2"  data-toggle="modal" data-target="#myModal" disabled>
                  <label class="form-check-label" >
                    Bình thường
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="Radios1" id="Radios3"  data-toggle="modal" data-target="#myModal" disabled>
                  <label class="form-check-label" >
                    Không hài lòng
                  </label>
                </div>
            </div>
          </div>
        </div>
        <div class="col-sm-2 text-center">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </div>
       </div>

    </form>
    </div>
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Đánh giá kết quả</h4>
        </div>
        <div class="modal-body">
          <p>Bạn có chắc chắn muốn gửi phản hồi này?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
          <button type="button" action="/rating" class="btn btn-success" id="btn-accept" data-dismiss="modal" onclick="acceptData()">Đồng ý</button>
        </div>
      </div>

    </div>
  </div>

</body>
<script>
  function acceptData(){
    var rate_num = 1
    if($('#Radios1').is(':checked')){
          rate_num = 3;
    }else if($('#Radios2').is(':checked')){
          rate_num = 2;
    }
    $.ajax({
        type: 'POST',
        url: '/rating',
        contentType: 'charset=utf-8',
        dataType: 'json',
        data: {
            recipe_name: $('#recipe_name').val(),
            category: $('#category').text(),
            correspond: $('#correspond').text(),
            result_menu: $('#resultMenu').text(),
            rate_num: rate_num
        },
        success: function(data){
            window.location.href = '/find';
        },
    })
  }
</script>
<script>
  if ($('#resultMenu').text()) {
	$('#Radios1').attr('disabled', false);
	$('#Radios2').attr('disabled', false);
	$('#Radios3').attr('disabled', false);
  }
  else {
    $('#Radios1').attr('disabled', true);
    $('#Radios2').attr('disabled', true);
    $('#Radios3').attr('disabled', true);
  }
</script>
<script>
   var form = document.querySelector('.needs-validation');
   form.addEventListener('submit', function(event) {
        if(form.checkValidity() == false) {
            event.preventDefault();
            event.stopPropagation();
        }
        form.classList.add('was-validated');
   })
</script>

</html>