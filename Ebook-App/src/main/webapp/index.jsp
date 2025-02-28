<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_components/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/b.jpg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #f7f7f7;
}

a {
	text-decoration: none;
	color: black
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_components/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-success">EBook Management System</h2>
	</div>
	<!-- < Connection conn = DBConnect.getConn();
	out.println(conn); %> -->

	<!-- start recent book -->
	<hr>
	<div class="conatiner">
		<h3 class="text-center" id="recent">Recent Books</h3>
		<div class="row">
			<%
			BookDaoImpl dao2 = new BookDaoImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("old")) {
							%>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-success btn-sm ml-5">View details</a> <a
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
		<!-- 		
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="img/P.jpg" style="width:150px; height:200px class="img-thumblin">
					<p>Python Programming</p>
					<p>Jason Wes</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5"><li class="fas fa-cart-plus"></li> Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>
		</div>
			
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="img/S.jpg" style="width:150px; height:200px class="img-thumblin">
					<p>SQL</p>
					<p>Mark Reed</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5"><li class="fas fa-cart-plus"></li> Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>
		</div>
			
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="img/D.jpg" style="width:150px; height:200px class="img-thumblin">
					<p>Data Scinece</p>
					<p>Loenard Deep</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5"><li class="fas fa-cart-plus"></li> Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>		
		</div>
	 -->

	</div>
	<hr>
	<div class="text-center mt-1">
		<a href="all_recent_books.jsp"
			class="btn btn-danger btn-sm text-white">View All</a>
	</div>
	</div>
	<hr>
	<!-- start new book -->

	<div class="conatiner">
		<h3 class="text-center" id="new">New Books</h3>
		<div class="row">

			<%
			BookDaoImpl dao1 = new BookDaoImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao1.getNewBook();
			for (BookDtls b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
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
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>


		<!--
			
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="" style="width:150px; height:200px class="img-thumblin">
					<p>Java Programming</p>
					<p>Balgurswamy</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5"><li class="fas fa-cart-plus"></li> Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>
		</div>
			
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="" style="width:150px; height:200px class="img-thumblin">
					<p>Java Programming</p>
					<p>Balgurswamy</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5"><li class="fas fa-cart-plus"></li> Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>		
		</div>
	-->
	</div>
	<hr>
	<div class="text-center mt-1">
		<a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white">View
			All</a>
	</div>
	</div>
	<hr>

	<!-- start old book -->

	<div class="conatiner">
		<h3 class="text-center" id="old">Old Books</h3>
		<div class="row">
			<%
			BookDaoImpl dao3 = new BookDaoImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="img/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row ml-4">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View details</a> <a href=""
								class="btn btn-danger btn-sm ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<!--  		
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="" style="width:150px; height:200px class="img-thumblin">
					<p>Java Programming</p>
					<p>Balgurswamy</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5">Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>
		</div>
			
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="" style="width:150px; height:200px class="img-thumblin">
					<p>Java Programming</p>
					<p>Balgurswamy</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5">Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>
		</div>
			
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="" style="width:150px; height:200px class="img-thumblin">
					<p>Java Programming</p>
					<p>Balgurswamy</p>
					<p>Categories: New</p>
					<div class="row">
					<a href="" class="btn btn-danger btn-sm ml-5">Add cart</a>
					<a href="" class="btn btn-success btn-sm ml-1">View details</a>
					<a href="" class="btn btn-danger btn-sm ml-1">299</a>
					</div>
				</div>
			</div>		
		</div>
	-->

	</div>
	<hr>
	<div class="text-center mt-1">
		<a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white">View
			All</a>
	</div>
	</div>
	<hr>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>