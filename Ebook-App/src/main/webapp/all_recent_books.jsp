<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Books</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllRecentBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("old")) {
							%>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						Categories:
						<%=b.getBookCategory()%></p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-5"><li
								class="fas fa-cart-plus"></li> Add cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-5"><li
								class="fas fa-cart-plus"></li> Add cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<!-- <div class="row">
							<a href="" class="btn btn-danger btn-sm ml-5"><li class="fas fa-cart-plus"></li> Add cart</a>
							<a href="" class="btn btn-success btn-sm ml-1">View details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign"></i>b.getPrice()e() %></a>
						</div>  -->
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>