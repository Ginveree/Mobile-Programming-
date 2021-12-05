
<?php

try{
$connection = new PDO('mysql:host=localhost,dbname+id18068456_flutterserver','id18068456_flutteruser','t*=6G6nI*C)UbOF/');
$connection -> setAttribute(\PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
echo "Connected";
}catch(PDOException $exc){
echo $exc - getMessage();
die("could not connect");
}
?>