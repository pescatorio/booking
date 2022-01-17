<!--
  Copyright 2021 Google LLC

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAi3C46MyNhxDh9F8ohI63JVupGZvcuTc4&callback=initMap&libraries=places,geometry&solution_channel=GMP_QB_locatorplus_v4_cABCDE"
	async defer></script>
<style>
#map_ma {
	width: 100vw;
	height: 80vh;
	clear: both;
	border: solid 1px red;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript"> 
	$(document).ready(function() { var myLatlng = new google.maps.LatLng(37.558441577548905, 126.82453474905775); 
	 var Y_point = 37.558441577548905; 
	 var X_point = 126.82453474905775;  
	 var zoomLevel = 18; 
	 var markerTitle = "seoul"; 
	 var markerMaxWidth = 300; 
	 var contentString = '<div>' + '<h2>seoul</h2>'+ '<p>hello google</p>' + '</div>'; 
	 var myLatlng = new google.maps.LatLng(Y_point, X_point); 
	 var mapOptions = { zoom: zoomLevel, center: myLatlng, mapTypeId: google.maps.MapTypeId.ROADMAP } 
	 var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions); 
	 var marker = new google.maps.Marker({ position: myLatlng, map: map, title: markerTitle }); 
	 var infowindow = new google.maps.InfoWindow( { content: contentString, maxWizzzdth: markerMaxWidth } ); 
	 google.maps.event.addListener(marker, 'click', 
			 
	function() { infowindow.open(map, marker); }); 
	 
	 }); 
</script>
	<div id="map_ma"></div>
