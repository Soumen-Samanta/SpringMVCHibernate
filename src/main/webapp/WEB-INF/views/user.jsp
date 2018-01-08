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
<script type="text/javascript">
	function submitted() {
		alert("order submitted");
	}

	function createorder() {

		 document.getElementById("updateform").style.display="none";
		 document.getElementById("createform").style.display="block";
	}
	function updateorder() {
		document.getElementById("createform").style.display="none";
		 document.getElementById("updateform").style.display="block";
		 
	}
</script>
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
	<div class="w3-sidebar w3-bar-block w3-light-grey" style="width: 25%">
		<a href="#" class="w3-bar-item w3-button">Administration</a> <a href="#"
			class="w3-bar-item w3-button">Shopping</a> <a href="#"
			class="w3-bar-item w3-button">Reporting</a>
	</div>

	<div style="margin-left: 25%">
		<div class="w3-bar w3-blue">
			<a href="#" class="w3-bar-item w3-button" onclick="createorder()">Create Order</a> 
			<a href="#" class="w3-bar-item w3-button" onclick="updateorder()">Update Order</a>
		</div>
		<form class="w3-container w3-card-4 w3-margin-top" onsubmit="submitted()"
			style="display: none" id="createform">
			<select class="w3-select" name="option">
				<option value="" disabled selected>Select items</option>
				<option value="1">item 1</option>
				<option value="2">item 2</option>
				<option value="3">item 3</option>
				<option value="1">item 4</option>
				<option value="2">item 5</option>
				<option value="3">item 6</option>
			</select>
			<label class="w3-text-teal"><b>Quantity</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text">
			<label class="w3-text-teal"><b>Total amount</b></label>
			<p>
				<button class="w3-btn w3-teal">Place order</button>
			</p>
		</form>
		<form class="w3-container w3-card-4 w3-margin-top" onsubmit="updated()"
			style="display: none" id="updateform">
			<label class="w3-text-teal"><b>Item :</b></label>
			<label class="w3-text-teal"><b>Total amount</b></label>
			<label class="w3-text-teal"><b>Quantity</b></label>
            <input class="w3-input w3-border w3-light-grey" type="text">
			<p>
				<button class="w3-btn w3-teal">Update order</button>
			</p>
		</form>
	</div>




</body>
</html>