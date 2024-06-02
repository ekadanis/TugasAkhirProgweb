<?php 
include 'connection.php';
session_start();
include 'authcheck_kasir.php';

$id_barang = $_GET['id_barang'];
// var_dump($id_barang);

$cart = $_SESSION['cart'];
// print_r($cart);

// berfungsi untuk mengambil data secara spesifik
$k = array_filter($cart, function($var) use ($id_barang){
    return ($var['id_barang'] == $id_barang);
});
// print_r($k);

foreach ($k as $key => $value){
    unset($_SESSION['cart'][$key]);
}

// mengembalikan urutan data
$_SESSION['cart'] = array_values($_SESSION['cart']);

header('location:kasir.php');

?>