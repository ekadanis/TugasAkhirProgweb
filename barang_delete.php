<?php

include 'connection.php';
session_start();
include 'authcheck.php';

if(isset($_GET['id'])){

    $id = $_GET['id'];
    $sql = "DELETE FROM barang WHERE id_barang='$id' ";
    pg_query($connection, $sql);
    $_SESSION['delete'] = 'Berhasil Menghapus Data';
    header("location:barang.php");
}

?>