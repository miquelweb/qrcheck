  <?php
session_start();
include('Connections/qrcheck.php');
 mysql_select_db($database_qrcheck, $qrcheck);
$query = "SELECT SUM(import) as total FROM operacions WHERE codiclient='".$_SESSION["usuari"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
?>
<div id="esquerra">
<div class="header"><h3>USUARIS</h3></div>
<div class="caixa"><img src="img/temp_home_esq.png" width="140" height="259" /></div>
<div class="botonera"><img src="img/temp_home_botons_esq.png" width="140" height="30" /></div>
<div id="logolacaixa"><img src="img/logo_lacaixa.png" width="140" height="41" /></div>
 </div>
  <div id="central">
<div class="header"><h3>LOCALITZACI&Oacute; DELS PAGAMENTS</h3></div>
<div class="caixa"><div id="mapagran"></div></div>
  </div>
  <div id="dreta">
<div class="header"><h3>PAGAMENTS RECENTS</h3><h2><?php echo str_replace(".",",",$dades["total"]);?></h2></div>
<div class="caixa" style="height:230px;">
<div class="taula">
<div class="headertaula"> 
            <div class="cella" style="width:41px;">HORA</div>
            <div class="cella" style="width:48px;">DATA</div>
            <div class="cella" style="width:104px;">ESTAT</div>
            <div class="cella" style="width:31px;">&euro;</div>
    </div>
    <div id="taulahistoric">
    <?php 
$query = "SELECT * FROM operacions WHERE codiclient='".$_SESSION["usuari"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
	$i=0;
	$classe="";
	if($total>0){
		do{
			$i++;
			if($i%2==0){
				$classe=' parell';
			}
			else{
				$classe='';	
			}
			?>
            <a class="fila<?php echo $classe;?>" href="#" onclick="mostratiquet();return false;">
     <div class="cella" style="width:41px;"><?php echo date("h:i",strtotime($dades["dataoperacio"]));?></div>
				<div class="cella" style="width:48px;"><?php echo date("d/m/y",strtotime($dades["dataoperacio"]));?></div>
			<div class="cella" style="width:64px;"><?php if($dades["estat"]==1){echo "PAGAT";}else{echo "PENDENT";}?></div>
				<div class="cella" style="width:30px;"><?php if($dades["estat"]==1){?><img src="img/icona_pagat_petit.png" width="20" height="16" /><?php }else{?><img src="img/icona_pendent_petit.png" width="20" height="16" /><?php }?></div>
				<div class="cella" style="width:31px;<?php if($dades["estat"]!=1){echo "color:#fff;background-color:#CD161C";}?>"><?php echo str_replace(".",",",$dades["import"]);?></div>
    </a>
	  <?php }while($dades = mysql_fetch_assoc($detall));
	}?>
    </div>
    
</div></div>
<div class="header"><h3>DETALL PAGAMENT</h3><h2 id="totaltiquet"></h2></div>
<div class="caixa" style="height:295px;"><img id="imatge_tiquet" src="img/temp_home_dreta2.png" width="283" height="282" style="display:none" /></div>

   </div>
   <script language="javascript">
   
  /* var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("mapagran"),
        myOptions);
  
   */
   
  var coo="41.403918,2.194676;41.401218,2.195676;41.403818,2.197176;41.402218,2.197976;41.403918,2.199676";
   var nomsag="joan;pere";
   var c=coo.split(";");
	var noms=nomsag.split(";");
	
		coords=c[0];
		
		var lat=coords.substr(0,coords.indexOf(","));
		var longo=coords.substr(coords.indexOf(",")+1);
		
	  var myLatlng = new google.maps.LatLng(lat,longo);
	  var myOptions = {
		zoom: 16,
		center: myLatlng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	  }
	  var map = new google.maps.Map(document.getElementById("mapagran"), myOptions);
	
 	  var image0 = 'img/iconamapa1.png';
 	  var image1 = 'img/iconamapa1.png';
 	  var image2 = 'img/iconamapa2.png';
 	  var image3 = 'img/iconamapa3.png';
 	  var image4 = 'img/iconamapa3.png';
	 
	 // alert(myLatlng);
	  for(i=0;i<c.length;i++){
		  coords=c[i];
		
		var lat=coords.substr(0,coords.indexOf(","));
		var longo=coords.substr(coords.indexOf(",")+1);
		var myLatlng = new google.maps.LatLng(lat,longo);
		  eval("var beachMarker"+i+" = new google.maps.Marker({ position: myLatlng,map: map,icon: image"+i+"})");
	   eval("infowindow"+i+" = new google.maps.InfoWindow({content: '"+noms[i]+"'})");

eval("google.maps.event.addListener(beachMarker"+i+", 'click', function() { infowindow"+i+".open(map,beachMarker"+i+");})");
	}
   </script>