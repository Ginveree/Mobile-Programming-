<?php
require('connection.php');
$makeQuery = "SELECT * FROM login";

$statement =$connection->prepare($makeQuery);

$statement -> execute();

$array = array();

while($resultFrom = $statement->fetch()){
    array_push(
        $myarray,array(
            "id"=>$resultFrom['id'],
            "username"=>$resultFrom['username'],
            "password"=>$resultFrom['password'],
            "email"=>$resultFrom['email'],
    );)
}
echo json_encode($myarray);
?>