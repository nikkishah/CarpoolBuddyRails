function initialize() {

    // LAT LONG for where the map will be centered
    var latlng = new google.maps.LatLng(42.363577,-71.10901);

    var mapOptions = {
      center: latlng,
      zoom: 14,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map-canvas"),
        mapOptions);

    // Define Marker properties
    var image = new google.maps.MarkerImage('images/marker.png',
        // This marker is 129 pixels wide by 42 pixels tall.
        new google.maps.Size(129, 42),
        // The origin for this image is 0,0.
        new google.maps.Point(0,0),
        // The anchor for this image is the base of the flagpole at 18,42.
        new google.maps.Point(18, 42)
    );

    // Add Markers
    var marker1 = new google.maps.Marker({
        position: new google.maps.LatLng(42.357325, -71.094437),
        map: map
    });
    var marker2 = new google.maps.Marker({
        position: new google.maps.LatLng(42.348177, -71.108556),
        map: map
    });
    var marker3 = new google.maps.Marker({
        position: new google.maps.LatLng(42.372234, -71.120700),
        map: map
    });    
    // var marker4 = new google.maps.Marker({
    //     position: new google.maps.LatLng(42.3463721,-71.128124),
    //     map: map
    // });

	// Create information window
    function createInfo(title, content) {
        return "<div class='infowindow'><strong>"+ title +'</strong>'+content+'</div>';
    }


    // Add information windows
	var infowindow1 = new google.maps.InfoWindow({
	    content:  createInfo('Esha Atolia', '1.5 miles away')
	});
	var infowindow2 = new google.maps.InfoWindow({
	    content:  createInfo('Eta Atolia', '2 miles away')
	});
	var infowindow3 = new google.maps.InfoWindow({
	    content:  createInfo('John Smith', '0.6 miles away')
	});
	// var infowindow4 = new google.maps.InfoWindow({
	//     content:  createInfo('John Smith', '2.7 miles away')
	// });

    // Add listener for a click on the pin
	google.maps.event.addListener(marker1, 'click', function() {
	    infowindow1.open(map, marker1);
	});
	google.maps.event.addListener(marker2, 'click', function() {
	    infowindow2.open(map, marker2);
	});
	google.maps.event.addListener(marker3, 'click', function() {
	    infowindow3.open(map, marker3);
	});
	// google.maps.event.addListener(marker4, 'click', function() {
	//     infowindow4.open(map, marker4);
	// });

    infowindow1.open(map, marker1);
    infowindow2.open(map, marker2);
    infowindow3.open(map, marker3);
    // infowindow4.open(map, marker4);
}

google.maps.event.addDomListener(window, 'load', initialize);



42.357325, -71.094437