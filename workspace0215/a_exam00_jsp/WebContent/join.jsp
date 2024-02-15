<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select max(custno)+1 from member_tbl_02";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	rs.next();
	int num=rs.getInt(1);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>쇼핑몰 회원관리</title>
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript">
		function CV() {
			var cv=document.data;
			if(!cv.custname.value){
				alert("회원성명을 입력하세요.")
				cv.custname.focus();
				return false;
			}
			if(!cv.phone.value){
				alert("전화번호를 입력하세요.")
				cv.phone.focus();
				return false;
			}
			if(!cv.address.value){
				alert("회원주소를 입력하세요.")
				cv.address.focus();
				return false;
			}
			if(!cv.joindate.value){
				alert("가입일자를 입력하세요.")
				cv.joindate.focus();
				return false;
			}
			alert("회원등록이 완료되었습니다!")
		}
	
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	<main id="section">
		<h2 class="title">쇼핑몰 회원관리 프로그램</h2>
			<form name="data" action="join_p.jsp" method="post" onsubmit="return CV()">
				<table class="table_line">
					<tr>
						<th>회원번호(자동발생)</th>
						<td><input type="text" name="custno" value="<%= num %>" size="10" readonly></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" size="10" autofocus></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name="phone" size="15"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address" size="20"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="date" name="joindate" id="joindate" size="10"></td>
					</tr>
					<tr>
						<th>고객등급</th>
						<td><input type="radio" name="grade" value="A">A-VIP
							<input type="radio" name="grade" value="B">B-일반
							<input type="radio" name="grade" value="C" checked>C-직원</td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td>
							<select name="city">
								<option value="10">서울</option>
								<option value="20">대전</option>
								<option value="30">대구</option>
								<option value="40">광주</option>
								<option value="50" selected>성남</option>
								<option value="60">수원</option>
								<option value="70">분당</option>
								<option value="80">용인</option>
								<option value="90">과천</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="location.href='join.jsp'">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
					</tr>
				</table>
				<script>
					document.getElementByld("joindate").value =
						new Date().tolSOString().substring(0, 10);
				</script>
			</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>