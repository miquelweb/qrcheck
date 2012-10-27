$pendentsanular=0;
/*for(i=1;i<=100;i++){
	eval("var infowindow"+i);	
}*/
var a
 var beachMarker=new Array();
 var infowindow=new Array();
 function mostratiquet(){
	 $("#totaltiquet").html("5,20");
	 $("#imatge_tiquet").show();
 }
 function mostratiquethistoric(){
	 $("#historic_cobraments").attr("src","img/temp_historic_cobraments_o.png")
	 $("#totaltiquet").html("5,20");
	 $("#imatge_tiquet").show();
 }
 function mostrausuari(){
	 $("#imatge_usuaris").attr("src","img//temp_usuari_esq_o.png")
	 $("#usuari_central1").show();
	 $("#usuari_central2").show();
	 $("#saldocompte").show();
	 
	 
 }
 function mostraterminal(){
	 $("#filtre_terminal").attr("src","img//temp_filtre_terminal_o.png")
	 $("#dades_terminal").show();
	 
 }
function mostramapapunts(coo,nomsag){
	var c=coo.split(";");
	var noms=nomsag.split(";");
	
		coords=c[0];
		
		var lat=coords.substr(0,coords.indexOf(","));
		var longo=coords.substr(coords.indexOf(",")+1);
		
	  var myLatlng = new google.maps.LatLng(lat,longo);
	  var myOptions = {
		zoom: 15,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	  }
	  var map = new google.maps.Map(document.getElementById("mapagran"), myOptions);
	
	  var image = 'img/iconamapa.png';
	 
	 // alert(myLatlng);
	  for(i=0;i<c.length;i++){
		  coords=c[i];
		
		var lat=coords.substr(0,coords.indexOf(","));
		var longo=coords.substr(coords.indexOf(",")+1);
		var myLatlng = new google.maps.LatLng(lat,longo);
		  eval("var beachMarker"+i+" = new google.maps.Marker({ position: myLatlng,map: map,icon: image})");
	   eval("infowindow"+i+" = new google.maps.InfoWindow({content: '"+noms[i]+"'})");

eval("google.maps.event.addListener(beachMarker"+i+", 'click', function() { infowindow"+i+".open(map,beachMarker"+i+");})");
	}
	
	
	
}

function mostramapa(coords){
	var lat=coords.substr(0,coords.indexOf(","));
	var longo=coords.substr(coords.indexOf(",")+1);
	
  var myLatlng = new google.maps.LatLng(lat,longo);
  var myOptions = {
    zoom: 15,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("mapa"), myOptions);

  var image = 'img/iconamapa.png';
  var beachMarker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      icon: image
  });
}
function carregadetall(codi){
	$("#caixadetall").load("detall.php?codi="+codi);
	$("#botoneradetall").load("botoneradetall.php?codi="+codi);
}
function initialize() {
  var myLatlng = new google.maps.LatLng(41.987057,2.824802);
  var myOptions = {
    zoom: 15,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById("mapa"), myOptions);

  var image = 'img/iconamapa.png';
  var beachMarker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      icon: image
  });
}
 $(function(){
	 $("#menusuperior a").click(function(){
		//alert("si");
		$("#menusuperior a img").each(function (index) {
          $(this).attr("src","img/"+$(this).attr("id")+".png");
		   
		})
		$(this).children(":first-child").attr("src","img/"+$(this).children(":first-child").attr("id")+"_o.png");
		//$("#contingut").load($(this).children(":first-child").attr("id").substring(5)+".php");
		 return false;
	 })
 })