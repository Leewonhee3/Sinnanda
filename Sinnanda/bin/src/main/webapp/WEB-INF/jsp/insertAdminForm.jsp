<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Skydash Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="../../vendors/feather/feather.css">
  <link rel="stylesheet" href="../../vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="../../images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="../../images/logo.svg" alt="logo">
              </div>
              <h4>관리자 회원가입</h4>
              <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
              <form class="pt-3" method="post" action="insertAdminForm" id="insertAdminForm">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="adminId" id="adminId" placeholder="UserID">
                </div>
               <div class="form-group">
                  <input type="password" class="form-control form-control-lg" name="adminPw" id="adminPw" placeholder="Password">
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" id="adminPw2" placeholder="Repeat Password">
                </div>
                <div class="form-group">
                  <select name="adminPositionNo" id="adminPositionNo" class="form-control form-control-lg">
                  	<option value ="1">1</option>
                  	<option value ="2">2</option>
                  	<option value ="3">3</option>
                  	<option value ="4">4</option>
                  </select>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" id="adminName" name ="adminName" placeholder="adminName">
                </div>
                <div class="form-group">
                  <input type="hidden" class="form-control form-control-lg" name="memberLevel" id="memberLevel" placeholder="memberLevel" value="3" readonly>
                </div>
             
                <div class="mb-4">
                  <div class="form-check">
                    <label class="form-check-label text-muted">
                      <input type="checkbox" class="form-check-input">
                      I agree to all Terms & Conditions
                    </label>
                  </div>
                </div>
                <div class="mt-3">
                  <a class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="return chk_form()">SIGN UP</a>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Already have an account? <a href="login.html" class="text-primary">Login</a>
                </div>
              </form>
            </div>
          </div>
          
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../../js/off-canvas.js"></script>
  <script src="../../js/hoverable-collapse.js"></script>
  <script src="../../js/template.js"></script>
  <script src="../../js/settings.js"></script>
  <script src="../../js/todolist.js"></script>
  <!-- endinject -->
  
  <!-- 유효성 검사 -->
  	<script>
		function chk_form() {
		if(document.getElementById("adminId").value==''){
			alert("ID를 입력하세요.");
			return false;
		}
		if(document.getElementById("adminPw").value==''){
			alert("Password를 입력하세요.");
			return false;
		}
		if(document.getElementById("adminPw").value!=document.getElementById("adminPw2").value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}		
		if(document.getElementById("adminPositionNo").value==''){
			alert("포지션을 입력해주세여");
			return false;
		}
		if(document.getElementById("adminName").value==''){
			alert("나이를 입력하세요.");
			return false;
		}
		
		document.getElementById("insertAdminForm").submit();
		}
	</script>
</body>
</html>