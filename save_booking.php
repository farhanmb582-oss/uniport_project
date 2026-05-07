<?php

include "connect.php";

$name = $_POST['name'];
$phone = $_POST['phone'];
$seat = $_POST['seat'];

$sql = "INSERT INTO booking(name, phone, seat)
VALUES('$name','$phone','$seat')";

if(mysqli_query($conn, $sql)){
    echo "Booking Successful";
}
else{
    echo "Failed";
}

?>