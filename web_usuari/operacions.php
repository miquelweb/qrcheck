  <?php
session_start();
include('Connections/qrcheck.php'); 
 mysql_select_db($database_qrcheck, $qrcheck);
$query = "SELECT * FROM operacions LEFT JOIN comercos ON operacions.codicomerc=comercos.codicomerc WHERE codiclient='".$_SESSION["usuari"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
?>
<div id="esquerra">
<div class="header"><h3>FILTRE</h3></div>
<div class="caixa"><img src="img/temp_filtre_comerc.png" width="139" height="232" /></div>
<div id="logolacaixa"><img src="img/logo_lacaixa.png" width="140" height="41" /></div>
 </div>
  <div id="central">
<div class="header"><h3>HIST&Ograve;RIC DE PAGAMENTS</h3></div>
<div class="caixa"><div class="taula">
<div class="headertaula"> 
            <div class="cella" style="width:41px;">HORA</div>
            <div class="cella" style="width:48px;">DATA</div>
            <div class="cella" style="width:130px;">ESTABLIMENT</div>
            <div class="cella" style="width:104px;">CIUTAT</div>
            <div class="cella" style="width:104px;">ESTAT</div>
            <div class="cella" style="width:31px;">&euro;</div>
    </div>
    <div id="taulahistoric">
    <?php 
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
            <div class="cella" style="width:130px;"><?php echo $dades["nomcomerc"];?></div>
            <div class="cella" style="width:104px;"><?php echo $dades["ciutatcomerc"];?></div>
			<div class="cella" style="width:64px;"><?php if($dades["estat"]==1){echo "PAGAT";}else{echo "PENDENT";}?></div>
				<div class="cella" style="width:30px;"><?php if($dades["estat"]==1){?><img src="img/icona_pagat_petit.png" width="20" height="16" /><?php }else{?><img src="img/icona_pendent_petit.png" width="20" height="16" /><?php }?></div>
				<div class="cella" style="width:31px;<?php if($dades["estat"]!=1){echo "color:#fff;background-color:#CD161C";}?>"><?php echo str_replace(".",",",$dades["import"]);?></div>
    </a>
	  <?php }while($dades = mysql_fetch_assoc($detall));
	}
	
$query = "SELECT SUM(import) as total FROM operacions WHERE codiclient='".$_SESSION["usuari"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);?>
    </div>
    
</div>
 </div>
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