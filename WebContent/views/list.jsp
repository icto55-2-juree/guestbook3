<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page import="java.util.List" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<style type="text/css">
#content{
background-image: url("assets/images/rilak.JPG");
height: 600px;
}
#gbookinput{
margin: 0 0 0 0;
border-color: black;
}
#gbooklist{
margin: 10px;
border: none;
}
#message{
width: 100%;
}
</style>

</head>
<body>
	<div id="container">
		
		<div id="content">
			<div id="guestbook">
				<form action="/guestbook3/insert" method="post">
					<table id="gbookinput">
						<tr>
							<td>이름</td><td><input type="text" name="name" value="${authMember.name }"></td>
							<td>비밀번호</td><td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="message" id="message"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=center><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li>
					<c:forEach var="g" items="${list }">
						<table id="gbooklist">
							<tr>
								<td>${g.no }</td>
								<td>${g.name }</td>
								<td>${g.regDate}</td>
								<td><a href="/mysite/guestbook?a=gdelete&no=${g.no }&password=${g.password }">삭제</a></td>
								<!-- <td><a href="/mysite/views/guestbook/deleteform.jsp">삭제</a></td> -->
							</tr>
							<tr>
								<td colspan=4>${fn:replace(g.message, newLineChar, "<br>") }</td>
							</tr>
						</table>
						</c:forEach>
						<br>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>