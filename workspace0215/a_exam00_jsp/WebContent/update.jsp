<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db.jsp" %>
<%
	String sql="select custno, custname, phone, address, "
			+ " to_char(joindate,'yyyy-mm-dd') joindate, "
			+ " decode(grade, "
			+ " 'A','VIP', "
			+ " 'B','일반', "	
			+ " 'C','직원') grade, city from member_tbl_02 "
			+ " where custno="+request.getParameter("custno");
	PreparedStatement pstmt=conn.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	rs.next();
	
	System.out.println(rs.getString("grade"));
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
			<form name="data" action="update_p.jsp" method="post" onsubmit="return CV()">
				<table class="table_line">
					<tr>
						<th>회원번호(자동발생)</th>
						<td><input type="text" name="custno" value="<%= rs.getString("custno") %>" size="10" readonly></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" value="<%= rs.getString("custname") %>" size="10" autofocus></td>
					</tr>
					<tr>
						<th>회원전화</th>
						<td><input type="text" name="phone" value="<%= rs.getString("phone") %>" size="15"></td>
					</tr>
					<tr>
						<th>회원주소</th>
						<td><input type="text" name="address" value="<%= rs.getString("address") %>" size="20"></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="date" name="joindate" id="joindate" value="<%= rs.getString("joindate") %>" size="10"></td>
					</tr>
					<tr>
						<th>고객등급</th>
						<td id="readiogroup">
							<input type="radio" name="grade" value="A" <%=("VIP".equals(rs.getString("grade"))) ? "checked" : ""%>> A-VIP
							<input type="radio" name="grade" value="B" <%=("일반".equals(rs.getString("grade"))) ? "checked" : "" %>> B-일반
							<input type="radio" name="grade" value="C" <%=("직원".equals(rs.getString("grade"))) ? "checked" : "" %>> C-직원</td>
					</tr>
					<tr>
						<th>도시코드</th>
						<td>
							<select id="city" name="city">
								<option value="10">서울</option>
								<option value="20">대전</option>
								<option value="30">대구</option>
								<option value="40">광주</option>
								<option value="50">성남</option>
								<option value="60">수원</option>
								<option value="70">분당</option>
								<option value="80">용인</option>
								<option value="90">과천</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">
						<input type="button" value="취소" onclick="location.href='join.jsp'">
					</tr>
				</table>
				<script>
					document.getElementById("city").value="<%=rs.getString("city") %>";
					document.getElementById("joindate").value =
						new Date().tolSOString().substring(0, 10);
				</script>
			</form>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>