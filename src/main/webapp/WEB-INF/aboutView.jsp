<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Twap It | About</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/css/about.css"/>
	<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
</head>
<body>
<!-- NAVBAR -->

<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #F1F5F4;">
	<span class="navbar-brand mb-0 navbar-text">
		<img src="/img/logo.png"width="20" height="20" alt=""> Twap It
	</span>

	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<a class="nav-item nav-link" href="/dashboard">Home</a>
			<a class="nav-item nav-link active" href="/about">About <span class="sr-only">(current)</span></a>
			<a id="notifications" class="nav-item nav-link notif" href="#">Notifications 
					<c:if test="${invitations != null}">
					<span class="badge badge-secondary">${invitations.size()}</span>
					</c:if>
			</a>
			<a class="nav-item nav-link disabled" href="#">Messages</a>
		</div>
	</div>
	
	<div class="collapse navbar-collapse">
	
	<ul class="navbar-nav ml-auto nav-flex icons">
	
	<!-- SEARCH USERS -->
	<form class="form-inline">
		<div class="input-group">
			<span class="input-group-addon" id="basic-addon1"><i class="fa fa-user"></i></span>
			<input type="text" id="searchUsers" class="form-control" placeholder="Search users" aria-label="tag" aria-describedby="basic-addon1">
		</div>
	</form>
	
	<!-- PROFILE PIC DROPDOWN -->
		<li class="nav-item avatar dropdown">
			<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<c:choose>
					<c:when test="${currentUser.imgUrl.equals('')}">
						<img class="profPic" src="/img/cat_profile-512.png">
					</c:when>
					<c:otherwise>
						<img class="profPic" src="${currentUser.imgUrl}" style="border-radius:50%">
					</c:otherwise>
				</c:choose>
			</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
				<a class="dropdown-item waves-effect waves-light" href="/user/${currentUser.id}">My Profile</a>
				<c:if test="${currentUser.level == 'admin'}">
					<a class="dropdown-item waves-effect waves-light" href="/admin">Admin Dashboard</a>
				</c:if>
				<a class="dropdown-item waves-effect waves-light" id="logoutLink">Logout</a>
			</div>
		</li>
	</ul>
</div>
</nav>

<!-- SEARCH RESULTS DIV -->
<div id="results"></div>

<!--  IF SELF, SHOW INVITATIONS UNDER NOTIFICATIONS BAR -->
<div id="invites">
	<c:forEach var="invite" items="${invitations}">
		<div class="inv">
			<img class="user_pic" src="${invite.imgUrl}">
			<div class="text">
				<p class="user_name">${invite.name}</p>
				<a class="g" href="/accept/${invite.id}">Accept</a> • <a class="r" href="/reject/${invite.id}">Reject</a>
			</div>
		</div>
	</c:forEach>
</div>

<div class="container container-fluid">
<h3>A little background...</h3>
	<div class="row">
		<div class="col-md-7 col-sm-8">
		<div id="about">
			<h4>What's in a name?</h4>
				<p>The name 'Twap It' came from the fact that after our first draft of the project, we looked at it and said "Huh, we made twitter with a map! So, Tw-Ap!"</p>
			
			<h4>Project history:</h4>
				<p>Twap It was inspired by a colleague's time spent working with Syrian refugees in Jordan, and was initially a web app that would allow users to report incidents that were happening around them (anything from the sound of gunfire to potential polio outbreaks) while also viewing incidents that others had reported.</p>
				<p>It was built using Google maps' API with the Spring Boot framework for Java, utilizing the built in Spring Security for user authentication and authorization, and a MySQL database to store information.</p>
				<p>Additional features include being able to search other users and add them as friends, and an admin dashboard for managing users and reports.</p>
				<p>After presenting the site for the first time, we decided to try and widen our potential audience beyond just Syria, and redesigned the app to centers on a user's location. This meant swapping out the report types (conflict, health, human rights vialoation) for "Tags" which are generated by the users and can be clicked on to filter twaps by that tag. </p>
		</div>
		</div>
		
		<div class="col-md-5 col-sm-4">
		<div id="team">
			<h4>Team:</h4>
				<div id="left">
					<div class="us">
						<img class="ourPic" src="/img/cat_profile-512.png">
						<a href="http://dbbwng.com">Debbie Wang</a>
					</div>
					<div class="us">
						<img class="ourPic" src="/img/cat_profile-512.png">
						<a href="http://egsagata.com">Eric Sagata</a>
					</div>
				</div>
				<div id="right">
					<div class="us">
						<img class="ourPic" src="/img/cat_profile-512.png">
						<a href="http://scottmarden.com">Scott Marden</a>
					</div>
					<div class="us">
						<img class="ourPic" src="/img/cat_profile-512.png">
						<a href="https://www.linkedin.com/in/jonathancarlson91104/">Jonathan Carlson</a>
					</div>
				</div>
		</div>
		<div id="upcoming">
			<h4>In The Works!</h4>
				<ul>
					<li>Improve efficiency of loading data points on the map</li>
					<li>Filtering the feed through the map on the main page</li>
					<li>Allowing admins to verify specific twaps or users</li>
					<li>Messaging available between users</li>
					<li>Customizable themes</li>
				</ul>
		</div>
		</div>
	</div>
</div>

<!-- LOGOUT -->
	<form id="logoutForm" method="POST" action="/logout">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="submit" value="" />
	</form>
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>

<script>
<!-- WHEN CLICKING ON NOTIFICATIONS -->
$('#invites').hide();
$(document).ready(function() {
	$(this).click(function(e) {
		if($(e.target).hasClass('notif')) {
			$('#invites').show();
		} else {
			$('#invites').hide();	
		}
	})
})

<!-- LOGOUT FUNCTIONALITY -->
$('#logoutLink').on('click', function(e) {
	e.preventDefault();
	$('#logoutForm').submit();
})

<!-- SEARCH USERS FUNCTIONALITY -->
$('#searchUsers').on('input', function() {
	var searchQuery = $(this).val();
	$.get('/search', {query: searchQuery}, function(response) {
		var results = "";
		if(searchQuery == "") {
			results = "";
		} else if(response.length > 8) {
			for(var i = 0; i < 8; i++) {
				results += "<a href='/user/"+response[i][0]+"'><div class='search_result'><img class='user_pic' src='"+response[i][1]+"'><div class='user_info'><p class='user_name'>"+response[i][2]+"</p><p class='user_email'>"+response[i][3]+"</p></div></div></a>";
			}
		} else {
			for(var i = 0; i < response.length; i++) {
				results += "<a href='/user/"+response[i][0]+"'><div class='search_result'><img class='user_pic' src='"+response[i][1]+"'><div class='user_info'><p class='user_name'>"+response[i][2]+"</p><p class='user_email'>"+response[i][3]+"</p></div></div></a>";
			}
		}
		if(response) {
			$('#results').show().html('<div id="results">'+results+'</div>')
			$(document).click(function(e) {
				if($(e.target).hasClass('form-control')) {
					$('#results').show();
				} else {
					$('#results').hide();
				}
			})
		}
	}, 'json')
})

</script>
</body>
</html>