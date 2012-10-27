<?php
session_start();
require_once('Connections/qrcheck.php');
if(isset($_POST["usuari"])){
	$query = "SELECT * FROM comercos where usuaricomerc='".$_POST["usuari"]."' and passwordcomerc='".$_POST["password"]."' LIMIT 1";
	$detall=mysql_query($query, $qrcheck) or die(mysql_error());
	$dades = mysql_fetch_assoc($detall);
	$total=mysql_num_rows($detall);
	if($total>0){
		$_SESSION["comerc"]=$dades["codicomerc"];
	}
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
<script language="javascript">
function comprovapagament(){
	$("#caixacontenidora").load("modalpagament.php")
}
</script>
</head>

<body>
<form name="genera" method="post" action="genera.php">
</form>
<form name="tiquets" method="post" action="tiquets.php">
</form>
<div id="contingut" style="background:url(img/fons_home.png);">
<div id="botoconfig"><a href="#"><img src="img/boto_config.png" width="92" height="92" /></a></div>
<div id="botogenera"><a href="#" onclick="document.forms['genera'].submit();return false;"><img src="img/boto_genera.png" width="132" height="132" /></a></div>
<div id="bototiquets"><a href="#" onclick="document.forms['tiquets'].submit();return false;"><img src="img/boto_tiquets.png" width="92" height="92" /></a></div>

</div>
<div id="caixacontenidora"></div>
<div id="modalpagament"><a href="#" onclick="$('#modalpagament').hide();"><img src="img/modal_pagament.png" width="318" height="478" /></a></div>
<script language="javascript">
setTimeout("comprovapagament()",1000);
</script>
</body>
</html>