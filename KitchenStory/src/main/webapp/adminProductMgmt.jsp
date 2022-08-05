<%
	User user =  (User) session.getAttribute("current-user");
		if(user == null){
			
			session.setAttribute("message", "You are not logged in !!! Please login first");
			response.sendRedirect("login.jsp");
		}else
		{
			if(user.getUserType().equals("normal")){
			
				session.setAttribute("message", "You are not admin !!! Do not Access this Page...!!!");
				response.sendRedirect("login.jsp");
			}	
			
			
		}


%>

<%@page import="com.kitchenstory.helper.DbConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin-ProductManagement</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<%@include file="components/navbar.jsp"%>
<body>
	<div class="row card-header bg-info mt-3 mb-3">
		<h1 style="color: black;">
			Products Records:
		</h1>
	</div>
	<div class="row">
		<%@include file="components/message.jsp"%>
		<div class="col-md-12">

			<table class="table table-bordered table-secondary">
				<thead>
					<tr>
						<th scope="col">Product-Id</th>
						<th scope="col">Product-Description</th>
						<th scope="col">Product-Discount</th>
						<th scope="col">Product-Name</th>
						<th scope="col">Product-Price</th>
						<th scope="col">Product-Quantity</th>
						<th scope="col">Product-Category</th>
						<th scope="col">UpdateAction</th>
						<th scope="col">DeleteAction</th>
					</tr>
				</thead>
				<tbody>
					<%
								try {

								//String userEmail = request.getParameter("emailId");
								//System.out.println("coming Id for Bill Print is: " + userEmail);
								Connection con = DbConnectionProvider.getCon();
								Statement stmt = con.createStatement();
								ResultSet rs = stmt.executeQuery("select *from product");
								while (rs.next()) {
							%>
					<tr>

						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getString(6)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(8)%></td>
						<td><a href=""><h6>updateRecord</h6></a></td>
						<td><a href=""><h6>deleteRecord</h6></a></td>
					</tr>

					<%
								}

							} catch (Exception e) {
								System.out.println(e);
							}
							%>
				</tbody>

			</table>

		</div>
	</div>

	<!--For Accessing CheckOut Page from directly Cart only -->
	<%@include file="components/common_modals.jsp"%>



</body>
<%@include file="components/footer.jsp"%>
</html>