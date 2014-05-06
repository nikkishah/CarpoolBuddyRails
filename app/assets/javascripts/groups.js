$(".existing_group_btn").click(function(){
	 		window.location.href = "map-search.html";
	 	});

var params = getParams()
$(document).ready( function() {
	if (params['bool'] == "true"){
		console.log("here");
		window.setTimeout(function(){changeNotification()}, 3000);
	};
});

if (params['bool'] == "true"){
	// make the table visible
	$(".request_table").css("visibility", "visible");

// date from: http://stackoverflow.com/questions/1531093/how-to-get-current-date-in-javascript
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = mm+'/'+dd+'/'+yyyy;

	var rowHtml =  "<tr id='request'>" +
				   "<td class='bordered_cell'>" +  params['name'].replace("-", " ") + "</td>" +
				   "<td class='bordered_cell'>" + today + "</td>" +
				   "<td class='bordered_cell' id='status'>Pending</td>" +
				   "<td class='unbordered_cell' id='groupButton'><button id='cancel' type='button' class='btn btn-danger btn-large cancel_request_btn'>Cancel Request</button></td>" +
				   "</tr>";
	// adds a row to the table. the negative one means it will add it to the end of the table
	$(".request_table > tbody:last").append(rowHtml);
	// $("#cancel").click(function() {
	// 	alert("HIIIII");
	// 	$("#request").remove();
	// });
} 
$("#notificationTitle").click( function(){
	$("#notificationNum").text("0");
	$("#notificationNum").removeClass("alert-danger");
});
function changeNotification(){
	console.log("hereeeee");
	name = params["name"].replace("-"," ");
	$("#groupNotification").text(name + " has accepted your group request");
	$("#notificationNum").text("1");
	$("#notificationNum").addClass("alert-danger");
	$("#status").html("Accepted");
	$("#groupButton").html('<button id="accept" type="button" class="btn btn-success btn-large accept_request_btn">Confirm Group</button>');
	$("#accept").click(function() {
		$("#no_group").remove();
		// $(".request_table").css("visibility", "hidden");
		$("#empty_feed").remove();

		var joinedHtml = "<h4 class='no_group_feed_heading'>Ben Bitdiddle joined " + name + "'s group.</h4>"
		$("#feed_div").append(joinedHtml);
		$("#accept").html("View Group");
	});
};
function getParams() {
	var params = {}; 
	var parts = (window.location.search || '').split(/[&?]/); 
	for (var i = 0; i < parts.length; i++) { 
	 var eq = parts[i].indexOf('='); 
	 if (eq < 0) continue; 
	 params[decodeURIComponent(parts[i].substring(0, eq))] 
	 = decodeURIComponent(parts[i].substring(eq+1)); 
	}
	return params
}

