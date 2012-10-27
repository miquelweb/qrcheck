<?php session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>QRcheck - Edicio usuari</title>
<link href="css/reset.css" rel="stylesheet" type="text/css" />
<link href="css/estils.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
<script language="javascript" src="js/jquery-1.5.js"></script>
<script type="text/javascript">
function onEnter(ev)
 {  if(ev==13)
    { 
		document.formlogin.submit();
	} 
 }
</script>

</head>

<body>
  <div id="contingut"> 
  <div id="inici"> 
    <img src="img/login_qr.png" width="144" height="144" style="margin-right:20px; display:block;position:relative;float:left;" />
  <form method="post" action="principal.php" name="formlogin" id="formlogin">
      <input type="text" name="nom" placeholder="USER"  style="margin-top:42px" />
      <input type="password" name="password" placeholder="PASSWORD" onKeyUp="onEnter(event.keyCode);" />
      
      
      <input type="hidden" name="accio" value="login" />
    <div id="missatgeerrorlogin">
    <?php if($_GET["accio"]=="error"){?>
    Usuari i/o password incorrectes.
    <?php }?>
    </div>
</form>
</div>

</div>

</body>
</html>