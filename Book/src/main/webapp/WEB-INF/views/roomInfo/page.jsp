<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(){
	var getRoomNo=getParameterByName('room_no');
	if(getRoomNo!=null){
		if(getRoomNo=='701')
			document.getElementById('room701').focus();
		if(getRoomNo=='702')
			document.getElementById('room702').focus();
		if(getRoomNo=='703')
			document.getElementById('room703').focus();
		if(getRoomNo=='704')
			document.getElementById('room704').focus();
		if(getRoomNo=='705')
			document.getElementById('room705').focus();
		if(getRoomNo=='706')
			document.getElementById('room706').focus();
	}
});
	

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}



</script>

<div class="container marketing">


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
      <h2 class="featurette-heading">room 701<span class="text-muted">It'll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
        <a href="../consultation/page?room_no=701"><button type="button" class="btn btn-sm btn-outline-secondary"  id="room701">consultation</button></a>
      </div>
      <div class="col-md-5">
		<img src="../resources/image/image500X500/room1.jpg"  align="middle" style="max-width: 100%; height: auto;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">room 702 <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
        <a href="../consultation/page?room_no=702"><button type="button" class="btn btn-sm btn-outline-secondary" id="room702">consultation</button></a>
      </div>
      <div class="col-md-5 order-md-1">
	<img src="../resources/image/image500X500/room2.jpg"  align="middle" style="max-width: 100%; height: auto;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">room 703 <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
        <a href="../consultation/page?room_no=703"><button type="button" class="btn btn-sm btn-outline-secondary" id="room703">consultation</button></a>
      </div>
      <div class="col-md-5">
	<img src="../resources/image/image500X500/room3.jpg"  align="middle" style="max-width: 100%; height: auto;">
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">room 704 <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
        <a href="../consultation/page?room_no=704"><button type="button" class="btn btn-sm btn-outline-secondary" id="room704">consultation</button></a>
      </div>
      <div class="col-md-5 order-md-1">
		<img src="../resources/image/image500X500/room4.jpg"  align="middle" style="max-width: 100%; height: auto;">
      </div>
    </div>
    
	 <hr class="featurette-divider">
	
	 <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">room 705 <span class="text-muted">It'll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
        <a href="../consultation/page?room_no=705"><button type="button" class="btn btn-sm btn-outline-secondary" id="room705">consultation</button></a>
      </div>
      <div class="col-md-5">
	<img src="../resources/image/image500X500/room5.jpg"  align="middle" style="max-width: 100%; height: auto;">
      </div>
    </div>
    
    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading" >room 706 <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
        <a href="../consultation/page?room_no=706"><button type="button" class="btn btn-sm btn-outline-secondary" id="room706">consultation</button></a>
      </div>
      <div class="col-md-5 order-md-1">
		<img src="../resources/image/image500X500/room6.jpg"  align="middle" style="max-width: 100%; height: auto;">
      </div>
    </div>
  </div>