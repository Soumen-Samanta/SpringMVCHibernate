<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<body bgcolor="pink">
<head>
<title>Home</title>
</head>
<body>
	<div class="w3-container w3-padding-small w3-theme-d3">
		<div class="w3-right">
			<i class="fa fa-volume-up"></i> <i class="fa fa-wifi"></i> <i
				class="fa fa-battery-2"></i> 12:30
		</div>
	</div>

	<div class="w3-bar w3-theme w3-xlarge">
		<a class="w3-bar-item w3-button" href="#"><i class="fa fa-bars"></i></a>
		<span class="w3-bar-item">IQ SOFTWARE SERVICES</span> <a
			class="w3-bar-item w3-button w3-right" href="#"><i
			class="fa fa-search"></i></a>
	</div>
      <form class="w3-container w3-display-middle" action="userLogin" method="post">
  <label class="w3-text-teal"><b>username</b></label>
  <input class="w3-input w3-border w3-light-grey" type="text" name="userName">

  <label class="w3-text-teal"><b>Password</b></label>
  <input class="w3-input w3-border w3-light-grey" type="password" name="password">

  <button class="w3-btn w3-blue-grey">Register</button>
   <div style="color: red">${error}</div>
</form>
</body>
</html>