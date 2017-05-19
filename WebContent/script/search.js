function searchFunction() {
	$("#btnplaces").css('color','#661aff');
	$("#btnmap").css('color','black');
	$("#btnhotels").css('color','black');
	$("#btnrestaurants").css('color','black');
	 
	var key = $("#searchbox").val();
	if (key == "") {
		alert('please insert something');
	} else {
 		$.ajax({
			type : "GET",
			url : "SearchServlet?key=" + key,
			datatype : "json",
			contentType : "application/json; charset=utf-8",
			// error : alert('error'),
			cache : false,
			beforeSend : function() {
				$("#loader").show();
			},
			complete : function() {
				$("#loader").hide();
			},
			success : function(data) {
				var a = 0;
				var data = JSON.parse(data);
				$("#originalheader").hide();
 				$("#navigation").show();
 				$("#phead").append($("#form"));
				var search = $("#searchdata");
				search.empty();
				var lhtml = "";
				$.each(data.results, function(i, item) {
					lhtml = lhtml + '<div class="sarchElement" >'
							+ '<p style="color:blue"><b>'
							+ data.results[i].name + '</b></p>' + '<p>'
							+ data.results[i].formatted_address + '</p>'
							+ '<p>' + data.results[i].types[0] + '</p>'
						//	+ '<p> Open Now :' + data.results[i].opening_hours.open_now+'</p>'
							+ '<br></div>';
				})
				search.append(lhtml);
			}
		});
	}
 }

function searchRestaurants() {
	$("#btnplaces").css('color','black');
	$("#btnmap").css('color','black');
	$("#btnhotels").css('color','black');
	$("#btnrestaurants").css('color','#661aff');
	 var key = $("#searchbox").val();
	if (key == "") {
		alert('please insert something');
	} else {
 		$.ajax({
			type : "GET",
			url : "SearchRestaurants?place=" + key,
			datatype : "json",
			contentType : "application/json; charset=utf-8",
			// error : alert('error'),
			cache : false,
			beforeSend : function() {
				$("#loader").show();
			},
			complete : function() {
				$("#loader").hide();
			},
			success : function(data) {
				var a = 0;
				var data = JSON.parse(data);
				$("#originalheader").hide();
 				$("#navigation").show();
 				$("#phead").append($("#form"));
				var search = $("#searchdata");
				search.empty();
				var lhtml = "";
				$.each(data.results, function(i, item) {
					lhtml = lhtml + '<div class="sarchElement" >'
							+ '<p style="color:blue"><b>'
							+ data.results[i].name + '</b></p>' + '<p>'
							+ data.results[i].formatted_address + '</p>'
							+ '<p>' + data.results[i].types[0] + '</p>'
						//	+ '<p> Open Now :' + data.results[i].opening_hours.open_now+'</p>'
							+ '<br></div>';
				})
				search.append(lhtml);
			}
		});
	}
 }


function searchHotels() {
	$("#btnplaces").css('color','black');
	$("#btnmap").css('color','black');
	$("#btnhotels").css('color','#661aff');
	$("#btnrestaurants").css('color','black');
	 var key = $("#searchbox").val();
	if (key == "") {
		alert('please insert something');
	} else {
 		$.ajax({
			type : "GET",
			url : "SearchHotels?place=" + key,
			datatype : "json",
			contentType : "application/json; charset=utf-8",
			// error : alert('error'),
			cache : false,
			beforeSend : function() {
				$("#loader").show();
			},
			complete : function() {
				$("#loader").hide();
			},
			success : function(data) {
				var a = 0;
				var data = JSON.parse(data);
				$("#originalheader").hide();
 				$("#navigation").show();
 				$("#phead").append($("#form"));
				var search = $("#searchdata");
				search.empty();
				var lhtml = "";
				$.each(data.results, function(i, item) {
					lhtml = lhtml + '<div class="sarchElement" >'
							+ '<p style="color:blue"><b>'
							+ data.results[i].name + '</b></p>' + '<p>'
							+ data.results[i].formatted_address + '</p>'
							+ '<p>' + data.results[i].types[0] + '</p>'
					//		+ '<p> Open Now :' + data.results[i].opening_hours.open_now+'</p>'
							+ '<br></div>';
				})
				search.append(lhtml);
			}
		});
	}
 }
