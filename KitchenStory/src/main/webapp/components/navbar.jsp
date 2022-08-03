<!-- Conditional Rendering for logout Button when user is Logged In -->
<%@page import="com.kitchenstory.entities.User"%>

<%
	User userNavbar = (User) session.getAttribute("current-user");
%>


<nav class="navbar navbar-expand-lg navbar-light bg-primary">
	<div class="container">
		<a class="navbar-brand" href="kitchenStoryWelcome.jsp"><b>Kitchen-Story</b></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"><b>Home-Page</b> <span class="sr-only">(current)</span>
				</a></li>

			</ul>

			<ul class="navbar-nav ml-auto">

				<!-- For Add Cart Option -->
				<li class="nav-item active"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#cart"> <i
						class="fa fa-cart-plus" style="font-size: 20px;"></i> <span
						class="ml-0 cart-items">( 0 )</span>
				</a></li>

				<%
					if (userNavbar == null) {
				%>

				<li class="nav-item active"><a class="nav-link"
					href="login.jsp"><b>Login-Here</b></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="register.jsp"><b>New-User</b> </a></li>

				<li class="nav-item active"><a class="nav-link"
					href="aboutUS.jsp"><b>Know About-Us</b></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="contactUS.jsp"><b>Send any Query to Us</b></a></li>

				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="<%=userNavbar.getUserType().equals("admin") ? "admin.jsp" : "normalUser.jsp"%>">
						<b> <%=userNavbar.getUserName()%>
					</b>
				</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="LogoutCtl"><b>User-Logout</b></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="aboutUS.jsp"><b>Know About-Us</b></a></li>

				<li class="nav-item active"><a class="nav-link"
					href="contactUS.jsp"><b>Send any Query to Us</b></a></li>

				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>