<?php
session_start();
require_once('Connections/qrcheck.php');
 mysql_select_db($database_qrcheck, $qrcheck);
$query = "SELECT SUM(import) as total FROM operacions WHERE codicomerc='".$_SESSION["comerc"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
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

<script language="javascript" src="js/jquery-1.5.1.js"></script>
</head>

<body style="background-image:url(img/generaqr.png);background-repeat:no-repeat;">
<div id="contingut"> 
<form name="tiquets_detall" method="post" action="tiquets_detall.php">
</form>
<div class="taula">
<div class="headertaula"> 
            <div class="cella" style="width:61px;">TIQUET</div>
            <div class="cella" style="width:46px;">HORA</div>
            <div class="cella" style="width:60px;">IMPORT</div>
            <div class="cella" style="width:113px;">ESTAT</div>
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
            <a class="fila<?php echo $classe;?>" href="#" onclick="document.forms['tiquets_detall'].submit();return false;">
     <div class="cella" style="width:61px;"><?php echo $dades["coditiquet"];?></div>
     <div class="cella" style="width:46px;"><?php echo date("h:i",strtotime($dades["dataoperacio"]));?></div>
			<div class="cella" style="width:60px;"><?php echo str_replace(".",",",$dades["import"]);?></div>
			<div class="cella" style="width:74px;<?php if($dades["estat"]!=1){echo "color:#fff;background-color:#CD161C";}?>"><?php if($dades["estat"]==1){echo "COBRAT";}else{echo "PENDENT";}?></div>
				<div class="cella" style="width:26px;padding-top: 5px;padding-bottom: 5px;"><img src="img/fletxadetall.png" width="29" height="29" /></div>
    </a>
	  <?php }while($dades = mysql_fetch_assoc($detall));
	}?>
    </div>
    
</div>
<form name="principal" method="post" action="principal.php">
</form>
<div id="botofletxa"><a href="#" onclick="document.forms['principal'].submit();return false;"><img src="img/boto_fletxa.png" width="320" height="65" /></a></div>

</div>
</body>
</html>