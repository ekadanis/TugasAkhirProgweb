<?php
include 'connection.php';
session_start();
include 'authcheck_kasir.php';

$qty = $_POST['qty'];

$qty = array_reverse($qty);

foreach ($_SESSION['cart'] as $key => $value) {
    $_SESSION['cart'][$key]['qty'] = $qty[$key];
}
header('location:kasir.php');
