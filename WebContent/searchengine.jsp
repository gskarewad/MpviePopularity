<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>


<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/loader.css">

<script src="script/jquery.min.js"></script>
<script src="script/search.js"></script>
<script type="text/javascript">

var userlat = 1;
var userlang = 1;
	$(document).ready(function() {
		  $("#loader").hide();
		$("#navigation").hide();
		$("#searchbox").keypress(function(e) {
		 	var key =e.which;
			if(key==13)
				searchFunction();})
	 
		$("#SearchButton").click(function() {
			searchFunction();})
	})
	
	  
	 
      
    
</script>
</head>
<body>
	<%
		String u = "user";
		try {
			//	String u = request.getSession().getAttribute("user").toString();
	%>

	<div class="header pull-right">
		<p><%=u%><a href="LogOutServlet"> LogOut</a>
		</p>
	</div>
<center>
	<div class="page-header" id="phead" >
		<center id="originalheader">
			<h1>Ontology Based Search Engine</h1>
		</center>
	</div>
</center>
<nav class="navbar" id="navigation">
<div class="navbarr">
 <a id="btnplaces" onclick="searchFunction()">Places</a> 
 <a id="btnrestaurants" onclick="searchRestaurants()">Restaurants</a>  
 <a id="btnmap" href="ontology.jsp">Semantic Ontology Search</a> 
 <a id="btnhotels" onclick="searchHotels()">Hotels</a> </div>
  </nav>
	<div id="wrapper" id="fform">
		<div class="form" id="form" >
			<input type="text" id="searchbox" value="" /> <input type="button"
				id="SearchButton" value="Search" />
		</div>
	</div>
	<div class="loading" id="loader">
  <div class="loading-bar"></div>
  <div class="loading-bar"></div>
  <div class="loading-bar"></div>
  <div class="loading-bar"></div>
</div>
	<div class="searchdata" id="searchdata">
	 	</div>

	<%
		} catch (Exception e) {
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>