<?php
session_start();
require_once('Connections/qrcheck.php');
$query = "SELECT * FROM operacions where codicomerc='".$_SESSION["comerc"]."'";
$detall=mysql_query($query, $qrcheck) or die(mysql_error());
$dades = mysql_fetch_assoc($detall);
$total=mysql_num_rows($detall);
	if($total>4){
		//$_SESSION["avisos"]=1;?>
		<script language="javascript">
			$("#modalpagament").show();
		</script>
	<?php }
	else{?>
<script language="javascript">
setTimeout("comprovapagament()",1000);
</script>
	<?php }
?>

