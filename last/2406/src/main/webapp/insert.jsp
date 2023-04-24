<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "check.js"></script>
</head>
<body>
	<jsp:include page = "header.jsp"></jsp:include>
	<section>
		<h2>(제품별)출고매출이익통계</h2>
		<form name = "frm" action = "action.jsp" method = "post">
			<table border = "1">
			<%
					String num = "";
					try{
						 Class.forName("oracle.jdbc.OracleDriver");
						    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						    Statement stmt = con.createStatement();
						    ResultSet rs =stmt.executeQuery("select MAX(t_no)+1 as t_no from tbl_inout_202002");
						    rs.next();
						    num = rs.getString("t_no");
						    stmt.close();
							con.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					
				%>
				<tr>
					<td>입출번호</td>
					<td><input type='text' name = 't_no'  value = '<%=num%>' readonly></td>
				</tr>
				<tr>
					<td>제품코드</td>
					<td><input type='text' name = 'p_code'></td>
				</tr>
				<tr>
					<td>입출고구분</td>
					<td>
						<input type="radio" name="t_type" value="I" > <label>입고</label>
						<input type="radio" name="t_type" value="O" > <label>출고</label>
					</td>
				</tr>
				<tr>
					<td>수량</td>
					<td><input type='text' name = 't_cnt'></td>
				</tr>
				<tr>
					<td>거래일자</td>
					<td><input type='text' name = 't_date'></td>
				</tr>
				<tr>
					<td>거래처</td>
					<td>
						<select name="c_code">
							<option value="0">거래처선택
							<option value="10">서울공장
							<option value="20">울산공장
							<option value="30">부산상사
							<option value="40">광주상사
							<option value="50">대전상사
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="입출고등록" onclick="Check()">
						<input type="reset" value="다시하기" onclick="return alert('취소되었습니다.')">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page = "footer.jsp"></jsp:include>
	
</body>
</html>