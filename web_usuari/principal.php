<?php 
session_start();
include('Connections/qrcheck.php');
 mysql_select_db($database_qrcheck, $qrcheck);
$query = "SELECT * FROM usuaris WHERE loginusuari='".$_POST["nom"]."' and passwordusuari='".$_POST["password"]."'";	
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
if($total>0){
	$_SESSION["usuari"]=$dades["codiusuari"];	
}
else{?>
		<script language="javascript">
			document.location.href="index.php?accio=error";
		</script>
<?php }
?>
<?php include("funcions.php"); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>QRcheck - Edició usuari</title>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/estils.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.7.3.custom.css" rel="stylesheet" type="text/css" />
<link href="css/mobiscroll.core-2.0.2.css" rel="stylesheet" type="text/css" />
 <link rel="stylesheet" href="css/farbtastic.css" type="text/css" />
<script language="javascript" src="js/jquery-1.8.0.min.js"></script>
<script language="javascript" src="js/jquery-ui-1.7.3.custom.min.js"></script>
	<script src="js/mobiscroll-2.0.2.custom.min.js" type="text/javascript"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"
      type="text/javascript"></script>

<script src="js/infobox.js" type="text/javascript"></script>
<script language="javascript" src="js/funcions.js"></script>
<script language="javascript">

</script>
</head>

<body onLoad="initialize()">
<div id="interna" style="display:none"></div>
<div id="superior2">
  <div id="contingutsuperior1">
  <div id="nompob"><a href="index.php"><img src="img/edicio_usuari.png" width="140" height="48" /></a></div>
  <div id="menusuperior">
<a href="home.php" onClick="$('#contingut').load('home.php');return false"><img id="menu_home" src="img/menu_home_o.png" width="48" height="48" /></a><a href="terminals.php" onClick="$('#contingut').load('terminals.php');return false"><img id="menu_terminals" src="img/menu_terminals.png" width="48" height="48" alt="GESTIO" /></a><a href="operacions.php" onClick="$('#contingut').load('operacions.php');return false"><img id="menu_operacions" src="img/menu_operacions.png" width="48" height="48" alt="GESTIO" /></a><a href="usuaris.php" onClick="$('#contingut').load('usuaris.php');return false"><img id="menu_usuaris" src="img/menu_usuaris.png" width="48" height="48" /></a>
<div id="mifas"></div>
  </div>
    <div id="logout">
      <a href="index.php"><img src="img/logo_superior.png" width="259" height="48" /></a>
      </div>
  </div>
</div>
<div id="contingut">
  <?php include("home.php"); ?>
</div>
<div id="peu">
<p>QRCheck | FinApps Party 2012</p>
</div>
<script language="javascript">
$("#buida").html("");
</script>
</body>
</html>