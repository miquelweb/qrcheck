<?php
session_start();
require_once('Connections/qrcheck.php');
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
<form name="genera" method="post" action="genera.php">
</form>
<form name="principal" method="post" action="principal.php">
</form>
<div id="botocancela"><a href="#" onclick="document.forms['genera'].submit();return false;"><img src="img/boto_cancela.png" width="288" height="47" /></a></div>
<div id="botofletxa"><a href="#" onclick="document.forms['principal'].submit();return false;"><img src="img/boto_fletxa.png" width="320" height="65" /></a></div>

</div>
</body>
</html>