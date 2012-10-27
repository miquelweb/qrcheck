<?php function tallartext($entrada,$mida){
	$contador = 0;
	$arrayText = split(' ',$entrada);
	$sortida = '';
	while($mida >= strlen($sortida) + strlen($arrayText[$contador])){	
		$sortida .= ' '.$arrayText[$contador];
		$contador++;
	}
	echo $sortida;
	if(strlen($sortida)<strlen($entrada)){
		echo "...";
	}
}
function tallartextcaracter($entrada,$mida){
	$sortida=$entrada;
	if(strlen($entrada)>$mida){
		$sortida=substr($entrada,0,$mida);
	}
	echo $sortida;
	if(strlen($sortida)<strlen($entrada)){
		echo "...";
	}
}
function formatejar($entrada){
$inicial=array("í");
$final=array("&iacute");
echo str_replace($inicial,$final,$entrada);	
}?>