<%@page contentType ="text/html; charset=UTF-8"%>
<html>
<head>
<link rel = "stylesheet" 
	href ="../resources/css/bootstrap.min.css"	/>
<title>회원가입</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class ="jumbotron">
		<div class ="container">
			<h1 class="display-3">회원가입 </h1>
		</div>
	</div>
	<div class ="container">
			<form name="member" action ="./processAddMember.jsp" class ="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">id :</label>
				<div class="col-sm-3">
					<input type="text" name="id"  class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">password :</label>
				<div class="col-sm-3">
					<input type="password" name="password"  class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름 : </label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
					<div class="col-sm-3">
						<input type="radio" name="gender" value="남자" >남성
						<input type="radio" name="gender" value="여자" >여성
					</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-5">
					<input type ="date" name = "birth" class = "form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="email" name="mail" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="tel" name="phone" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="address" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	</div>
</body>
</html>