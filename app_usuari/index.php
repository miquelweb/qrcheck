<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;">
    <meta name="apple-mobile-web-app-capable" content="yes" />  
        <meta name="apple-mobile-web-app-status-bar-style" content="black" />  
        <link rel="apple-touch-icon" href="img/icono-usuari.png"/> 
        <link rel="apple-touch-startup-image" href="img/startup.png" />
<title>QRCheck</title>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/estils.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function onEnter(ev)
 {  if(ev==13)
    { document.forms["login"].submit();
    } 
 }
</script>
</head>

<body>
<div id="contingut" style="background:url(img/fonslogin.png)">
<div id="formlogin">
<form name="login" method="post" action="principal.php">
<input type="text" name="usuari" />
<input type="password" name="password" onKeyUp="onEnter(event.keyCode);"  />
</form>
</div>
</div>
</body>
</html>