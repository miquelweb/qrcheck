<?php
# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$hostname_qrcheck = "localhost";
$database_qrcheck = "qrcheck";
$username_qrcheck = "qrcheck";
$password_qrcheck = "123456";
$qrcheck = mysql_pconnect($hostname_qrcheck, $username_qrcheck, $password_qrcheck) or trigger_error(mysql_error(),E_USER_ERROR); 
mysql_select_db($database_qrcheck, $qrcheck);


?>