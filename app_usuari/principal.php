<?php
session_start();
require_once('Connections/qrcheck.php');
if(isset($_POST["usuari"])){
	$query = "SELECT * FROM usuaris where loginusuari='".$_POST["usuari"]."' and passwordusuari='".$_POST["password"]."' LIMIT 1";
	$detall=mysql_query($query, $qrcheck) or die(mysql_error());
	$dades = mysql_fetch_assoc($detall);
	$total=mysql_num_rows($detall);
	if($total>0){
		$_SESSION["usuari"]=$dades["codiusuari"];
	}
}
if(isset($_POST["pin"])){
	$service_url = 'http://finappsapi.bdigital.org/api/2012/a12fef73cb/026-a97b-f22a009aeccb/operations/account/transfer';
 $headers = array('Accept: application/json','Content-Type: application/json');
       $curl = curl_init($service_url);
       $curl_post_data = '{"originAccount": "2100 1111 53 0000000177", "destinationAccount":"2100 1111 44 0000000183", "value":5.20, "additionalData": {"concept":"Transferencia test", "payee":"menix"} }';
	   curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	   //curl_setopt($curl, CURLOPT_USERPWD, "mviladomat:123456");
	   curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
       curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);
       $curl_response = curl_exec($curl);
       curl_close($curl);
	   
	   $resultat=mysql_query('insert into operacions (codicomerc,codiclient,coditiquet,import,estat,dataoperacio) values(1,1,125842,5.20,1,now())' , $qrcheck) or die(mysql_error());
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
    <meta name="apple-mobile-web-app-capable" content="yes" />  
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />  
        <link rel="apple-touch-icon" href="img/icon.png"/> 
<title>QRCheck</title>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/estils.css" rel="stylesheet" type="text/css" />

<script language="javascript" src="js/jquery-1.5.js"></script>
</head>

<body>
<form name="genera" method="post" action="generaqr.php">
</form>
<form name="tiquets" method="post" action="tiquets.php">
</form>
<div id="contingut" style="background:url(img/fons_home.png);">
<div id="botoconfig"><a href="#"><img src="img/boto_config.png" width="92" height="92" /></a></div>
<div id="botogenera"><a href="#" onclick="document.forms['genera'].submit();return false;"><img src="img/boto_genera.png" width="132" height="132" /></a></div>
<div id="bototiquets"><a href="#" onclick="document.forms['tiquets'].submit();return false;"><img src="img/boto_tiquets.png" width="92" height="92" /></a></div>
</div>
<div id="modalpagament"><a href="#" onclick="$('#modalpagament').hide();"><img src="img/modal_pagament.png" width="318" height="478" /></a></div>
<?php if(isset($_POST["pin"])){?>
<script language="javascript">
$("#modalpagament").show();
</script>

<?php }?>
</body>
</html>