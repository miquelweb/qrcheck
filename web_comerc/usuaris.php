  <?php
session_start();
include('Connections/qrcheck.php'); 
 mysql_select_db($database_qrcheck, $qrcheck);
$query = "SELECT SUM(import) as total FROM operacions WHERE codicomerc='".$_SESSION["comerc"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
$service_url = 'http://finappsapi.bdigital.org/api/2012/a12fef73cb/f4b-be71-1db309b43c95/operations/account/508b2864e4b04a375aa9661b';
 $headers = array('Accept: application/json','Content-Type: application/json');
       $curl = curl_init($service_url);
       //$curl_post_data = '{"accountNumber": "2100 1111 53 0000000177","value": 1000,"additionalData": {"concept": "ingres","payee": "algu"}}';
       curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	   //curl_setopt($curl, CURLOPT_USERPWD, "mviladomat:123456");
	   curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
       //curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);
       $curl_response = curl_exec($curl);
       curl_close($curl);
 
 $matriu=json_decode($curl_response,true);
 $saldo=$matriu["data"]["availableBalance"];

?>
<div id="esquerra">
<div class="header"><h3>FILTRE</h3></div>
<div class="caixa"><a href="#" onclick="mostrausuari();return false"><img id="imatge_usuaris" src="img/temp_usuari_esq_o.png" width="140" height="143" /></a></div>
<div id="logolacaixa"><img src="img/logo_lacaixa.png" width="140" height="41" /></div>
 </div>
  <div id="central">
<div class="header"><h3>DADES USUARI</h3></div>
<div class="caixa" style="height:262px;"><img id="usuari_central1" src="img/temp_usuari_central1.png" width="538" height="262" /></div>
<div class="header"><h3>COMPTES USUARIS</h3></div>
<div class="caixa" style="height:122px;"><img id="usuari_central2" src="img/temp_usuari_central2.png" width="536" height="122" /><div style="margin-top:-95px;margin-left:355px;"><input name="saldocompte" id="saldocompte" style="width:179px;height:46px;border: solid 1px #157F38; background-color:#C7FF89; color:#157F38; font-size:30px;text-align:right;font-weight:bold;" value="<?php echo $saldo;?>€" /></div>
</div>
  </div>
  <div id="dreta">
<div class="header"><h3>DARRERES OPERACIONS</h3><h2><?php echo str_replace(".",",",$dades["total"]);?></h2></div>
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
	
$query = "SELECT * FROM operacions WHERE codicomerc='".$_SESSION["comerc"]."'";	
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
			<div class="cella" style="width:64px;"><?php if($dades["estat"]==1){echo "COBRAT";}else{echo "PENDENT";}?></div>
				<div class="cella" style="width:30px;"><?php if($dades["estat"]==1){?><img src="img/icona_pagat_petit.png" width="20" height="16" /><?php }else{?><img src="img/icona_pendent_petit.png" width="20" height="16" /><?php }?></div>
				<div class="cella" style="width:31px;<?php if($dades["estat"]!=1){echo "color:#fff;background-color:#CD161C";}?>"><?php echo str_replace(".",",",$dades["import"]);?></div>
    </a>
	  <?php }while($dades = mysql_fetch_assoc($detall));
	}?>
    </div>
    
</div></div>
<div class="header"><h3>DETALL OPERACIO</h3><h2 id="totaltiquet"></h2></div>
<div class="caixa" style="height:295px;"><img id="imatge_tiquet" src="img/temp_home_dreta2.png" width="283" height="282" style="display:none" /></div>

   </div>