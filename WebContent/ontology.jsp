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

<script type="text/javascript">
var pll='';

var srlang = 'en';
$(document).ready(function() {
	  $("#loader").hide();
	//$("#navigation").hide();
	$("#searchbox").keypress(function(e) {
		srlang='en';
	 	var key =e.which;
		if(key==13){ var key = $("#searchbox").val();
		if (key == "") {
			alert('please insert something');
		}else
			searchbabel(key);}})

	$("#SearchButton").click(function() {
		var key = $("#searchbox").val();
		if (key == "") {
		alert('please insert something');
	}else
		searchbabel(key);})
})

     function searchbabel(place) {
	var sdata = $("#searchdata");
	   sdata.empty();
	   pll=place;
        var params = {
            // Request parameters
        'word': place,
    	'langs': 'EN',
    	'key' :  '88480427-ef6d-4d2f-83d3-75a37f15b457'
        };
      
        $.ajax({
            url: "https://babelnet.io/v4/getSynsetIds?" + $.param(params),
            beforeSend: function(xhrObj){
             },
            type: "GET",
         })
        .done(function(data) {
            console.log('get synsets') ;console.log(data);
         $.each(data, function(key, val){
         var bbid =val['id'];
         getsynsetinfo(bbid);
          })
        })
        .fail(function() {
            alert("error");
        });
    } 

   function getsynsetinfo(bbid){
      var params = {
         'key' :  '88480427-ef6d-4d2f-83d3-75a37f15b457',
         'id': bbid
        };
      var sdata = $("#searchdata");
      var html='<div class="col-md-12 row" > <div class="col-md-3">'+
      '<div class="searchElement"> <img style="height:300px;width:200px;"class="img-circle img-thumbnail" src="';
       $.ajax({
        url : "https://babelnet.io/v4/getSynset?"+$.param(params),
        type:"GET",
        })
        .done(function(data){ console.log('get syninfo');
        console.log(data);
        var images = data.images;
        var url='';
        try{
         url = images[0].thumbUrl;}catch(err){}
        var sense = data.mainSense;
        var glossarray = data.glosses;
        var gloss ='';
        var typearray = data.categories;
        var cats ='';
        $.each(typearray,function(key,val){
        	cats = cats+' <a>'+val['category']+'</a> ;';
        })
        $.each(glossarray, function(key, val){
             gloss = gloss+'<p>'+val['gloss']+'</p> ';
              })
        
        html= html+url+'"/> </div> </div><div class="col-md-9"><br> <b><h3>'+sense+'</h3></b><br><a href="https://en.wikipedia.org/wiki/'+pll+'">Go To WikiPedia</a><br><p id="glosstext">'+gloss 
        +'</p>  <h4>Applied Ontologies</h4><nav>'+cats+' </nav> </div></div><br>';
        sdata.append(html);
        })
        .	fail(function(){alert("error")});
       // alert(html);
       
   }

</script>
<script>
function changelanguage(language){
    	console.log('in changelanguage'); 
    	
   $( "p" ).each(function( index ) {
	   console.log( index + ": " + $( this ).text() );
	   var newtext='';
	   //alert(index);
	   var originaltext=$(this).text();
	    var line =  $(this); 
	   console.log(originaltext);
	    
	   var params ={
			   'client':'gtx',
			   'sl':srlang,
			    'tl':language,
			    'dt':'t',
			    'q':originaltext	   
	   };
	   $.ajax({
		   url:"https://translate.googleapis.com/translate_a/single?"+ $.param(params),
           type:"GET",	 
           dataType:"text",
	   })
	   .done(function(data) {
		   console.log(data);
		//   $(this).text(newtext);
	    try {
	   		  newtext=data.slice(4,data.search("\","));  
	   	       line.text(newtext);	  
	    } catch(err){
	    	console.log('error '+err)
	    }
	    console.log('newtext '+newtext); 
	   
	   })
	 .fail(function(data){
		 console.log('failure '+data);
		 alert("error")}
	 );
 	   
	  }); 
   srlang = language;
}
</script>
  </head>
<body>
	<%
		String u = "user";
		try {
			//	String u = request.getSession().getAttribute("user").toString();
	%>

	<div class="header pull-right">
		<h4><%=u%><a href="LogOutServlet"> LogOut</a>
		</h4>
	</div>
<center>
	<div class="page-header" id="phead" >
		<center id="originalheader">
			<h1> Ontology Based Search Engine</h1>
		</center>
	</div>
</center>
<nav class="navbar" id="navigation">
<div class="navbarr">
 <a id="btnplaces" onclick="changelanguage('hi')">Hindi</a> 
 <a id="btnrestaurants" onclick="changelanguage('mr')">Marathi</a>  
 <a id="btnmap" onclick="changelanguage('fr')">French</a> 
 <a id="btnhotels" onclick="changelanguage('ta')">Tamil</a>  
 <a id="btnhotels" onclick="changelanguage('en')">English</a> </div>
  </nav>
	<div id="wrapper" id="fform">
		<div class="form" id="form" >
			<input type="text" id="searchbox" value="" /> <input type="button"
				id="SearchButton" value="Search" />
		</div>
	</div>
<!-- 	<div class="loading" id="loader"> -->
<!--   <div class="loading-bar"></div> -->
<!--   <div class="loading-bar"></div> -->
<!--   <div class="loading-bar"></div> -->
<!--   <div class="loading-bar"></div> -->
<!-- </div> -->

  	<div class="searchdata " id="searchdata">	  
<!-- 	<div class="col-md-12"> -->
<!-- 	<div class="col-md-3">	 -->
<!-- 	<div class="searchElement"> -->
<!-- 	<img class="img-circle img-thumbnail" src="data:image/jpeg;base64,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"> -->
<!-- 	</div></div> -->
<!-- 	<div class="col-md-9"> <br><br><br><br> <p>sdafkj hsdkj fkljhs dkjf hskjdf hjs dl</p> -->
	 
<!-- 	<p>sda fkj hsdkj fkl jhs dkjf hsk jdf hjs dl</p><br><br> -->
<!-- 	</div> -->
<!-- 	</div> -->

 	 	</div>
 
	<%
		} catch (Exception e) {
			response.sendRedirect("login.jsp");
		}
	%>
</body>
</html>